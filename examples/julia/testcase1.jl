###This module is an example julia-based testing interface.  It uses the
###``requests`` package to make REST API calls to the test case container,
###which mus already be running.  A controller is tested, which is
###imported from a different module.


# GENERAL PACKAGE IMPORT
# ----------------------
using HTTP, JSON, CSV, DataFrames, Dates

# TEST CONTROLLER IMPORT
# ----------------------
include("./controllers.jl")
using .PID

# SETUP TEST CASE
# ---------------
# Set URL for testcase
url = "http://127.0.0.1:5000"
length = 48 * 3600
step = 300
# ---------------

# GET TEST INFORMATION
# --------------------
println("TEST CASE INFORMATION ------------- \n")
# Test case name
name = JSON.parse(String(HTTP.get("$url/name").body))
if name["message"] == "success"
    println("Name:\t\t\t$name['result']")
end
# Inputs available
inputs = JSON.parse(String(HTTP.get("$url/inputs").body))
if inputs["message"] == "success"
    println("Control Inputs:\t\t\t$inputs['result']")
end
# Measurements available
measurements = JSON.parse(String(HTTP.get("$url/measurements").body))
if measurements["message"] == "success"
    println("Measurements:\t\t\t$measurements['result']")
end 

# Default simulation step
step_def = JSON.parse(String(HTTP.get("$url/step").body))
if step_def["message"] == "success"
    println("Default Simulation Step:\t$step_def")
end 

# RUN TEST CASE
#----------
start = Dates.now()
# Initialize test case simulation
res = HTTP.put("$url/initialize",["Content-Type" => "application/json"], JSON.json(Dict("start_time" => 0,"warmup_period" => 0)))
initialize_result=JSON.parse(String(res.body))
if !isnothing(initialize_result)
   println("Successfully initialized the simulation")
end


# Set simulation step

res = HTTP.put("$url/step",["Content-Type" => "application/json"], JSON.json(Dict("step" => step)))
if res["message"] == "success"
   println("Setting simulation step to $step")
end

println("Running test case ...")


# simulation loop
for i = 1:convert(Int, floor(length/step))
    if i<2
    # Initialize u
       u = PID.initialize()
    else
    # Compute next control signal
       u = PID.compute_control(y)
    end
    # Advance in simulation
    res=HTTP.post("$url/advance", ["Content-Type" => "application/json"], JSON.json(u);retry_non_idempotent=true).body
    global y = JSON.parse(String(res))
	if y["message"] == "success"
	    y = y["result"]
        println("Successfully advanced the simulation")
    end
end
println("Test case complete.")

# VIEW RESULTS
# ------------
# Report KPIs
kpi = JSON.parse(String(HTTP.get("$url/kpi").body))
if kpi["message"] == "success"
kpi = kpi["result"]
end
println("KPI RESULTS \n-----------")
for key in keys(kpi)
   println("$key: $(kpi[key])")
end

# ------------
# POST PROCESS RESULTS
# --------------------
# Get result data
res = JSON.parse(String(HTTP.put("$url/results", ["Content-Type" => "application/json","connecttimeout"=>30.0], JSON.json(Dict("point_name" => "TRooAir_y","start_time" => 0, "final_time" => length));retry_non_idempotent=true).body))
time = [x/3600 for x in res["result"]["time"]] # convert s --> hr
TZone = [x-273.15 for x in res["result"]["TRooAir_y"]] # convert K --> C
res = JSON.parse(String(HTTP.put("$url/results", ["Content-Type" => "application/json","connecttimeout"=>30.0], JSON.json(Dict("point_name" => "CO2RooAir_y","start_time" => 0, "final_time" => length));retry_non_idempotent=true).body))
CO2Zone = [x for x in res["result"]["CO2RooAir_y"]]
res = JSON.parse(String(HTTP.put("$url/results", ["Content-Type" => "application/json","connecttimeout"=>30.0], JSON.json(Dict("point_name" => "PHea_y","start_time" => 0, "final_time" => length));retry_non_idempotent=true).body))
PHeat = res["result"]["PHea_y"]
res = JSON.parse(String(HTTP.put("$url/results", ["Content-Type" => "application/json","connecttimeout"=>30.0], JSON.json(Dict("point_name" => "oveAct_u","start_time" => 0, "final_time" => length));retry_non_idempotent=true).body))
QHeat = res["result"]["oveAct_u"]
res = JSON.parse(String(HTTP.put("$url/results", ["Content-Type" => "application/json","connecttimeout"=>30.0], JSON.json(Dict("point_name" => "oveAct_activate","start_time" => 0, "final_time" => length));retry_non_idempotent=true).body))
uAct = res["result"]["oveAct_activate"]
tab_res=DataFrame([time,TZone,CO2Zone,PHeat,QHeat,uAct],[:time,:TRooAir_y,:CO2RooAir_y,:PHea_y,:oveAct_u,:oveAct_activate])
CSV.write("result_testcase1.csv",tab_res)
tab_kpi = DataFrame([[kpi["ener_tot"]], [kpi["tdis_tot"]], [kpi["idis_tot"]], [kpi["cost_tot"]], [kpi["time_rat"]], [kpi["emis_tot"]]], [:ener_tot, :tdis_tot, :idis_tot, :cost_tot, :time_rat, :emis_tot])
CSV.write("kpi_testcase1.csv",tab_kpi)
