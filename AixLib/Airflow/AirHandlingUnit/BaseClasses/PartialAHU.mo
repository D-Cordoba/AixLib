﻿within AixLib.Airflow.AirHandlingUnit.BaseClasses;

partial model PartialAHU "Defines necessary parameters and connectors"



    // Booleans for possible AHU modes

  inner parameter Boolean heating=true "Heating Function of AHU"

    annotation (Dialog(group="AHU Modes"));

  inner parameter Boolean cooling=true "Cooling Function of AHU"

    annotation (Dialog(group="AHU Modes"));

  inner parameter Boolean dehumidificationSet=if heating and cooling then true

       else false

    "Dehumidification Function of AHU (Cooling and Heating must be enabled)"

    annotation (Dialog(group="AHU Modes", enable=(heating and cooling)));

  inner parameter Boolean humidificationSet=if heating and cooling then true else false

    "Humidification Function of AHU (Cooling and Heating must be enabled)"

    annotation (Dialog(group="AHU Modes", enable=(heating and cooling)));

  inner Boolean dehumidification;

  inner Boolean humidification;

  inner parameter Real BPF_DeHu(

    min=0,

    max=1) = 0.2

    "By-pass factor of cooling coil during dehumidification. Necessary to calculate the real outgoing enthalpy flow of heat exchanger in dehumidification mode taking the surface enthalpy of the cooling coil into account"

    annotation (Dialog(group="Settings AHU Value", enable=(dehumidification

           and cooling and heating)));

  inner parameter Boolean HRS=true

    "Is a HeatRecoverySystem physically integrated in the AHU?"

    annotation (Dialog(group="AHU Modes"), choices(checkBox=true));

  // Efficiency of HRS

  parameter Real efficiencyHRS_enabled(

    min=0,

    max=1) = 0.8 "efficiency of HRS in the AHU modes when HRS is enabled"

    annotation (Dialog(group="Settings AHU Value", enable=HRS));

  parameter Real efficiencyHRS_disabled(

    min=0,

    max=1) = 0.2

    "taking a little heat transfer into account although HRS is disabled (in case that a HRS is physically installed in the AHU)"

    annotation (Dialog(group="Settings AHU Value", enable=HRS));



  parameter Real clockPeriodGeneric(min=0) = 1800

    "time period in s for sampling (= converting time-continous into time-discrete) input variables. Recommendation: half of the duration of one simulation interval"

    annotation (Dialog(group="Settings for State Machines"));



  // assumed increase in ventilator pressure

  parameter Modelica.SIunits.Pressure dp_sup=800

    "pressure difference over supply fan"

    annotation (Dialog(tab="Fans", group="Constant Assumptions"));

  parameter Modelica.SIunits.Pressure dp_eta=800

    "pressure difference over extract fan"

    annotation (Dialog(tab="Fans", group="Constant Assumptions"));

  // assumed efficiencies of the ventilators

  parameter Modelica.SIunits.Efficiency eta_sup=0.7 "efficiency of supply fan"

    annotation (Dialog(tab="Fans", group="Constant Assumptions"));

  parameter Modelica.SIunits.Efficiency eta_eta=0.7 "efficiency of extract fan"

    annotation (Dialog(tab="Fans", group="Constant Assumptions"));



  Modelica.Blocks.Interfaces.RealInput Vflow_in(unit="m3/s") "m3/s"

                                                annotation (Placement(

        transformation(extent={{-114,68},{-86,96}}),  iconTransformation(extent={{-100,

            -14},{-92,-6}})));

  Modelica.Blocks.Interfaces.RealInput T_outdoorAir(unit="K", start=288.15) "K"

    annotation (Placement(transformation(extent={{-114,42},{-86,70}}),

        iconTransformation(extent={{-92,-20},{-84,-12}})));

  Modelica.Blocks.Interfaces.RealInput X_outdoorAir(start=0.007)

    "kg of water/kg of dry air" annotation (Placement(transformation(extent={{-114,22},

            {-86,50}}),     iconTransformation(extent={{-92,-30},{-84,-22}})));

  Modelica.Blocks.Interfaces.RealInput T_extractAir(unit="K", start=296.15) "K"

    annotation (Placement(transformation(

        extent={{14,-14},{-14,14}},

        rotation=0,

        origin={100,90}),iconTransformation(

        extent={{-4,-4},{4,4}},

        rotation=180,

        origin={84,28})));

  Modelica.Blocks.Interfaces.RealInput phi_extractAir(start=0.8)

    "relativ Humidity [Range: 0...1]" annotation (Placement(transformation(

        extent={{14,-14},{-14,14}},

        rotation=0,

        origin={100,72}),iconTransformation(

        extent={{-4,-4},{4,4}},

        rotation=180,

        origin={84,18})));

  Modelica.Blocks.Interfaces.RealOutput phi_supply(start=0.8)

    "relativ Humidity [Range: 0...1]" annotation (Placement(transformation(

        extent={{-9,-9},{9,9}},

        rotation=0,

        origin={99,9}),  iconTransformation(

        extent={{4,-4},{-4,4}},

        rotation=180,

        origin={84,-34})));

  Modelica.Blocks.Interfaces.RealInput T_supplyAir(unit="K", start=295.15)

    "K (use as PortIn)"

    annotation (Placement(transformation(extent={{114,28},{86,56}}),

        iconTransformation(extent={{88,-18},{80,-10}})));

  Modelica.Blocks.Interfaces.RealInput phi_supplyAir[2](start={0.4,0.6})

    "relativ Humidity [Range: 0...1] (Vector: [1] min, [2] max)" annotation (

      Placement(transformation(

        extent={{14,-14},{-14,14}},

        rotation=0,

        origin={100,24}),iconTransformation(

        extent={{-4,-4},{4,4}},

        rotation=180,

        origin={84,-24})));

  Modelica.Blocks.Interfaces.RealOutput QflowC(unit="W", min=0, start=0.01)

    "The absorbed cooling power supplied from a cooling circuit [W]"

    annotation (Placement(transformation(

        extent={{-10,-10},{10,10}},

        rotation=-90,

        origin={-62,-100}),iconTransformation(

        extent={{-5,-5},{5,5}},

        rotation=-90,

        origin={-11,-35})));

  Modelica.Blocks.Interfaces.RealOutput QflowH(unit="W", min=0, start=0.01)

    "The absorbed heating power supplied from a heating circuit [W]"

    annotation (Placement(transformation(

        extent={{-10,-10},{10,10}},

        rotation=-90,

        origin={-22,-100}),iconTransformation(

        extent={{-5,-5},{5,5}},

        rotation=-90,

        origin={29,-35})));

  Modelica.Blocks.Interfaces.RealOutput Pel(unit="W", min=0, start=1e-3)

    "The consumed electrical power supplied from the mains [W]" annotation (

      Placement(transformation(

        extent={{-10,-10},{10,10}},

        rotation=-90,

        origin={18,-100}),iconTransformation(

        extent={{-5,-5},{5,5}},

        rotation=-90,

        origin={49,-35})));

  Modelica.Blocks.Interfaces.RealOutput Vflow_out(unit="m3/s",start=1e-3) "m3/s"

    annotation (Placement(transformation(

        extent={{-10,-10},{10,10}},

        rotation=-90,

        origin={54,-100}),iconTransformation(extent={{4,-4},{-4,4}}, origin={-96,16})));

  Modelica.Blocks.Interfaces.RealOutput T_supplyAirOut(unit="K", start=295.15)

    "K (use as PortOut)"                                                                            annotation (Placement(transformation(

        extent={{-9,-9},{9,9}},

        rotation=0,

        origin={99,57}), iconTransformation(

        extent={{4,-4},{-4,4}},

        rotation=180,

        origin={84,-4})));

equation

  dehumidification = if dehumidificationSet and heating and cooling then dehumidificationSet else false;

  humidification = if dehumidificationSet and heating and cooling then humidificationSet else false;



  annotation (Diagram(coordinateSystem(extent={{-100,-100},{100,100}},

          preserveAspectRatio=false)), Icon(coordinateSystem(extent={{-100,-40},

            {100,40}}, preserveAspectRatio=false)),

    Documentation(revisions="<html>
<ul>
  <li>
    <i><span style=\"font-family:" ms="" shell="" dlg="">February, 2016&#160;</span></i> by Philipp Mehrfeld:<br/>
    Model implemented
  </li>
</ul></html>",revisions="<html>
<p>
  <span style=\"font-family:" ms="" shell="" dlg="">Base class to provide connectors. Thus, it is possible to declare parameters in a general way in superior building model and give the opportunity whether an <a href=\"AixLib.Airflow.AirHandlingUnit.AHU\">AHU exist</a> or <a href=\"AixLib.Airflow.AirHandlingUnit.NoAHU\">does not</a>.</span>
</p></html>",revisions="<html>

</html>"));

end PartialAHU;

