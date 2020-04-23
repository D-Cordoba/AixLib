within AixLib.ThermalZones.HighOrder.Rooms.OFD;
model Ow2IwL2IwS1Gr1Uf1
  "2 outer walls, 2 inner walls load, 1 inner wall simple, 1 floor towards ground, 1 ceiling towards upper floor"

  extends AixLib.ThermalZones.HighOrder.Rooms.OFD.BaseClasses.PartialRoom(redeclare DataBase.Walls.Collections.OFD.BaseDataMultiInnerWalls wallTypes,
                                                                          final room_V=room_length*room_width*room_height);

  parameter Modelica.SIunits.Temperature T0_OW1=295.15 "OW1"
    annotation (Dialog(tab="Initial temperatures", descriptionLabel=true));
  parameter Modelica.SIunits.Temperature T0_OW2=295.15 "OW2"
    annotation (Dialog(tab="Initial temperatures", descriptionLabel=true));
  parameter Modelica.SIunits.Temperature T0_IW1a=295.15 "IW1a"
    annotation (Dialog(tab="Initial temperatures", descriptionLabel=true));
  parameter Modelica.SIunits.Temperature T0_IW1b=295.15 "IW1b"
    annotation (Dialog(tab="Initial temperatures", descriptionLabel=true));
  parameter Modelica.SIunits.Temperature T0_IW2=295.15 "IW2"
    annotation (Dialog(tab="Initial temperatures", descriptionLabel=true));
  parameter Modelica.SIunits.Temperature T0_CE=295.13 "Ceiling"
    annotation (Dialog(tab="Initial temperatures", descriptionLabel=true));
  parameter Modelica.SIunits.Temperature T0_FL=295.13 "Floor"
    annotation (Dialog(tab="Initial temperatures", descriptionLabel=true));
  //////////room geometry
  parameter Modelica.SIunits.Length room_length=2 "length "
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Length room_lengthb=1 "length_b "
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Length room_width=2 "width "
    annotation (Dialog(group="Dimensions", descriptionLabel=true));
  parameter Modelica.SIunits.Height room_height=2 "height"
    annotation (Dialog(group="Dimensions", descriptionLabel=true));


  // Windows and Doors
  parameter Boolean withWindow1=true "Window 1" annotation (Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true), choices(checkBox=true));
  parameter Modelica.SIunits.Area windowarea_OW1=0 "Window area " annotation (
      Dialog(
      group="Windows and Doors",
      descriptionLabel=true,
      enable=withWindow1));
  parameter Boolean withWindow2=true "Window 2 " annotation (Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true), choices(checkBox=true));
  parameter Modelica.SIunits.Area windowarea_OW2=0 "Window area" annotation (
      Dialog(
      group="Windows and Doors",
      naturalWidth=10,
      descriptionLabel=true,
      enable=withWindow2));
  parameter Boolean withDoor1=true "Door 1" annotation (Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true), choices(checkBox=true));
  parameter Modelica.SIunits.Length door_width_OD1=0 "width " annotation (
      Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true,
      enable=withDoor1));
  parameter Modelica.SIunits.Length door_height_OD1=0 "height " annotation (
      Dialog(
      group="Windows and Doors",
      descriptionLabel=true,
      enable=withDoor1));
  parameter Boolean withDoor2=true "Door 2" annotation (Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true), choices(checkBox=true));
  parameter Modelica.SIunits.Length door_width_OD2=0 "width " annotation (
      Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true,
      enable=withDoor2));
  parameter Modelica.SIunits.Length door_height_OD2=0 "height " annotation (
      Dialog(
      group="Windows and Doors",
      descriptionLabel=true,
      enable=withDoor2));
  parameter Real U_door_OD1=2.5 "U-value" annotation (
     Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true,
      enable=withDoor1));
  parameter Real eps_door_OD1=0.95 "eps" annotation (Dialog(
      group="Windows and Doors",
      descriptionLabel=true,
      enable=withDoor1));
  parameter Real U_door_OD2=2.5 "U-value" annotation (
     Dialog(
      group="Windows and Doors",
      joinNext=true,
      descriptionLabel=true,
      enable=withDoor2));
  parameter Real eps_door_OD2=0.95 "eps" annotation (Dialog(
      group="Windows and Doors",
      descriptionLabel=true,
      enable=withDoor2));



  AixLib.ThermalZones.HighOrder.Components.Walls.Wall outside_wall1(
    solar_absorptance=solar_absorptance_OW,
    windowarea=windowarea_OW1,
    T0=T0_OW1,
    door_height=door_height_OD1,
    door_width=door_width_OD1,
    wall_length=room_length,
    wall_height=room_height,
    withWindow=withWindow1,
    withDoor=withDoor1,
    wallPar=wallTypes.OW,
    WindowType=Type_Win,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    U_door=U_door_OD1,
    eps_door=eps_door_OD1) annotation (Placement(transformation(extent={{-58,-14},{-48,44}})));

  AixLib.ThermalZones.HighOrder.Components.Walls.Wall outside_wall2(
    solar_absorptance=solar_absorptance_OW,
    windowarea=windowarea_OW2,
    T0=T0_OW2,
    door_height=door_height_OD2,
    door_width=door_width_OD2,
    wall_length=room_width,
    wall_height=room_height,
    withWindow=withWindow2,
    withDoor=withDoor2,
    wallPar=wallTypes.OW,
    WindowType=Type_Win,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    U_door=U_door_OD2,
    eps_door=eps_door_OD2) annotation (Placement(transformation(
        origin={23,59},
        extent={{-4.99998,-27},{5.00001,27}},
        rotation=270)));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall inside_wall1a(
    T0=T0_IW1a,
    outside=false,
    wallPar=wallTypes.IW2_vert_half_a,
    wall_length=room_length - room_lengthb,
    wall_height=room_height,
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    withDoor=false) annotation (Placement(transformation(
        origin={61,24},
        extent={{-2.99999,-16},{2.99999,16}},
        rotation=180)));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall inside_wall2(
    T0=T0_IW2,
    outside=false,
    wallPar=wallTypes.IW_vert_half_a,
    wall_length=room_width,
    wall_height=room_height,
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    withDoor=false) annotation (Placement(transformation(
        origin={22,-60},
        extent={{-4.00002,-26},{4.00001,26}},
        rotation=90)));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall Ceiling(
    T0=T0_CE,
    outside=false,
    wallPar=wallTypes.IW_hori_low_half,
    wall_length=room_length,
    wall_height=room_width,
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    withDoor=false,
    ISOrientation=3) annotation (Placement(transformation(
        origin={-30,61},
        extent={{2.99997,-16},{-3.00002,16}},
        rotation=90)));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall floor(
    T0=T0_FL,
    outside=false,
    wallPar=wallTypes.groundPlate_upp_half,
    wall_length=room_length,
    wall_height=room_width,
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    withDoor=false,
    ISOrientation=2) annotation (Placement(transformation(
        origin={-27,-60},
        extent={{-2.00002,-11},{2.00001,11}},
        rotation=90)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermInsideWall2
    annotation (Placement(transformation(extent={{20,-100},{40,-80}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermInsideWall1a
    annotation (Placement(transformation(extent={{80,20},{100,40}})));
  Modelica.Blocks.Interfaces.RealInput WindSpeedPort
    annotation (Placement(transformation(extent={{-109.5,-50},{-89.5,-30}})));
  Utilities.Interfaces.SolarRad_in SolarRadiationPort_OW1
    annotation (Placement(transformation(extent={{-109.5,20},{-89.5,40}})));
  Utilities.Interfaces.SolarRad_in SolarRadiationPort_OW2 annotation (Placement(
        transformation(
        origin={50.5,101},
        extent={{-10,-10},{10,10}},
        rotation=270), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=270,
        origin={50.5,99})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermCeiling
    annotation (Placement(transformation(extent={{80,60},{100,80}})));
  AixLib.ThermalZones.HighOrder.Components.Walls.Wall inside_wall1b(
    T0=T0_IW1b,
    outside=false,
    wallPar=wallTypes.IW2_vert_half_a,
    wall_length=room_lengthb,
    wall_height=room_height,
    withWindow=false,
    final withSunblind=use_sunblind,
    final Blinding=1 - ratioSunblind,
    final LimitSolIrr=solIrrThreshold,
    final TOutAirLimit=TOutAirLimit,
    withDoor=false) annotation (Placement(transformation(
        origin={61,-15},
        extent={{-3,-15},{3,15}},
        rotation=180)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a thermInsideWall1b
    annotation (Placement(transformation(extent={{80,-20},{100,0}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a ground
    annotation (Placement(transformation(extent={{-16,-104},{4,-84}})));

equation
  connect(thermInsideWall2, thermInsideWall2)
    annotation (Line(points={{30,-90},{30,-90}}, color={191,0,0}));
  connect(WindSpeedPort, outside_wall2.WindSpeedPort) annotation (Line(points={{-99.5,-40},{-80,-40},{-80,74},{42.8,74},{42.8,64.25}},
                                                                 color={0,0,127}));
  connect(outside_wall1.WindSpeedPort, WindSpeedPort) annotation (Line(points={{-58.25,36.2667},{-80,36.2667},{-80,-40},{-99.5,-40}},
                                                                color={0,0,127}));
  connect(outside_wall2.SolarRadiationPort, SolarRadiationPort_OW2) annotation (
     Line(points={{47.75,65.5},{47.75,74},{50.5,74},{50.5,88},{50.5,101}},
        color={255,128,0}));
  connect(Ceiling.port_outside, thermCeiling) annotation (Line(points={{-30,64.15},{-30,64.15},{-30,74},{84,74},{84,70},{90,70}},
                                                         color={191,0,0}));
  connect(inside_wall2.port_outside, thermInsideWall2) annotation (Line(points={{22,-64.2},{22,-77.3},{30,-77.3},{30,-90}},
                                                      color={191,0,0}));
  connect(inside_wall1a.port_outside, thermInsideWall1a) annotation (Line(
        points={{64.15,24},{77.225,24},{77.225,30},{90,30}}, color={191,0,0}));
  connect(inside_wall1b.port_outside, thermInsideWall1b) annotation (Line(
        points={{64.15,-15},{79.225,-15},{79.225,-10},{90,-10}}, color={191,0,0}));
  connect(SolarRadiationPort_OW1, outside_wall1.SolarRadiationPort) annotation (
     Line(points={{-99.5,30},{-80,30},{-80,41.5833},{-59.5,41.5833}}, color={255,
          128,0}));
  connect(thermInsideWall1b, thermInsideWall1b) annotation (Line(points={{90,-10},
          {85,-10},{85,-10},{90,-10}}, color={191,0,0}));
  connect(ground, floor.port_outside) annotation (Line(
      points={{-6,-94},{-6,-74},{-24,-74},{-24,-62.1},{-27,-62.1}},
      color={191,0,0},
      pattern=LinePattern.Dash));
  connect(outside_wall1.port_outside, thermOutside) annotation (Line(points={{-58.25,15},{-76,15},{-76,100},{-100,100}}, color={191,0,0}));
  connect(outside_wall2.port_outside, thermOutside) annotation (Line(points={{23,64.25},{23,76},{-52,76},{-52,100},{-100,100}}, color={191,0,0}));
  connect(floor.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{-27,-58},{-26,-58},{-26,-48},{-7,-48},{-7,-8}},              color={191,0,0}));
  connect(inside_wall2.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{22,-56},{22,-46},{-6,-46},{-6,-42},{-7,-42},{-7,-8}},              color={191,0,0}));
  connect(inside_wall1b.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{58,-15},{54,-15},{54,-46},{-6,-46},{-6,-42},{-7,-42},{-7,-8}},              color={191,0,0}));
  connect(inside_wall1a.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{58,24},{54,24},{54,-46},{-6,-46},{-6,-42},{-7,-42},{-7,-8}},              color={191,0,0}));
  connect(outside_wall2.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{23,54},{24,54},{24,46},{54,46},{54,-46},{-6,-46},{-6,-42},{-7,-42},{-7,-8}},              color={191,0,0}));
  connect(Ceiling.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{-30,58},{-30,46},{54,46},{54,-46},{-6,-46},{-6,-42},{-7,-42},{-7,-8}},              color={191,0,0}));
  connect(outside_wall1.thermStarComb_inside, thermStar_Demux.portConvRadComb) annotation (Line(points={{-48,15},{-42,15},{-42,46},{54,46},{54,-46},{-6,-46},{-6,-42},{-7,-42},{-7,-8}},              color={191,0,0}));
  annotation (Icon(graphics={
        Rectangle(
          extent={{-6,-46},{6,46}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid,
          origin={74,-22},
          radius=0),
        Rectangle(
          extent={{-80,80},{80,60}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{25,10},{-25,-10}},
          lineColor={0,0,0},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          origin={-25,70},
          rotation=180,
          visible=withWindow2),
        Rectangle(
          extent={{6,18},{-6,-18}},
          lineColor={0,0,0},
          fillColor={135,135,135},
          fillPattern=FillPattern.Solid,
          origin={74,42}),
        Rectangle(
          extent={{-80,60},{-60,-80}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,60},{68,-68}},
          lineColor={0,0,0},
          fillColor={47,102,173},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-60,-68},{80,-80}},
          lineColor={0,0,0},
          fillColor={215,215,215},
          fillPattern=FillPattern.Solid),
        Rectangle(
          extent={{-80,50},{-60,0}},
          lineColor={0,0,0},
          fillColor={170,213,255},
          fillPattern=FillPattern.Solid,
          visible=withWindow1),
        Rectangle(
          extent={{20,80},{40,60}},
          lineColor={0,0,0},
          fillColor={127,127,0},
          fillPattern=FillPattern.Solid,
          visible=withDoor2),
        Rectangle(
          extent={{-80,-20},{-60,-40}},
          lineColor={0,0,0},
          fillColor={127,127,0},
          fillPattern=FillPattern.Solid,
          visible=withDoor1),
        Line(points={{-46,-38},{-46,-68}}, color={255,255,255}),
        Line(points={{68,24},{56,24}}, color={255,255,255}),
        Text(
          extent={{-56,52},{64,40}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          textString="width"),
        Text(
          extent={{-120,6},{0,-6}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          origin={-46,56},
          rotation=90,
          textString="length"),
        Text(
          extent={{57,6},{-57,-6}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          origin={58,-23},
          rotation=90,
          textString="length_b"),
        Text(
          extent={{20,74},{40,66}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          textString="D2",
          visible=withDoor2),
        Text(
          extent={{-50,76},{0,64}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          textString="Win2",
          visible=withWindow2),
        Text(
          extent={{50,-6},{0,6}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          textString="Win1",
          origin={-70,0},
          rotation=90,
          visible=withWindow1),
        Text(
          extent={{2.85713,-4},{-17.1429,4}},
          lineColor={255,255,255},
          fillColor={255,170,170},
          fillPattern=FillPattern.Solid,
          textString="D1",
          origin={-70,-22.8571},
          rotation=90,
          visible=withDoor1),
        Line(points={{-46,60},{-46,30}}, color={255,255,255}),
        Line(points={{-60,46},{-30,46}}, color={255,255,255}),
        Line(points={{38,46},{68,46}}, color={255,255,255}),
        Line(points={{60,24},{60,16}}, color={255,255,255}),
        Line(points={{60,-64},{60,-68}}, color={255,255,255})}), Documentation(
        revisions="<html>
 <ul>
 <li><i>Mai 7, 2015</i> by Ana Constantin:<br/>Grount temperature depends on TRY</li>
 <li><i>April 18, 2014</i> by Ana Constantin:<br/>Added documentation</li>
 <li><i>July 7, 2011</i> by Ana Constantin:<br/>Implemented</li>
 </ul>
 </html>", info="<html>
 <h4><span style=\"color:#008000\">Overview</span></h4>
 <p>Model for a room with 2&nbsp;outer&nbsp;walls,&nbsp;2&nbsp;inner&nbsp;walls&nbsp;load towards two different rooms but with the same orientation,&nbsp;1&nbsp;inner&nbsp;wall&nbsp;simple,&nbsp;1&nbsp;floor&nbsp;towards&nbsp;ground,&nbsp;1&nbsp;ceiling&nbsp;towards&nbsp;upper&nbsp;floor.</p>
 <h4><span style=\"color:#008000\">Concept</span></h4>
 <p>The following figure presents the room&apos;s layout:</p>
 <p><img src=\"modelica://AixLib/Resources/Images/Building/HighOrder/2OW_2IWl_1IWs_1Gr_Pa.png\"
    alt=\"Room layout\"/></p>
<p><b><span style=\"color: #008000;\">Ground temperature</span></b> </p>
<p>The ground temperature can be coupled to any desired prescriped temperature. Anyway, suitable ground temperatures depending on locations in Germany are listed as &Theta;'_m,e in the comprehensive table 1 in &quot;Beiblatt 1&quot; in the norm DIN EN 12831.</p>
<p>Or a ground temperature can be chosen according to a TRY region, which is listed below: if ...</p><p>TRY_Region == 1 then 282.15 K</p><p>TRY_Region == 2 then 281.55 K</p><p>TRY_Region == 3 then 281.65 K</p><p>TRY_Region == 4 then 282.65 K</p><p>TRY_Region == 5 then 281.25 K</p><p>TRY_Region == 6 then 279.95 K</p><p>TRY_Region == 7 then 281.95 K</p><p>TRY_Region == 8 then 279.95 K</p><p>TRY_Region == 9 then 281.05 K</p><p>TRY_Region == 10 then 276.15 K</p><p>TRY_Region == 11 then 279.45 K</p><p>TRY_Region == 12 then 283.35 K</p><p>TRY_Region == 13 then 281.05 K</p><p>TRY_Region == 14 then 281.05 K</p><p>TRY_Region == 15 then 279.95 K </p>
</html>"));
end Ow2IwL2IwS1Gr1Uf1;
