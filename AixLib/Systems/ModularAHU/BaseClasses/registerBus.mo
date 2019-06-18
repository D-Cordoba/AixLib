﻿within AixLib.Systems.ModularAHU.BaseClasses;
expandable connector registerBus "Data bus for modular ahu registers"
  extends Modelica.Icons.SignalBus;
  import SI = Modelica.SIunits;
  Systems.HydraulicModules.BaseClasses.HydraulicBus hydraulicBus;
  SI.Temperature Tair_in "Inlet air temperature";
  SI.Temperature Tair_out "Outlet air temperatur";
  SI.VolumeFlowRate  VF_air  "Air volume flow";
  annotation (
    Icon(graphics,
         coordinateSystem(preserveAspectRatio=false)),
    Diagram(graphics,
            coordinateSystem(preserveAspectRatio=false)),
    Documentation(info="<html>
<p>Definition of a standard bus connector for ahu register modules. The bus connector includes the <a href=\"modelica://AixLib/Systems/HydraulicModules/BaseClasses/HydraulicBus.mo\">HydraulicBus</a>.</p>
</html>", revisions="<html>
<ul>
<li>January 23, 2018, by Alexander Kümpel:<br/>First implementation. </li>
</ul>
</html>"));
end registerBus;
