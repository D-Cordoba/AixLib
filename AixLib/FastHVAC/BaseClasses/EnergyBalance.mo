within AixLib.FastHVAC.BaseClasses;
model EnergyBalance "Base class depicts energy and mass balances"
  Modelica.SIunits.MassFlowRate m_flow "";
  AixLib.FastHVAC.Interfaces.EnthalpyPort_a enthalpyPort_a
    "Enthalpie input port includes the parameter temperature, specific enthalpy, specific heat capacity and mass flow"
    annotation (Placement(transformation(extent={{-100,-20},{-40,38}}),
        iconTransformation(extent={{-100,-20},{-60,20}})));
  AixLib.FastHVAC.Interfaces.EnthalpyPort_b enthalpyPort_b
    "Enthalpie output port includes the parameter temperature, specific enthalpy, specific heat capacity and mass flow"
    annotation (Placement(transformation(extent={{40,-20},{100,40}}),
        iconTransformation(extent={{60,-20},{100,20}})));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a heatPort_a
    "Heat port includes the parameter temperature and heat flow"
                                                               annotation (Placement(
        transformation(extent={{-20,60},{20,100}}), iconTransformation(extent={{
            -20,60},{20,100}})));

equation
  // Mass and energy balances
  m_flow = enthalpyPort_a.m_flow;
  enthalpyPort_a.m_flow + enthalpyPort_b.m_flow = 0;
  enthalpyPort_b.T_outflow = heatPort_a.T;
  enthalpyPort_a.T_outflow = heatPort_a.T;
  enthalpyPort_b.h_outflow = inStream(enthalpyPort_a.c_outflow) * heatPort_a.T;
  enthalpyPort_a.h_outflow = inStream(enthalpyPort_b.c_outflow) * heatPort_a.T;

  actualStream(enthalpyPort_b.c_outflow) = actualStream(enthalpyPort_a.c_outflow);

  enthalpyPort_a.p = 1000;
  enthalpyPort_b.p = 1000;

  heatPort_a.Q_flow = - m_flow * (actualStream(enthalpyPort_a.h_outflow) - actualStream(enthalpyPort_b.h_outflow))
  annotation (Icon(coordinateSystem(preserveAspectRatio=false, extent={{-100,
            -100},{100,100}}), graphics={Rectangle(
          extent={{-60,60},{60,-60}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid), Text(
          extent={{-44,34},{44,-16}},
          lineColor={0,0,255},
          fillColor={255,255,255},
          fillPattern=FillPattern.Solid,
          textString="energyBalance")}), Diagram(coordinateSystem(
          preserveAspectRatio=false, extent={{-100,-100},{100,100}}),
        graphics),
    Documentation(info="<html><ul>
  <li>Base class EnergyBalance depicts change of condition of the fluid
  due to heat transfer.
  </li>
  <li>Two enthalpy ports describe the input and output condition of the
  fluid (temperature, specific enthalpy, specific heat capacity, mass
  flow).
  </li>
  <li>One thermal port depicts the heat flow, which is transfered on
  the fluid
  </li>
</ul>
</html>", revisions="<html>
<ul>
  <li>
    <br/>
    April 25, 2017, by Michael Mans:<br/>
    Moved to AixLib
  </li>
</ul>
</html>"));

end EnergyBalance;
