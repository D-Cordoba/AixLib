within AixLib.Systems.Benchmark;
package BaseClasses "Base class package"
  extends Modelica.Icons.BasesPackage;
  expandable connector HighTempSystemBus
    "Data bus for high temperature circuit"
    extends Modelica.Icons.SignalBus;
    import SI = Modelica.SIunits;
    HydraulicModules.BaseClasses.HydraulicBus pumpBoilerBus "Hydraulic circuit of the boiler";
    HydraulicModules.BaseClasses.HydraulicBus pumpChpBus "Hydraulic circuit of the chp";
    Real uRelBoilerSet "Set value for relative power of boiler 1 [0..1]";
    Real fuelPowerBoilerMea "Fuel consumption of boiler 1 [0..1]";
    Real TChpSet "Set temperature for chp";
    Boolean onOffChpSet "On off set point for chp";
    Real fuelPowerChpMea "Fuel consumption of chp [0..1]";
    Real thermalPowerChpMea "Thermal power of chp [0..1]";
    Real electricalPowerChpMea "Electrical power consumption of chp [0..1]";
    SI.Temperature TInMea "Inflow temperature";
    SI.Temperature TOutMea "Inflow temperature";
    annotation (
      Icon(graphics,
           coordinateSystem(preserveAspectRatio=false)),
      Diagram(graphics,
              coordinateSystem(preserveAspectRatio=false)),
      Documentation(info="<html>
<p>Definition of a bus connector for the ERC Heatpump System.</p>
</html>",   revisions="<html>
<ul>
<li>October 25, 2017, by Alexander K&uuml;mpel:<br/>Adaption for hydraulic modules in AixLib.</li>
<li>February 6, 2016, by Peter Matthes:<br/>First implementation. </li>
</ul>
</html>"));
  end HighTempSystemBus;

  expandable connector TabsBus "Data bus for concrete cora activation"
    extends Modelica.Icons.SignalBus;
    import SI = Modelica.SIunits;
    HydraulicModules.BaseClasses.HydraulicBus admixBus "Hydraulic circuit of the boiler";
    Real valSet(min=0, max=1) "Valve opening (0: ports_a1, 1: port_a2)";
    Real valSetAct(min=0, max=1) "Actual valve opening (0: ports_a1, 1: port_a2)";
    annotation (
      Icon(graphics,
           coordinateSystem(preserveAspectRatio=false)),
      Diagram(graphics,
              coordinateSystem(preserveAspectRatio=false)),
      Documentation(info="<html>
<p>Definition of a bus connector for the ERC Heatpump System.</p>
</html>",   revisions="<html>
<ul>
<li>October 25, 2017, by Alexander K&uuml;mpel:<br/>Adaption for hydraulic modules in AixLib.</li>
<li>February 6, 2016, by Peter Matthes:<br/>First implementation. </li>
</ul>
</html>"));
  end TabsBus;

  expandable connector MainBus
    "Data bus for E.ON ERC main building system"
    extends Modelica.Icons.SignalBus;
    import SI = Modelica.SIunits;
    EONERC_MainBuilding.BaseClasses.HeatPumpSystemBus hpSystemBus
      "Heat pump system bus";
    EONERC_MainBuilding.BaseClasses.SwitchingUnitBus swuBus "Switching unit bus";
    HighTempSystemBus htsBus
      "High temoerature system bus";
    EONERC_MainBuilding.BaseClasses.TwoCircuitBus gtfBus "Geothermalfield bus";
    EONERC_MainBuilding.BaseClasses.TwoCircuitBus hxBus
      "Heat exchanger system bus";
    TabsBus tabs1Bus "Bus for concrete core activation 1";
    TabsBus tabs2Bus "Bus for concrete core activation 2";
    TabsBus tabs3Bus "Bus for concrete core activation 3";
    TabsBus tabs4Bus "Bus for concrete core activation 4";
    TabsBus tabs5Bus "Bus for concrete core activation 5";
    ModularAHU.BaseClasses.GenericAHUBus ahuBus "Bus for AHU";
    ModularAHU.BaseClasses.GenericAHUBus vu1Bus "Ventilation unit 1";
    ModularAHU.BaseClasses.GenericAHUBus vu2Bus "Ventilation unit 2";
    ModularAHU.BaseClasses.GenericAHUBus vu3Bus "Ventilation unit 3";
    ModularAHU.BaseClasses.GenericAHUBus vu4Bus "Ventilation unit 4";
    ModularAHU.BaseClasses.GenericAHUBus vu5Bus "Ventilation unit 5";
    SI.Temperature TRoom1Mea "Temperature in room 1";
    SI.Temperature TRoom2Mea "Temperature in room 2";
    SI.Temperature TRoom3Mea "Temperature in room 3";
    SI.Temperature TRoom4Mea "Temperature in room 4";
    SI.Temperature TRoom5Mea "Temperature in room 5";
    EvaluationBus evaBus
      "Bus for energy consumption measurement";
    annotation (
      Icon(graphics,
           coordinateSystem(preserveAspectRatio=false)),
      Diagram(graphics,
              coordinateSystem(preserveAspectRatio=false)),
      Documentation(info="<html>
<p>Definition of a bus connector for the ERC Heatpump System.</p>
</html>",   revisions="<html>
<ul>
<li>October 25, 2017, by Alexander K&uuml;mpel:<br/>Adaption for hydraulic modules in AixLib.</li>
<li>February 6, 2016, by Peter Matthes:<br/>First implementation. </li>
</ul>
</html>"));
  end MainBus;

  expandable connector EvaluationBus
    "Data bus for KPIs (energy consumption, control quality) of benchmark building"
    extends Modelica.Icons.SignalBus;
    import SI = Modelica.SIunits;

    SI.Energy WelHPMea "Consumed energy of heat pump";
    SI.Energy WelPumpsHPMea "Consumed energy of heat pump pumps";
    SI.Energy WelGCMea "Consumed energy of glycol cooler";
    SI.Energy WelPumpsHXMea "Consumed energy of heat exchanger system pumps";
    SI.Energy WelPumpSWUMea "Consumed energy of switching unit pump";
    SI.Energy WelPumpGTFMea "Consumed energy of geothermal field pump";
    SI.Energy WelPumpsHTSMea "Consumed energy of pumps in high temperature system";
    SI.Energy QbrBoiMea "Consumed energy of boiler";
    SI.Energy QbrCHPMea "Consumed energy of chp";
    SI.Energy WelCPHMea "Produced electricity of chp";
    SI.Energy WelTotalMea "Total consumed electricity";
    SI.Energy QbrTotalMea "Total consumed fuel";
    Real IseRoom1 "ISE of room 1";
    Real IseRoom2 "ISE of room 2";
    Real IseRoom3 "ISE of room 3";
    Real IseRoom4 "ISE of room 4";
    Real IseRoom5 "ISE of room 5";

    annotation (
      Icon(graphics,
           coordinateSystem(preserveAspectRatio=false)),
      Diagram(graphics,
              coordinateSystem(preserveAspectRatio=false)),
      Documentation(info="<html>
<p>Definition of a bus connector for the ERC Heatpump System.</p>
</html>",   revisions="<html>
<ul>
<li>October 25, 2017, by Alexander K&uuml;mpel:<br/>Adaption for hydraulic modules in AixLib.</li>
<li>February 6, 2016, by Peter Matthes:<br/>First implementation. </li>
</ul>
</html>"));
  end EvaluationBus;

  record HeatpumpBenchmarkSystem "Benchmark Heatpump Big"
    extends AixLib.DataBase.ThermalMachines.HeatPump.HeatPumpBaseDataDefinition(
      tableP_ele=[0,-5,0,5; 35,19350,19800,19800; 45,24000,24000,24000; 55,28950,29400,29400],
      tableQdot_con=[0,-5,0,5; 35,76572,87000,96600; 45,72600,83400,93600; 55,69078,
          79200,89400],
      mFlow_conNom=12,
      mFlow_evaNom=1000,
      tableUppBou=[-20, 50;-10, 60; 30, 60; 35,55],
      tableLowBou = [-20, 25; 25, 25; 35, 35]);
    annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end HeatpumpBenchmarkSystem;

  model EnergyCounter "Sums up all consumed energy"
    parameter Modelica.SIunits.Temperature Tset = 273.15+21 "Set Temperature of rooms for ISE calculation";

    MainBus mainBus annotation (Placement(transformation(extent={{-118,-18},{-80,18}}),
          iconTransformation(extent={{-18,-42},{16,-6}})));
    Modelica.Blocks.Continuous.Integrator integrator
      annotation (Placement(transformation(extent={{-10,90},{0,100}})));
    Modelica.Blocks.Continuous.Integrator integrator1
      annotation (Placement(transformation(extent={{-10,74},{0,84}})));
    Modelica.Blocks.Math.Add add
      annotation (Placement(transformation(extent={{-26,74},{-16,84}})));
    Modelica.Blocks.Continuous.Integrator integrator2
      annotation (Placement(transformation(extent={{-10,56},{0,66}})));
    Modelica.Blocks.Math.Add add1
      annotation (Placement(transformation(extent={{-26,40},{-16,50}})));
    Modelica.Blocks.Continuous.Integrator integrator3
      annotation (Placement(transformation(extent={{-10,40},{0,50}})));
    Modelica.Blocks.Continuous.Integrator integrator4
      annotation (Placement(transformation(extent={{-10,20},{0,30}})));
    Modelica.Blocks.Continuous.Integrator integrator5
      annotation (Placement(transformation(extent={{-10,4},{0,14}})));
    Modelica.Blocks.Continuous.Integrator integrator6
      annotation (Placement(transformation(extent={{-10,-22},{0,-12}})));
    Modelica.Blocks.Continuous.Integrator integrator7
      annotation (Placement(transformation(extent={{-10,-40},{0,-30}})));
    Modelica.Blocks.Continuous.Integrator integrator9
      annotation (Placement(transformation(extent={{-10,-80},{0,-70}})));
    Modelica.Blocks.Continuous.Integrator integrator10
      annotation (Placement(transformation(extent={{-10,-100},{0,-90}})));
    Modelica.Blocks.Math.Sum sum1(nin=3)
      annotation (Placement(transformation(extent={{-30,-22},{-20,-12}})));
    Modelica.Blocks.Math.Sum sumWel(nin=7)
      annotation (Placement(transformation(extent={{60,4},{70,14}})));
    Modelica.Blocks.Math.Sum sumQbr(nin=2)
      annotation (Placement(transformation(extent={{60,-40},{70,-30}})));
    Modelica.Blocks.Continuous.Integrator integrator11
      annotation (Placement(transformation(extent={{112,88},{122,98}})));
    Modelica.Blocks.Math.Add add2(k2=-1)
      annotation (Placement(transformation(extent={{86,88},{96,98}})));
    Modelica.Blocks.Math.Product product
      annotation (Placement(transformation(extent={{102,90},{108,96}})));
    Modelica.Blocks.Sources.Constant const(k=Tset)
      annotation (Placement(transformation(extent={{74,86},{80,92}})));
    Modelica.Blocks.Continuous.Integrator integrator12
      annotation (Placement(transformation(extent={{112,66},{122,76}})));
    Modelica.Blocks.Math.Add add3(k2=-1)
      annotation (Placement(transformation(extent={{86,66},{96,76}})));
    Modelica.Blocks.Sources.Constant const1(k=Tset)
      annotation (Placement(transformation(extent={{74,64},{80,70}})));
    Modelica.Blocks.Math.Product product1
      annotation (Placement(transformation(extent={{102,68},{108,74}})));
    Modelica.Blocks.Continuous.Integrator integrator13
      annotation (Placement(transformation(extent={{114,40},{124,50}})));
    Modelica.Blocks.Math.Add add4(k2=-1)
      annotation (Placement(transformation(extent={{88,40},{98,50}})));
    Modelica.Blocks.Sources.Constant const2(k=Tset)
      annotation (Placement(transformation(extent={{76,38},{82,44}})));
    Modelica.Blocks.Math.Product product2
      annotation (Placement(transformation(extent={{104,42},{110,48}})));
    Modelica.Blocks.Continuous.Integrator integrator14
      annotation (Placement(transformation(extent={{114,20},{124,30}})));
    Modelica.Blocks.Math.Add add5(k2=-1)
      annotation (Placement(transformation(extent={{88,20},{98,30}})));
    Modelica.Blocks.Sources.Constant const3(k=Tset)
      annotation (Placement(transformation(extent={{76,18},{82,24}})));
    Modelica.Blocks.Math.Product product3
      annotation (Placement(transformation(extent={{104,22},{110,28}})));
    Modelica.Blocks.Continuous.Integrator integrator8
      annotation (Placement(transformation(extent={{112,106},{122,116}})));
    Modelica.Blocks.Math.Add add6(k2=-1)
      annotation (Placement(transformation(extent={{86,106},{96,116}})));
    Modelica.Blocks.Math.Product product4
      annotation (Placement(transformation(extent={{102,108},{108,114}})));
    Modelica.Blocks.Sources.Constant const4(k=Tset)
      annotation (Placement(transformation(extent={{74,104},{80,110}})));
  equation
    connect(integrator.u, mainBus.hpSystemBus.busHP.Pel) annotation (Line(points={
            {-11,95},{-98.905,95},{-98.905,0.09}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(add.u2, mainBus.hpSystemBus.busPumpHot.pumpBus.power) annotation (
        Line(points={{-27,76},{-98.905,76},{-98.905,0.09}}, color={0,0,127}),
        Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(add.u1, mainBus.hpSystemBus.busPumpCold.pumpBus.power) annotation (
        Line(points={{-27,82},{-90,82},{-90,84},{-98.905,84},{-98.905,0.09}},
          color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(add.y, integrator1.u)
      annotation (Line(points={{-15.5,79},{-11,79}}, color={0,0,127}));
    connect(integrator.y, mainBus.evaBus.WelHPMea) annotation (Line(points={{0.5,95},
            {32,95},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator1.y, mainBus.evaBus.WelPumpsHPMea) annotation (Line(points={{0.5,79},
            {32,79},{32,0.09},{-98.905,0.09}},          color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator2.u, mainBus.hpSystemBus.PelAirCoolerMea) annotation (Line(
          points={{-11,61},{-98.905,61},{-98.905,0.09}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(integrator2.y, mainBus.evaBus.WelGCMea) annotation (Line(points={{0.5,61},
            {32,61},{32,0.09},{-98.905,0.09}},     color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(add1.y, integrator3.u) annotation (Line(points={{-15.5,45},{-11,45}},
                                   color={0,0,127}));
    connect(add1.u1, mainBus.hxBus.primBus.pumpBus.power) annotation (Line(points={{-27,48},
            {-98.905,48},{-98.905,0.09}},          color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(add1.u2, mainBus.hxBus.secBus.pumpBus.power) annotation (Line(points={{-27,42},
            {-98.905,42},{-98.905,0.09}},          color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(integrator3.y, mainBus.evaBus.WelPumpsHXMea) annotation (Line(points={{0.5,45},
            {32,45},{32,0.09},{-98.905,0.09}},            color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator4.u, mainBus.swuBus.pumpBus.power) annotation (Line(points={{-11,25},
            {-98.905,25},{-98.905,0.09}},          color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(integrator4.y, mainBus.evaBus.WelPumpSWUMea) annotation (Line(points={{0.5,25},
            {32,25},{32,0.09},{-98.905,0.09}},          color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator5.u, mainBus.gtfBus.primBus.pumpBus.power) annotation (Line(
          points={{-11,9},{-98.905,9},{-98.905,0.09}},     color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(integrator5.y, mainBus.evaBus.WelPumpGTFMea) annotation (Line(points={{0.5,9},
            {32,9},{32,0.09},{-98.905,0.09}},             color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator6.y, mainBus.evaBus.WelPumpsHTSMea) annotation (Line(points={{0.5,-17},
            {32,-17},{32,0.09},{-98.905,0.09}},           color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator7.u, mainBus.htsBus.fuelPowerBoilerMea) annotation (Line(
          points={{-11,-35},{-98.905,-35},{-98.905,0.09}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(integrator7.y, mainBus.evaBus.QbrBoiMea) annotation (Line(points={{0.5,-35},
            {32,-35},{32,0.09},{-98.905,0.09}},      color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));

    connect(integrator9.u, mainBus.htsBus.fuelPowerChpMea) annotation (Line(
          points={{-11,-75},{-98.905,-75},{-98.905,0.09}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(integrator9.y, mainBus.evaBus.QbrCHPMea) annotation (Line(points={{
            0.5,-75},{32,-75},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator10.u, mainBus.htsBus.electricalPowerChpMea) annotation (
        Line(points={{-11,-95},{-98.905,-95},{-98.905,0.09}}, color={0,0,127}),
        Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(integrator10.y, mainBus.evaBus.WelCPHMea) annotation (Line(points={{
            0.5,-95},{32,-95},{32,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(sum1.u[1], mainBus.htsBus.admixBus1.pumpBus.power) annotation (Line(
          points={{-31,-17.6667},{-98.905,-17.6667},{-98.905,0.09}}, color={0,0,
            127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(sum1.u[2], mainBus.htsBus.admixBus2.pumpBus.power) annotation (Line(
          points={{-31,-17},{-98.905,-17},{-98.905,0.09}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(sum1.u[3], mainBus.htsBus.throttlePumpBus.pumpBus.power) annotation (
        Line(points={{-31,-16.3333},{-98.905,-16.3333},{-98.905,0.09}}, color={0,
            0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(sum1.y, integrator6.u) annotation (Line(points={{-19.5,-17},{-14.75,
            -17},{-14.75,-17},{-11,-17}}, color={0,0,127}));
    connect(integrator.y, sumWel.u[1])
      annotation (Line(points={{0.5,95},{59,95},{59,8.14286}}, color={0,0,127}));
    connect(integrator1.y, sumWel.u[2])
      annotation (Line(points={{0.5,79},{59,79},{59,8.42857}}, color={0,0,127}));
    connect(integrator2.y, sumWel.u[3]) annotation (Line(points={{0.5,61},{32,61},
            {32,10},{59,10},{59,8.71429}}, color={0,0,127}));
    connect(integrator3.y, sumWel.u[4]) annotation (Line(points={{0.5,45},{16,45},
            {16,46},{32,46},{32,9},{59,9}}, color={0,0,127}));
    connect(integrator4.y, sumWel.u[5]) annotation (Line(points={{0.5,25},{32.25,
            25},{32.25,9.28571},{59,9.28571}}, color={0,0,127}));
    connect(integrator5.y, sumWel.u[6])
      annotation (Line(points={{0.5,9},{59,9},{59,9.57143}}, color={0,0,127}));
    connect(integrator6.y, sumWel.u[7]) annotation (Line(points={{0.5,-17},{59,-17},
            {59,9.85714}},      color={0,0,127}));
    connect(sumWel.y, mainBus.evaBus.WelTotalMea) annotation (Line(points={{70.5,
            9},{80,9},{80,0.09},{-98.905,0.09}}, color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator7.y, sumQbr.u[1]) annotation (Line(points={{0.5,-35},{21.25,
            -35},{21.25,-35.5},{59,-35.5}},       color={0,0,127}));
    connect(sumQbr.y, mainBus.evaBus.QbrTotalMea) annotation (Line(points={{70.5,
            -35},{76,-35},{76,-36},{80,-36},{80,0.09},{-98.905,0.09}}, color={0,0,
            127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(product.y, integrator11.u) annotation (Line(points={{108.3,93},{
            109.15,93},{109.15,93},{111,93}}, color={0,0,127}));
    connect(const.y, add2.u2) annotation (Line(points={{80.3,89},{82.15,89},{82.15,
            90},{85,90}},       color={0,0,127}));
    connect(const1.y, add3.u2) annotation (Line(points={{80.3,67},{82.15,67},{82.15,
            68},{85,68}},       color={0,0,127}));
    connect(integrator12.u, product1.y)
      annotation (Line(points={{111,71},{108.3,71}}, color={0,0,127}));
    connect(const2.y, add4.u2) annotation (Line(points={{82.3,41},{84.15,41},{84.15,
            42},{87,42}},       color={0,0,127}));
    connect(integrator13.u, product2.y)
      annotation (Line(points={{113,45},{110.3,45}}, color={0,0,127}));
    connect(const3.y, add5.u2) annotation (Line(points={{82.3,21},{84.15,21},{84.15,
            22},{87,22}},       color={0,0,127}));
    connect(integrator14.u, product3.y)
      annotation (Line(points={{113,25},{110.3,25}}, color={0,0,127}));
    connect(integrator9.y, sumQbr.u[2]) annotation (Line(points={{0.5,-75},{50,-75},
            {50,-34.5},{59,-34.5}}, color={0,0,127}));
    connect(product4.y, integrator8.u)
      annotation (Line(points={{108.3,111},{111,111}}, color={0,0,127}));
    connect(const4.y, add6.u2) annotation (Line(points={{80.3,107},{82.15,107},{82.15,
            108},{85,108}}, color={0,0,127}));
    connect(add6.y, product4.u2) annotation (Line(points={{96.5,111},{99.25,111},
            {99.25,109.2},{101.4,109.2}}, color={0,0,127}));
    connect(add6.y, product4.u1) annotation (Line(points={{96.5,111},{99.25,111},
            {99.25,112.8},{101.4,112.8}}, color={0,0,127}));
    connect(add2.y, product.u1) annotation (Line(points={{96.5,93},{99.25,93},{
            99.25,94.8},{101.4,94.8}}, color={0,0,127}));
    connect(add2.y, product.u2) annotation (Line(points={{96.5,93},{99.25,93},{
            99.25,91.2},{101.4,91.2}}, color={0,0,127}));
    connect(add3.y, product1.u1) annotation (Line(points={{96.5,71},{99.25,71},
            {99.25,72.8},{101.4,72.8}}, color={0,0,127}));
    connect(add3.y, product1.u2) annotation (Line(points={{96.5,71},{99.25,71},
            {99.25,69.2},{101.4,69.2}}, color={0,0,127}));
    connect(add4.y, product2.u1) annotation (Line(points={{98.5,45},{100.25,45},
            {100.25,46.8},{103.4,46.8}}, color={0,0,127}));
    connect(add4.y, product2.u2) annotation (Line(points={{98.5,45},{101.25,45},
            {101.25,43.2},{103.4,43.2}}, color={0,0,127}));
    connect(add5.y, product3.u1) annotation (Line(points={{98.5,25},{100.25,25},
            {100.25,26.8},{103.4,26.8}}, color={0,0,127}));
    connect(add5.y, product3.u2) annotation (Line(points={{98.5,25},{101.25,25},
            {101.25,23.2},{103.4,23.2}}, color={0,0,127}));
    connect(add6.u1, mainBus.TRoom1Mea) annotation (Line(points={{85,114},{-14,
            114},{-14,116},{-98.905,116},{-98.905,0.09}}, color={0,0,127}),
        Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(add2.u1, mainBus.TRoom2Mea) annotation (Line(points={{85,96},{74,96},
            {74,108},{-110,108},{-110,0.09},{-98.905,0.09}}, color={0,0,127}),
        Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(add3.u1, mainBus.TRoom3Mea) annotation (Line(points={{85,74},{64,74},
            {64,124},{-108,124},{-108,-6},{-98.905,-6},{-98.905,0.09}}, color={
            0,0,127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(add4.u1, mainBus.TRoom4Mea) annotation (Line(points={{87,48},{74,48},
            {74,50},{68,50},{68,124},{-98.905,124},{-98.905,0.09}}, color={0,0,
            127}), Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(add5.u1, mainBus.TRoom5Mea) annotation (Line(points={{87,28},{66,28},
            {66,128},{-98,128},{-98,0.09},{-98.905,0.09}}, color={0,0,127}),
        Text(
        string="%second",
        index=1,
        extent={{-6,3},{-6,3}},
        horizontalAlignment=TextAlignment.Right));
    connect(integrator8.y, mainBus.evaBus.IseRoom1) annotation (Line(points={{
            122.5,111},{130,111},{130,130},{-98.905,130},{-98.905,0.09}}, color=
           {0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator11.y, mainBus.evaBus.IseRoom2) annotation (Line(points={{
            122.5,93},{136,93},{136,132},{-98.905,132},{-98.905,0.09}}, color={
            0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator12.y, mainBus.evaBus.IseRoom3) annotation (Line(points={{
            122.5,71},{144,71},{144,128},{-106,128},{-106,0.09},{-98.905,0.09}},
          color={0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator13.y, mainBus.evaBus.IseRoom4) annotation (Line(points={{
            124.5,45},{150,45},{150,130},{-98.905,130},{-98.905,0.09}}, color={
            0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    connect(integrator14.y, mainBus.evaBus.IseRoom5) annotation (Line(points={{
            124.5,25},{158,25},{158,132},{-98.905,132},{-98.905,0.09}}, color={
            0,0,127}), Text(
        string="%second",
        index=1,
        extent={{6,3},{6,3}},
        horizontalAlignment=TextAlignment.Left));
    annotation (Icon(coordinateSystem(preserveAspectRatio=false), graphics={
          Rectangle(
            extent={{-86,80},{94,-20}},
            lineColor={0,0,0},
            fillColor={255,255,255},
            fillPattern=FillPattern.Solid),
          Line(points={{30,36}}, color={0,0,0}),
          Polygon(
            points={{44,48},{-8,2},{2,-6},{44,48}},
            lineColor={0,0,0},
            fillColor={238,46,47},
            fillPattern=FillPattern.Solid),
          Line(
            points={{-74,64},{-56,42}},
            color={0,0,0},
            thickness=1),
          Line(
            points={{-26,70},{-22,46}},
            color={0,0,0},
            thickness=1),
          Line(
            points={{28,70},{22,46}},
            color={0,0,0},
            thickness=1),
          Line(
            points={{86,60},{66,38}},
            color={0,0,0},
            thickness=1)}),                                        Diagram(
          coordinateSystem(preserveAspectRatio=false)));
  end EnergyCounter;
end BaseClasses;
