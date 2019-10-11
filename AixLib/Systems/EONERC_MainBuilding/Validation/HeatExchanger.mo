within AixLib.Systems.EONERC_MainBuilding.Validation;
model HeatExchanger "Test of heat exachgner model of E.ON ERC main building"
  extends Modelica.Icons.Example;
    package Medium = AixLib.Media.Water
    annotation (choicesAllMatching=true);

  Fluid.Sources.Boundary_pT          boundary(
    redeclare package Medium = Medium,
    T=333.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-80,-20})));
  Fluid.Sources.Boundary_pT          boundary1(
    redeclare package Medium = Medium,
    T=303.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=180,
        origin={-80,8})));
  Fluid.Sources.Boundary_pT          boundary4(
    redeclare package Medium = Medium,
    T=303.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={20,-80})));
  Fluid.Sources.Boundary_pT          boundary5(
    redeclare package Medium = Medium,
    T=303.15,
    nPorts=1) annotation (Placement(transformation(
        extent={{10,-10},{-10,10}},
        rotation=270,
        origin={60,-80})));
  HeatExchangerSystem heatExchangerSystem(
    redeclare package Medium = Medium,
    m_flow_nominal=10,
    T_start=293.15)
    annotation (Placement(transformation(extent={{-40,-40},{68,40}})));
  Fluid.MixingVolumes.MixingVolume vol(
    redeclare package Medium = Medium,
    m_flow_nominal=2,
    V=0.1,
    nPorts=2) annotation (Placement(transformation(extent={{70,58},{50,78}})));
  Controller.CtrHXSsystem ctrHXSsystem(
    useExternalTset=true,
    TflowSet=308.15,
    Ti=60,
    Td=0,
    rpm_pump=1000,
    rpm_pump_htc=1500)
    annotation (Placement(transformation(extent={{-60,40},{-40,60}})));
  Modelica.Blocks.Sources.Ramp ramp(
    height=10,
    duration=1800,
    offset=298.15,
    startTime=900)
    annotation (Placement(transformation(extent={{-100,40},{-80,60}})));
equation
  connect(heatExchangerSystem.port_a1, boundary.ports[1]) annotation (Line(
        points={{-40,-8},{-56,-8},{-56,-20},{-70,-20}},
                                                    color={0,127,255}));
  connect(heatExchangerSystem.port_b1, boundary1.ports[1]) annotation (Line(
        points={{-40,8},{-70,8}},                       color={0,127,255}));
  connect(boundary4.ports[1], heatExchangerSystem.port_a2) annotation (Line(
        points={{20,-70},{44.8571,-70},{44.8571,-40}}, color={0,127,255}));
  connect(boundary5.ports[1], heatExchangerSystem.port_b3) annotation (Line(
        points={{60,-70},{60,-39.2},{60.2857,-39.2}}, color={0,127,255}));
  connect(heatExchangerSystem.port_b2, vol.ports[1]) annotation (Line(points={{44.8571,
          40},{46,40},{46,60},{62,60},{62,58}},         color={0,127,255}));
  connect(heatExchangerSystem.port_a3, vol.ports[2]) annotation (Line(points={{60.2857,
          40},{60,40},{60,58},{58,58}},         color={0,127,255}));
  connect(ctrHXSsystem.hydraulicBus, heatExchangerSystem.hydraulicBusLTC)
    annotation (Line(
      points={{-40.7,48.9},{29.4286,48.9},{29.4286,40}},
      color={255,204,51},
      thickness=0.5));
  connect(ctrHXSsystem.hydraulicBusHTC, heatExchangerSystem.hydraulicBusHTC)
    annotation (Line(
      points={{-40.7,54.6},{-9.14286,54.6},{-9.14286,40}},
      color={255,204,51},
      thickness=0.5));
  connect(ramp.y, ctrHXSsystem.Tset) annotation (Line(points={{-79,50},{-72,50},
          {-72,50},{-62,50}}, color={0,0,127}));
  annotation (experiment(StopTime=23400),__Dymola_Commands(file(ensureSimulated
          =true) =
        "Resources/Scripts/Dymola/Systems/EONERC_MainBuilding/Validation/Simulate_and_plot_HeatExchanger.mos"
        "Simulate and plot"));
end HeatExchanger;
