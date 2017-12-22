﻿within AixLib.DataBase.Surfaces.RoughnessForHT;

record ClearPine

  extends

    DataBase.Surfaces.RoughnessForHT.PolynomialCoefficients_ASHRAEHandbook(

    D=8.23,

    E=4.0,

    F=-0.057);



  annotation (Documentation(info="<html>
<h4>
  <font color=\"#008000\">Overview</font>
</h4>
<p>
  Material: Clear pine
</p>
<p>
  <img src=\"modelica://AixLib/Resources/Images/Stars/stars5.png\" alt=\"stars:" out="" of="">
</p>
<h4>
  <font color=\"#008000\">References</font>
</h4>
<p>
  Record is used in model <a href=\"AixLib.Utilities.HeatTransfer.HeatConv_outside\">AixLib.Utilities.HeatTransfer.HeatConv_outside</a>
</p>
<p>
  Source
</p>
<ul>
  <li>ASHRAE Handbook of Fundamentals. ASHRAE, 1989
  </li>
  <li>As cited inEnergyPlus Engineering Reference. : EnergyPlus Engineering Reference, 2011 p.56
  </li>
</ul></html>",revisions="<html>
<ul>
  <li>
    <i>August 30, 2013&#160;</i> by Ole Odendahl:<br/>
    Added documentation and formatted appropriately
  </li>
  <li>
    <i>March 21, 2012&#160;</i> by Ana Constantin:<br/>
    Implemented.
  </li>
</ul></html>",revisions="<html>

</html>"));

end ClearPine;

