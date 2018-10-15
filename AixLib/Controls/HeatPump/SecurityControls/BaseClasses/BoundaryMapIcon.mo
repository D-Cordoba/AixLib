within AixLib.Controls.HeatPump.SecurityControls.BaseClasses;
partial model BoundaryMapIcon "PartialModel for the icon of a boundary map"

  parameter Boolean use_opeEnvFroRec=true
    "Use a the operational envelope given in the datasheet" annotation(Dialog(tab="Security Control", group="Operational Envelope"),choices(checkBox=true));
  parameter DataBase.HeatPump.HeatPumpBaseDataDefinition dataTable "Data Table of HP"
                       annotation(choicesAllMatching = true, Dialog(tab="Security Control", group="Operational Envelope",enable=
          use_opeEnvFroRec));
  parameter Real tableLow[:,2] "Table matrix (grid = first column; e.g., table=[0,2])" annotation(choicesAllMatchning=true, Dialog(tab="Security Control", group="Operational Envelope",
        enable=not use_opeEnvFroRec));
  parameter Real tableUpp[:,2] "Table matrix (grid = first column; e.g., table=[0,2])"
    annotation (Dialog(tab="Security Control", group="Operational Envelope", enable=not use_opeEnvFroRec));
  parameter Real iconMin=-70
    "Used to set the frame where the icon should appear"
    annotation (Dialog(tab="Dynamic Icon"));
  parameter Real iconMax = 70
    "Used to set the frame where the icon should appear"
    annotation (Dialog(tab="Dynamic Icon"));
protected
  parameter Real tableLow_internal[:,2] = if use_opeEnvFroRec then dataTable.tableLowBou else tableLow;
  parameter Real tableUpp_internal[:,2] = if use_opeEnvFroRec then dataTable.tableUppBou else tableUpp;
  parameter Real xMax=min(tableLow_internal[end, 1], tableUpp_internal[end, 1])
    "Minimal value of lower and upper table data";
  parameter Real xMin=max(tableLow_internal[1, 1], tableUpp_internal[1, 1])
    "Maximal value of lower and upper table data";
  parameter Real yMax=max(tableUpp_internal[:, 2])
    "Minimal value of lower and upper table data";
  parameter Real yMin=min(tableLow_internal[:, 2])
    "Maximal value of lower and upper table data";
  final Real[size(scaledX, 1), 2] points=transpose({unScaledX,unScaledY}) annotation(Hide=false);
  Real tableMerge[:,2] = [tableLow_internal[1,1],tableLow_internal[1,2];tableUpp_internal;[Modelica.Math.Vectors.reverse(tableLow_internal[:,1]),Modelica.Math.Vectors.reverse(tableLow_internal[:,2])]];
  input Real scaledX[:] = tableMerge[:,1];
  input Real scaledY[:] = tableMerge[:,2];
  Real unScaledX[size(scaledX, 1)](min=-100, max=100) = (scaledX - fill(xMin, size(scaledX, 1)))*(iconMax-iconMin)/(xMax - xMin) + fill(iconMin, size(scaledX,1));
  Real unScaledY[size(scaledX, 1)](min=-100, max=100) = (scaledY - fill(yMin, size(scaledY, 1)))*(iconMax-iconMin)/(yMax - yMin) + fill(iconMin, size(scaledY,1));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,-100},
            {100,100}}),                                        graphics={
        Rectangle(
          extent={{iconMin-25,iconMax+25},{iconMax+25,iconMin-25}},
          lineColor={28,108,200},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Line(points=DynamicSelect({{-66,-66},{-66,50},{-44,66},
              {68,66},{68,-66},{-66,-66}},points),                          color={238,46,47},
          thickness=0.5),
        Polygon(
          points={{iconMin-20,iconMax},{iconMin-20,iconMax},{iconMin-10,iconMax},{iconMin-15,iconMax+20}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Polygon(
          points={{iconMax+20,iconMin-10},{iconMax,iconMin-4},{iconMax,iconMin-16},{iconMax+20,iconMin-10}},
          lineColor={95,95,95},
          fillColor={95,95,95},
          fillPattern=FillPattern.Solid),
        Line(points={{iconMin-15,iconMax},{iconMin-15,iconMin-15}}, color={95,95,95}),
        Line(points={{iconMin-20,iconMin-10},{iconMax+10,iconMin-10}}, color={95,95,95})}), coordinateSystem(preserveAspectRatio=false), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end BoundaryMapIcon;
