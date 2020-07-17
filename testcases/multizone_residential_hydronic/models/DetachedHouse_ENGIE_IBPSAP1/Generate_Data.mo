within DetachedHouse_ENGIE_IBPSAP1;
model Generate_Data
  extends Modelica.Icons.Example;
  // Living room
  parameter Modelica.SIunits.Area S_Salon = 30.32;

  // Room 1
  parameter Modelica.SIunits.Area S_Chambre1 = 11.16;

  // Room 2
  parameter Modelica.SIunits.Area S_Chambre2 = 9.85;

  // Room 3
  parameter Modelica.SIunits.Area S_Chambre3 = 14.28;

  Building.Schedules.Schedules_MI_ZoneJour schedules_MI_ZoneJour(delta_ST=0)
    annotation (Placement(transformation(extent={{-64,6},{-42,28}})));
  Building.Schedules.Schedules_MI_ZoneNuit schedules_MI_ZoneNuit(delta_ST=0)
    annotation (Placement(transformation(extent={{-64,-32},{-42,-10}})));
  Building.Gains.Q_conv_3 q_conv_Jour
    annotation (Placement(transformation(extent={{-24,18},{-12,28}})));
  Building.Gains.Q_rad_5 q_rad_Jour
    annotation (Placement(transformation(extent={{-24,4},{-12,14}})));
  Building.Gains.Q_conv_3 q_conv_Nuit
    annotation (Placement(transformation(extent={{-24,-20},{-12,-10}})));
  Building.Gains.Q_rad_5 q_rad_Nuit
    annotation (Placement(transformation(extent={{-24,-34},{-12,-24}})));
  Modelica.Blocks.Sources.RealExpression realExpression6(y=q_rad_Jour.Q_rad)
    annotation (Placement(transformation(extent={{20,44},{26,50}})));
  Modelica.Blocks.Sources.RealExpression realExpression7(y=q_conv_Jour.Q_conv)
    annotation (Placement(transformation(extent={{20,40},{26,46}})));
  Modelica.Blocks.Sources.Constant qLat_Chambre4(k=0) "Latent heat gain"
    annotation (Placement(transformation(extent={{22,36},{26,40}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_Chambre4
    annotation (Placement(transformation(extent={{32,42},{36,46}})));
  Modelica.Blocks.Sources.RealExpression realExpression1(y=q_rad_Nuit.Q_rad)
    annotation (Placement(transformation(extent={{26,24},{32,30}})));
  Modelica.Blocks.Sources.RealExpression realExpression2(y=q_conv_Nuit.Q_conv)
    annotation (Placement(transformation(extent={{26,20},{32,26}})));
  Modelica.Blocks.Sources.Constant qLat_Chambre1(k=0) "Latent heat gain"
    annotation (Placement(transformation(extent={{28,16},{32,20}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_Chambre1
    annotation (Placement(transformation(extent={{38,22},{42,26}})));
  Modelica.Blocks.Sources.RealExpression realExpression3(y=q_rad_Nuit.Q_rad)
    annotation (Placement(transformation(extent={{28,-4},{34,2}})));
  Modelica.Blocks.Sources.RealExpression realExpression4(y=q_conv_Nuit.Q_conv)
    annotation (Placement(transformation(extent={{28,-8},{34,-2}})));
  Modelica.Blocks.Sources.Constant qLat_Chambre2(k=0) "Latent heat gain"
    annotation (Placement(transformation(extent={{30,-12},{34,-8}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_Chambre2
    annotation (Placement(transformation(extent={{40,-6},{44,-2}})));
  Modelica.Blocks.Sources.RealExpression realExpression5(y=q_rad_Nuit.Q_rad)
    annotation (Placement(transformation(extent={{30,-30},{36,-24}})));
  Modelica.Blocks.Sources.RealExpression realExpression8(y=q_conv_Nuit.Q_conv)
    annotation (Placement(transformation(extent={{30,-34},{36,-28}})));
  Modelica.Blocks.Sources.Constant qLat_Chambre3(k=0) "Latent heat gain"
    annotation (Placement(transformation(extent={{32,-38},{36,-34}})));
  Modelica.Blocks.Routing.Multiplex3 multiplex3_Chambre3
    annotation (Placement(transformation(extent={{42,-32},{46,-28}})));
  Building.Schedules.Schedules_RT2012_MI schedules_RT2012_MI
    annotation (Placement(transformation(extent={{-64,54},{-44,76}})));
  IBPSA.Utilities.IO.SignalExchange.Read reaTSetHea(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="K"),
    description="Zone setpoint temperature")
    annotation (Placement(transformation(extent={{-24,74},{-18,80}})));
  IBPSA.Utilities.IO.SignalExchange.Read reaTSetCoo(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="K"),
    description="Zone setpoint temperature")
    annotation (Placement(transformation(extent={{-24,64},{-18,70}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiSalRad(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{74,54},{80,60}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiSalCon(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{76,46},{82,52}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiSalLat(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{78,38},{84,44}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiRo1Rad(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{78,26},{84,32}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiRo1Con(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{80,18},{86,24}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiRo1Lat(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{82,10},{88,16}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiRo2Rad(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{82,0},{88,6}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiRo2Con(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{84,-8},{90,-2}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiRo2Lat(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{86,-16},{92,-10}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiRo3Rad(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{84,-26},{90,-20}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiRo3Con(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{86,-34},{92,-28}})));
  IBPSA.Utilities.IO.SignalExchange.Read heaGaiRo3Lat(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="heat gains")
    annotation (Placement(transformation(extent={{88,-42},{94,-36}})));
  Modelica.Blocks.Sources.RealExpression realExpression9(y=
        schedules_MI_ZoneNuit.OccupRateRT12*1)
    annotation (Placement(transformation(extent={{-2,-82},{4,-76}})));
  Modelica.Blocks.Sources.RealExpression realExpression10(y=
        schedules_MI_ZoneNuit.OccupRateRT12*1)
    annotation (Placement(transformation(extent={{-2,-74},{4,-68}})));
  Modelica.Blocks.Sources.RealExpression realExpression11(y=
        schedules_MI_ZoneNuit.OccupRateRT12*2)
    annotation (Placement(transformation(extent={{-2,-88},{4,-82}})));
  Modelica.Blocks.Sources.RealExpression realExpression12(y=
        schedules_MI_ZoneJour.OccupRateRT12*4)
    annotation (Placement(transformation(extent={{-2,-68},{4,-62}})));
  IBPSA.Utilities.IO.SignalExchange.Read occSal(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="occupancy")
    annotation (Placement(transformation(extent={{14,-66},{20,-60}})));
  IBPSA.Utilities.IO.SignalExchange.Read occRo1(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="occupancy")
    annotation (Placement(transformation(extent={{14,-74},{20,-68}})));
  IBPSA.Utilities.IO.SignalExchange.Read occRo2(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="occupancy")
    annotation (Placement(transformation(extent={{14,-82},{20,-76}})));
  IBPSA.Utilities.IO.SignalExchange.Read occRo3(
    KPIs=IBPSA.Utilities.IO.SignalExchange.SignalTypes.SignalsForKPIs.None,
    y(unit="W"),
    description="occupancy")
    annotation (Placement(transformation(extent={{14,-90},{20,-84}})));
protected
  Buildings.ThermalZones.Detailed.BaseClasses.HeatGain heaGaiSal(final AFlo=
        S_Salon)
    "Model to convert internal heat gains"
    annotation (Placement(transformation(extent={{46,36},{60,50}})));
  Buildings.ThermalZones.Detailed.BaseClasses.HeatGain heaGaiRo1(final AFlo=
        S_Chambre1)
    "Model to convert internal heat gains"
    annotation (Placement(transformation(extent={{52,16},{66,30}})));
  Buildings.ThermalZones.Detailed.BaseClasses.HeatGain heaGaiRo2(final AFlo=
        S_Chambre2)
    "Model to convert internal heat gains"
    annotation (Placement(transformation(extent={{54,-12},{68,2}})));
  Buildings.ThermalZones.Detailed.BaseClasses.HeatGain heaGaiRo3(final AFlo=
        S_Chambre3)
    "Model to convert internal heat gains"
    annotation (Placement(transformation(extent={{56,-38},{70,-24}})));
equation
  connect(q_conv_Jour.Occupation,schedules_MI_ZoneJour. OccupRateRT12)
    annotation (Line(points={{-25.2,23.4},{-34,23.4},{-34,15.8},{-42,15.8}},
        color={0,0,127}));
  connect(q_rad_Jour.Occupation,schedules_MI_ZoneJour. OccupRateRT12)
    annotation (Line(points={{-25.2,9.875},{-30,9.875},{-30,15.8},{-42,15.8}},
                  color={0,0,127}));
  connect(q_rad_Jour.Eclairage,schedules_MI_ZoneJour. LightRT12)
    annotation (Line(points={{-25.2,7.375},{-34,7.375},{-34,12.8},{-42,12.8}},
                  color={0,0,127}));
  connect(q_rad_Jour.Autres,schedules_MI_ZoneJour. OtherLoadsRateRT12)
    annotation (Line(points={{-25.2,5.125},{-38,5.125},{-38,9.6},{-42,9.6}},
                  color={0,0,127}));
  connect(schedules_MI_ZoneNuit.OccupRateRT12,q_conv_Nuit. Occupation)
    annotation (Line(points={{-42,-22.2},{-34,-22.2},{-34,-14.6},{-25.2,-14.6}},
        color={0,0,127}));
  connect(q_rad_Nuit.Occupation,schedules_MI_ZoneNuit. OccupRateRT12)
    annotation (Line(points={{-25.2,-28.125},{-34,-28.125},{-34,-22.2},{-42,-22.2}},
        color={0,0,127}));
  connect(q_rad_Nuit.Eclairage,schedules_MI_ZoneNuit. LightRT12)
    annotation (Line(points={{-25.2,-30.625},{-36,-30.625},{-36,-25.2},{-42,-25.2}},
        color={0,0,127}));
  connect(q_rad_Nuit.Autres,schedules_MI_ZoneNuit. OtherLoadsRateRT12)
    annotation (Line(points={{-25.2,-32.875},{-38,-32.875},{-38,-28.4},{-42,-28.4}},
        color={0,0,127}));
  connect(qLat_Chambre4.y,multiplex3_Chambre4. u3[1]) annotation (Line(
        points={{26.2,38},{28,38},{28,42.6},{31.6,42.6}},     color={0,0,
          127}));
  connect(realExpression7.y,multiplex3_Chambre4. u2[1]) annotation (Line(
        points={{26.3,43},{28,43},{28,44},{31.6,44}},     color={0,0,127}));
  connect(multiplex3_Chambre4.u1[1],realExpression6. y) annotation (Line(
        points={{31.6,45.4},{28,45.4},{28,47},{26.3,47}},     color={0,0,
          127}));
  connect(multiplex3_Chambre4.y, heaGaiSal.qGai_flow) annotation (Line(points={{
          36.2,44},{40,44},{40,43},{44.6,43}}, color={0,0,127}));
  connect(qLat_Chambre1.y,multiplex3_Chambre1. u3[1]) annotation (Line(
        points={{32.2,18},{34,18},{34,22.6},{37.6,22.6}},     color={0,0,
          127}));
  connect(realExpression2.y,multiplex3_Chambre1. u2[1]) annotation (Line(
        points={{32.3,23},{34,23},{34,24},{37.6,24}},     color={0,0,127}));
  connect(multiplex3_Chambre1.u1[1],realExpression1. y) annotation (Line(
        points={{37.6,25.4},{34,25.4},{34,27},{32.3,27}},     color={0,0,
          127}));
  connect(multiplex3_Chambre1.y, heaGaiRo1.qGai_flow) annotation (Line(points={{
          42.2,24},{46,24},{46,23},{50.6,23}}, color={0,0,127}));
  connect(qLat_Chambre2.y,multiplex3_Chambre2. u3[1]) annotation (Line(
        points={{34.2,-10},{36,-10},{36,-5.4},{39.6,-5.4}},   color={0,0,
          127}));
  connect(realExpression4.y,multiplex3_Chambre2. u2[1]) annotation (Line(
        points={{34.3,-5},{36,-5},{36,-4},{39.6,-4}},     color={0,0,127}));
  connect(multiplex3_Chambre2.u1[1],realExpression3. y) annotation (Line(
        points={{39.6,-2.6},{36,-2.6},{36,-1},{34.3,-1}},     color={0,0,
          127}));
  connect(multiplex3_Chambre2.y, heaGaiRo2.qGai_flow) annotation (Line(points={{
          44.2,-4},{48,-4},{48,-5},{52.6,-5}}, color={0,0,127}));
  connect(qLat_Chambre3.y,multiplex3_Chambre3. u3[1]) annotation (Line(
        points={{36.2,-36},{38,-36},{38,-31.4},{41.6,-31.4}}, color={0,0,
          127}));
  connect(realExpression8.y,multiplex3_Chambre3. u2[1]) annotation (Line(
        points={{36.3,-31},{38,-31},{38,-30},{41.6,-30}}, color={0,0,127}));
  connect(multiplex3_Chambre3.u1[1],realExpression5. y) annotation (Line(
        points={{41.6,-28.6},{38,-28.6},{38,-27},{36.3,-27}}, color={0,0,
          127}));
  connect(multiplex3_Chambre3.y, heaGaiRo3.qGai_flow) annotation (Line(points={{
          46.2,-30},{50,-30},{50,-31},{54.6,-31}}, color={0,0,127}));
  connect(schedules_RT2012_MI.HeaSetRT12,reaTSetHea. u) annotation (Line(points={{-44,72},
          {-28,72},{-28,77},{-24.6,77}},              color={0,0,127}));
  connect(schedules_RT2012_MI.CooSetRT12,reaTSetCoo. u) annotation (Line(points={{-44,
          68.6},{-38,68.6},{-38,67},{-24.6,67}},          color={0,0,127}));
  connect(heaGaiSal.QRad_flow, heaGaiSalRad.u) annotation (Line(points={{61.4,47.2},
          {67.7,47.2},{67.7,57},{73.4,57}}, color={0,0,127}));
  connect(heaGaiSal.QCon_flow, heaGaiSalCon.u) annotation (Line(points={{61.4,43},
          {70,43},{70,50},{72,50},{72,49},{75.4,49}}, color={0,0,127}));
  connect(heaGaiSal.QLat_flow, heaGaiSalLat.u) annotation (Line(points={{61.4,38.8},
          {66.7,38.8},{66.7,41},{77.4,41}}, color={0,0,127}));
  connect(heaGaiRo1.QRad_flow, heaGaiRo1Rad.u) annotation (Line(points={{67.4,27.2},
          {72.7,27.2},{72.7,29},{77.4,29}}, color={0,0,127}));
  connect(heaGaiRo1.QCon_flow, heaGaiRo1Con.u)
    annotation (Line(points={{67.4,23},{79.4,23},{79.4,21}}, color={0,0,127}));
  connect(heaGaiRo1.QLat_flow, heaGaiRo1Lat.u) annotation (Line(points={{67.4,18.8},
          {74.7,18.8},{74.7,13},{81.4,13}}, color={0,0,127}));
  connect(heaGaiRo2.QRad_flow, heaGaiRo2Rad.u) annotation (Line(points={{69.4,-0.8},
          {75.7,-0.8},{75.7,3},{81.4,3}}, color={0,0,127}));
  connect(heaGaiRo2.QCon_flow, heaGaiRo2Con.u) annotation (Line(points={{69.4,-5},
          {75.7,-5},{75.7,-5},{83.4,-5}}, color={0,0,127}));
  connect(heaGaiRo2.QLat_flow, heaGaiRo2Lat.u) annotation (Line(points={{69.4,-9.2},
          {77.7,-9.2},{77.7,-13},{85.4,-13}}, color={0,0,127}));
  connect(heaGaiRo3.QRad_flow, heaGaiRo3Rad.u) annotation (Line(points={{71.4,-26.8},
          {83.4,-26.8},{83.4,-23}}, color={0,0,127}));
  connect(heaGaiRo3.QCon_flow, heaGaiRo3Con.u) annotation (Line(points={{71.4,-31},
          {78.7,-31},{78.7,-31},{85.4,-31}}, color={0,0,127}));
  connect(heaGaiRo3.QLat_flow, heaGaiRo3Lat.u) annotation (Line(points={{71.4,-35.2},
          {79.7,-35.2},{79.7,-39},{87.4,-39}}, color={0,0,127}));
  connect(realExpression12.y, occSal.u) annotation (Line(points={{4.3,-65},{8.15,
          -65},{8.15,-63},{13.4,-63}}, color={0,0,127}));
  connect(realExpression10.y, occRo1.u) annotation (Line(points={{4.3,-71},{8.15,
          -71},{8.15,-71},{13.4,-71}}, color={0,0,127}));
  connect(realExpression9.y, occRo2.u) annotation (Line(points={{4.3,-79},{9.15,
          -79},{9.15,-79},{13.4,-79}}, color={0,0,127}));
  connect(realExpression11.y, occRo3.u) annotation (Line(points={{4.3,-85},{9.15,
          -85},{9.15,-87},{13.4,-87}}, color={0,0,127}));
  annotation (
    Icon(coordinateSystem(preserveAspectRatio=false)),
    Diagram(coordinateSystem(preserveAspectRatio=false)),
    experiment(StopTime=31536000));
end Generate_Data;
