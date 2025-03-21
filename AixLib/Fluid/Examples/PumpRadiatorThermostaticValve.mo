within AixLib.Fluid.Examples;
model PumpRadiatorThermostaticValve
  "Example of a simple heating system with radiator and thermostatic valve"
  import AixLib;
  extends Modelica.Icons.Example;

  package Medium = AixLib.Media.Water;

  AixLib.Obsolete.Year2021.Fluid.Movers.Pump pump(
    MinMaxCharacteristics=AixLib.DataBase.Pumps.Pump1(),
    V_flow_max=2,
    ControlStrategy=2,
    V_flow(fixed=false),
    redeclare package Medium = Medium,
    m_flow_small=1e-4) annotation (Placement(transformation(extent={{-54,10},{-34,30}})));
  AixLib.Fluid.FixedResistances.PressureDrop pipe(
    redeclare package Medium = Medium,
    dp_nominal=200,
    m_flow_nominal=0.1)
    annotation (Placement(transformation(extent={{4,10},{24,30}})));
  AixLib.Fluid.FixedResistances.PressureDrop pipe1(
    redeclare package Medium = Medium,
    dp_nominal=200,
    m_flow_nominal=0.1)
    annotation (Placement(transformation(extent={{-10,-30},{-30,-10}})));
  Modelica.Blocks.Sources.BooleanConstant NightSignal(k = false) annotation(Placement(transformation(extent = {{-76, 50}, {-56, 70}})));
  inner AixLib.Utilities.Sources.BaseParameters baseParameters
    annotation (Placement(transformation(extent={{-100,80},{-80,100}})));
  AixLib.Fluid.Sources.Boundary_pT
                     PointFixedPressure(nPorts=1, redeclare package Medium =
        Medium)                                           annotation(Placement(transformation(extent = {{-98, 10}, {-78, 30}})));
  AixLib.Obsolete.Year2021.Fluid.Actuators.Valves.ThermostaticValve simpleValve(
    Influence_PressureDrop=0.15,
    Kvs=0.4,
    Kv_setT=0.12,
    leakageOpening=0,
    redeclare package Medium = Medium,
    m_flow_small=1e-4,
    dp(start=20000)) annotation (Placement(transformation(extent={{32,10},{52,30}})));
  AixLib.Fluid.HeatExchangers.Radiators.Radiator radiator(
    redeclare package Medium = Medium,
    m_flow_nominal=0.01,
    selectable=true,
    radiatorType=
        AixLib.DataBase.Radiators.Standard_MFD_WSchV1984_OneAppartment.Radiator_Kitchen())
    annotation (Placement(transformation(extent={{112,10},{134,30}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature AirTemp annotation(Placement(transformation(extent = {{100, 58}, {112, 70}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature RadTemp annotation(Placement(transformation(extent = {{148, 58}, {136, 70}})));
  Modelica.Blocks.Sources.Constant Source_Temp(k = 273.15 + 20) annotation(Placement(transformation(extent = {{56, 80}, {76, 100}})));
  Modelica.Blocks.Sources.Sine Source_opening(freqHz = 1 / 86400, amplitude = 1, startTime = 0, offset = 273.15 + 18.5) annotation(Placement(transformation(extent = {{10, 60}, {30, 80}})));
  Modelica.Blocks.Sources.Constant Source_TempSet_Boiler(k = 273.15 + 75) annotation(Placement(transformation(extent = {{0, 60}, {-20, 80}})));
  AixLib.Fluid.HeatExchangers.Heater_T       hea(
    redeclare package Medium = Medium,
    m_flow_nominal=0.01,
    dp_nominal=0)
    annotation (Placement(transformation(extent={{-26,10},{-6,30}})));
equation
  connect(pipe1.port_b, pump.port_a) annotation(Line(points = {{-30, -20}, {-60, -20}, {-60, 20}, {-54, 20}}, color = {0, 127, 255}));
  connect(NightSignal.y, pump.IsNight) annotation(Line(points = {{-55, 60}, {-44, 60}, {-44, 30.2}}, color = {255, 0, 255}));
  connect(pipe.port_b, simpleValve.port_a) annotation(Line(points = {{24, 20}, {32, 20}}, color = {0, 127, 255}));
  connect(simpleValve.port_b, radiator.port_a) annotation(Line(points={{52,20},{
          112,20}},                                                                               color = {0, 127, 255}));
  connect(radiator.port_b, pipe1.port_a) annotation(Line(points={{134,20},{160,20},
          {160,-20},{-10,-20}},                                                                                      color = {0, 127, 255}));
  connect(Source_Temp.y, AirTemp.T) annotation(Line(points = {{77, 90}, {98.8, 90}, {98.8, 64}}, color = {0, 0, 127}));
  connect(Source_Temp.y, RadTemp.T) annotation(Line(points = {{77, 90}, {150, 90}, {150, 64}, {149.2, 64}}, color = {0, 0, 127}));
  connect(Source_Temp.y, simpleValve.T_room) annotation(Line(points = {{77, 90}, {80, 90}, {80, 44}, {35.6, 44}, {35.6, 29.8}}, color = {0, 0, 127}));
  connect(Source_opening.y, simpleValve.T_setRoom) annotation(Line(points = {{31, 70}, {47.6, 70}, {47.6, 29.8}}, color = {0, 0, 127}));
  connect(PointFixedPressure.ports[1], pump.port_a) annotation (Line(
      points={{-78,20},{-54,20}},
      color={0,127,255}));
  connect(pipe.port_a, hea.port_b)
    annotation (Line(points={{4,20},{-6,20}}, color={0,127,255}));
  connect(pump.port_b, hea.port_a)
    annotation (Line(points={{-34,20},{-26,20}}, color={0,127,255}));
  connect(hea.TSet, Source_TempSet_Boiler.y) annotation (Line(points={{-28,28},
          {-34,28},{-34,70},{-21,70}}, color={0,0,127}));
  connect(AirTemp.port, radiator.ConvectiveHeat) annotation (Line(points={{112,
          64},{116,64},{116,22},{120.8,22}}, color={191,0,0}));
  connect(radiator.RadiativeHeat, RadTemp.port) annotation (Line(points={{127.4,
          22},{132,22},{132,64},{136,64}}, color={95,95,95}));
  annotation(Diagram(coordinateSystem(extent={{-100,-100},{160,100}},      preserveAspectRatio=false)),             Icon(coordinateSystem(extent = {{-100, -100}, {160, 100}})), experiment(StopTime = 86400, Interval = 60), Documentation(info = "<html><p>
  This model contains a simple model of a heating system, with a pump,
  ideal heat source, pipes, thermostatic valve and radiator. It serves
  as a demonstration case of how components of the <code>AixLib</code>
  library can be used.
</p>
<ul>
  <li>
    <i>April 25, 2017</i> by Peter Remmen:<br/>
    Move Example from <code>Fluid.HeatExchangers.Examples</code> to
    <code>Fluid.Examples</code>
  </li>
</ul>
<ul>
  <li>
    <i>October 11, 2016</i> by Marcus Fuchs:<br/>
    Replace pipe
  </li>
</ul>
</html>"));
end PumpRadiatorThermostaticValve;
