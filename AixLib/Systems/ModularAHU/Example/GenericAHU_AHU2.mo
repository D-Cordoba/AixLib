within AixLib.Systems.ModularAHU.Example;
model GenericAHU_AHU2
  "GenericAHU model with parameters of air-handling unit 2 of the E.ON ERC test hall"
  extends Modelica.Icons.Example;
  AixLib.Systems.ModularAHU.GenericAHU genericAHU(
    redeclare package Medium1 = Media.Air,
    redeclare package Medium2 = Media.Water,
    T_amb=293.15,
    m1_flow_nominal=1,
    m2_flow_nominal=0.5,
    usePreheater=true,
    useHumidifierRet=false,
    useHumidifier=true,
    perheater(
    m2_flow_nominal=2.866/3600*1000,
    tau=150,
    T_amb=293.15,
    redeclare HydraulicModules.Admix partialHydraulicModule(
      tau=5,
      dIns=0.01,
      kIns=0.028,
      d=0.025,
      length=1,
      Kv=10,
      valve(use_inputFilter=false),
      pipe1(length=1.53),
      pipe2(length=0.54),
      pipe3(length=1.06),
      pipe4(dh=0.032, length=0.48),
      pipe5(length=1.42),
      pipe6(length=0.52),
      redeclare
        AixLib.Systems.HydraulicModules.BaseClasses.PumpInterface_PumpSpeedControlled
        PumpInterface(pumpParam=
            AixLib.DataBase.Pumps.PumpPolynomialBased.Pump_DN25_H1_8_V9(),
          calculatePower=true)),
    dynamicHX(
      dp1_nominal=66,
      dp2_nominal=6000 + 8000,
      nNodes=2,
      tau1=4,
      tau2=15,
      tau_C=15,
      dT_nom=29.53,
      Q_nom=57700)),
    cooler(m2_flow_nominal=8832/3600,
    T_start=296.15,
    tau=60 + 30,
    T_amb=293.15,
    redeclare HydraulicModules.Admix partialHydraulicModule(
      tau=5,
      dIns=0.01,
      kIns=0.028,
      d=0.032,
      length=1,
      Kv=10,
      valve(use_inputFilter=false),
      pipe1(dh=0.05, length=4.5),
      pipe2(length=2.15),
      pipe3(dh=0.032, length=1.7),
      pipe4(dh=0.032, length=0.5),
      pipe5(length=2.95),
      pipe6(dh=0.025, length=0.8),
      redeclare
        AixLib.Systems.HydraulicModules.BaseClasses.PumpInterface_PumpSpeedControlled
        PumpInterface(pumpParam=
            AixLib.DataBase.Pumps.PumpPolynomialBased.Pump_DN32(),
          calculatePower=true)),
    dynamicHX(
      dp1_nominal(displayUnit="bar") = 138,
      dp2_nominal(displayUnit="bar") = 70600,
      nNodes=2,
      tau1=2,
      tau2=8,
      dT_nom=13.31,
      Q_nom=53400)),
    heater(
    m2_flow_nominal=1106/3600,
    tau=60 + 20,
    T_amb=293.15,
    redeclare HydraulicModules.Admix partialHydraulicModule(
      tau=5,
      dIns=0.01,
      kIns=0.028,
      d=0.025,
      length=1,
      Kv=6.3,
      valve(use_inputFilter=false),
      pipe1(length=3),
      pipe2(length=0.63),
      pipe3(dh=0.032, length=1.85),
      pipe4(dh=0.032, length=0.4),
      pipe5(length=2.8),
      pipe6(dh=0.015, length=0.82),
      redeclare
        AixLib.Systems.HydraulicModules.BaseClasses.PumpInterface_PumpSpeedControlled
        PumpInterface(pumpParam=
            AixLib.DataBase.Pumps.PumpPolynomialBased.Pump_DN25_H1_8_V5(),
          calculatePower=true)),
    dynamicHX(
      dp1_nominal=33,
      dp2_nominal=4500 + 50500,
      nNodes=1,
      tau1=3,
      tau2=15,
      dT_nom=20.8,
      Q_nom=22300)),
    dynamicHX(
      dp1_nominal=220,
      dp2_nominal=220,
      dT_nom=1,
      Q_nom=1100),
    humidifier(
      dp_nominal=100,
      mWat_flow_nominal=1,
      Twater_in=288.15),
    humidifierRet(
      dp_nominal=100,
      mWat_flow_nominal=0.5,
      Twater_in=288.15))
    annotation (Placement(transformation(extent={{-60,-14},{60,52}})));
  Fluid.Sources.Boundary_pT boundaryOutsideAir(
    nPorts=1,
    redeclare package Medium = Media.Air,
    T=283.15) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-80,16})));
  Fluid.Sources.Boundary_pT boundarySupplyAir(nPorts=1, redeclare package
      Medium = Media.Air) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={80,16})));
  Fluid.Sources.Boundary_pT boundaryExhaustAir(nPorts=1, redeclare package
      Medium = Media.Air) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-80,40})));
  Fluid.Sources.Boundary_pT boundaryReturnAir(
    T=293.15,
    nPorts=1,
    redeclare package Medium = Media.Air) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=0,
        origin={80,40})));
  Fluid.Sources.Boundary_pT SourcePreheater(
    nPorts=1,
    redeclare package Medium = Media.Water,
    T=333.15) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={-46,-40})));
  Fluid.Sources.Boundary_pT SinkPreheater(
    nPorts=1,
    redeclare package Medium = Media.Water,
    p=102000,
    T=283.15) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={-26,-40})));
  Fluid.Sources.Boundary_pT SourceCooler(
    nPorts=1,
    redeclare package Medium = Media.Water,
    T=283.15) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={-2,-40})));
  Fluid.Sources.Boundary_pT SinkSink(
    nPorts=1,
    redeclare package Medium = Media.Water,
    T=283.15) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={12,-40})));
  Fluid.Sources.Boundary_pT SourceHeater(
    nPorts=1,
    redeclare package Medium = Media.Water,
    T=333.15) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={32,-40})));
  Fluid.Sources.Boundary_pT SinkHeater(nPorts=1, redeclare package Medium =
        Media.Water) annotation (Placement(transformation(
        extent={{8,-8},{-8,8}},
        rotation=270,
        origin={48,-40})));
  Controller.CtrAHUBasic ctrAHUBasic(TFlowSet=293.15, ctrRh(k=0.01))
    annotation (Placement(transformation(extent={{-40,62},{-20,82}})));
equation
  connect(boundaryReturnAir.ports[1], genericAHU.port_a2)
    annotation (Line(points={{70,40},{60.5455,40}}, color={0,127,255}));
  connect(boundarySupplyAir.ports[1], genericAHU.port_b1)
    annotation (Line(points={{70,16},{60.5455,16}}, color={0,127,255}));
  connect(boundaryOutsideAir.ports[1], genericAHU.port_a1)
    annotation (Line(points={{-70,16},{-60,16}}, color={0,127,255}));
  connect(boundaryExhaustAir.ports[1], genericAHU.port_b2)
    annotation (Line(points={{-70,40},{-60,40}}, color={0,127,255}));
  connect(SourcePreheater.ports[1], genericAHU.port_a3) annotation (Line(points={{-46,-32},
          {-46,-14},{-43.6364,-14}},           color={0,127,255}));
  connect(SinkPreheater.ports[1], genericAHU.port_b3) annotation (Line(points={{-26,-32},
          {-26,-14},{-32.7273,-14}},           color={0,127,255}));
  connect(SourceCooler.ports[1], genericAHU.port_a4) annotation (Line(points={{
          -2,-32},{-2,-14},{-7.10543e-15,-14}}, color={0,127,255}));
  connect(SinkSink.ports[1], genericAHU.port_b4) annotation (Line(points={{12,
          -32},{10,-32},{10,-14},{10.9091,-14}}, color={0,127,255}));
  connect(SourceHeater.ports[1], genericAHU.port_a5) annotation (Line(points={{32,-32},
          {30,-32},{30,-22},{20,-22},{20,-14},{21.8182,-14}},         color={0,
          127,255}));
  connect(SinkHeater.ports[1], genericAHU.port_b5) annotation (Line(points={{48,-32},
          {48,-26},{32.1818,-26},{32.1818,-14}},      color={0,127,255}));
  connect(ctrAHUBasic.genericAHUBus, genericAHU.genericAHUBus) annotation (Line(
      points={{-20,72.1},{-8,72.1},{-8,72},{0,72},{0,52.3}},
      color={255,204,51},
      thickness=0.5));
  annotation (experiment(StopTime=7200), Documentation(revisions="<html>
<ul>
<li>October 29, 2019, by Alexander K&uuml;mpel:<br/>First implementation</li>
</ul>
</html>"));
end GenericAHU_AHU2;
