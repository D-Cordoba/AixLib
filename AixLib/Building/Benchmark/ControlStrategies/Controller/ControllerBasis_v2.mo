within AixLib.Building.Benchmark.ControlStrategies.Controller;
model ControllerBasis_v2
  import AixLib;
  Modelica.Blocks.Math.Gain gain(k=1)
    annotation (Placement(transformation(extent={{82,20},{74,28}})));
  AixLib.Building.Benchmark.ControlStrategies.Controller_Temp.PI_Regler_RLT
    RLT_Temp annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-60,0})));
  AixLib.Building.Benchmark.ControlStrategies.Controller_PumpsAndFans.Pump_Basis
    pump_Basis
    annotation (Placement(transformation(extent={{-40,-10},{-20,10}})));
  AixLib.Building.Benchmark.ControlStrategies.Controller_PumpsAndFans.Fan_Basis
    fan_Basis annotation (Placement(transformation(extent={{-10,-10},{10,10}})));
  Controller_Generation.Valve_Basis valve_Basis
    annotation (Placement(transformation(extent={{20,-10},{40,10}})));
  Controller_Generation.Generation_Basis generation_Basis
    annotation (Placement(transformation(extent={{50,-10},{70,10}})));
  AixLib.Building.Benchmark.Model.BusSystems.Bus_Control controlBus
    annotation (Placement(transformation(extent={{80,-40},{120,0}})));
  AixLib.Building.Benchmark.Model.BusSystems.Bus_measure measureBus
    annotation (Placement(transformation(extent={{80,0},{120,40}})));
  AixLib.Building.Benchmark.ControlStrategies.Controller_Temp.PI_Regler_TBA_v2
    TBA_Temp annotation (Placement(transformation(
        extent={{-10,-10},{10,10}},
        rotation=-90,
        origin={-86,0})));
equation
  connect(gain.u,measureBus. WaterInAir) annotation (Line(points={{82.8,24},{86,
          24},{86,20},{92,20},{92,20.1},{100.1,20.1}},
                                       color={0,0,127}), Text(
      string="%second",
      index=1,
      extent={{6,3},{6,3}}));
  connect(gain.y,controlBus. X_Central) annotation (Line(points={{73.6,24},{72,
          24},{72,-20},{86,-20},{86,-19.9},{100.1,-19.9}}, color={0,0,127}));
  connect(RLT_Temp.measureBus,measureBus)  annotation (Line(
      points={{-60,10},{-60,40},{100,40},{100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(RLT_Temp.controlBus,controlBus)  annotation (Line(
      points={{-60,-10},{-60,-40},{100,-40},{100,-20}},
      color={255,204,51},
      thickness=0.5));
  connect(pump_Basis.measureBus,measureBus)  annotation (Line(
      points={{-30,10},{-30,40},{100,40},{100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(pump_Basis.controlBus,controlBus)  annotation (Line(
      points={{-30,-10},{-30,-40},{100,-40},{100,-20}},
      color={255,204,51},
      thickness=0.5));
  connect(fan_Basis.measureBus,measureBus)  annotation (Line(
      points={{0,10},{0,40},{100,40},{100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(fan_Basis.controlBus,controlBus)  annotation (Line(
      points={{0,-10},{0,-40},{100,-40},{100,-20}},
      color={255,204,51},
      thickness=0.5));
  connect(valve_Basis.measureBus,measureBus)  annotation (Line(
      points={{30,10},{30,40},{100,40},{100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(valve_Basis.controlBus,controlBus)  annotation (Line(
      points={{30,-10},{30,-40},{100,-40},{100,-20}},
      color={255,204,51},
      thickness=0.5));
  connect(generation_Basis.controlBus,controlBus)  annotation (Line(
      points={{60,-10},{60,-40},{100,-40},{100,-20}},
      color={255,204,51},
      thickness=0.5));
  connect(generation_Basis.measureBus,measureBus)  annotation (Line(
      points={{60,10},{60,40},{100,40},{100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(TBA_Temp.measureBus, measureBus) annotation (Line(
      points={{-86,10},{-86,40},{100,40},{100,20}},
      color={255,204,51},
      thickness=0.5));
  connect(TBA_Temp.controlBus, controlBus) annotation (Line(
      points={{-86,-10},{-86,-40},{100,-40},{100,-20}},
      color={255,204,51},
      thickness=0.5));
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ControllerBasis_v2;
