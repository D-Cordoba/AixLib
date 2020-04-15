within AixLib.Airflow.AirHandlingUnit.ModularAirHandlingUnit.Controler;
model ControlerCooler
  parameter Boolean dehumidifying = false
    "true if dehumidifying is done in cooler";
  parameter Boolean use_PhiSet = false
    "true if relative humidity is controlled, otherwise absolute humidity is controlled";

  Modelica.Blocks.Interfaces.RealInput Tset
    "set value for temperature at cooler outlet"
    annotation (Placement(transformation(extent={{-140,30},{-100,70}}),
        iconTransformation(extent={{-120,50},{-100,70}})));
  Modelica.Blocks.Interfaces.RealInput Xset if dehumidifying and not use_PhiSet
    "set value for absolute humidity at cooler outlet"
    annotation (Placement(transformation(extent={{-140,-30},{-100,10}}),
        iconTransformation(extent={{-120,-10},{-100,10}})));
  Modelica.Blocks.Interfaces.RealInput PhiSet if dehumidifying and use_PhiSet
    "set value for relative humidity at ahu outlet"
    annotation (Placement(transformation(extent={{-140,-90},{-100,-50}}),
        iconTransformation(extent={{-120,-70},{-100,-50}})));
  Utilities.Psychrometrics.X_pTphi x_pTphi(use_p_in=false) if use_PhiSet
    annotation (Placement(transformation(extent={{-60,-44},{-40,-24}})));
  Utilities.Psychrometrics.TDewPoi_pW dewPoi
    annotation (Placement(transformation(extent={{-38,8},{-28,18}})));
  Utilities.Psychrometrics.pW_X pWat(use_p_in=false)
    annotation (Placement(transformation(extent={{-58,8},{-48,18}})));
  Modelica.Blocks.Interfaces.RealInput X_coolerIn
    "absolute humidity at inlet of cooler" annotation (Placement(transformation(
        extent={{-20,-20},{20,20}},
        rotation=90,
        origin={10,-120}), iconTransformation(
        extent={{-10,-10},{10,10}},
        rotation=90,
        origin={0,-110})));
  Modelica.SIunits.Temperature TsetCoo "internal set value for temperature at cooler outlet";
  Modelica.Blocks.Sources.RealExpression Tintern(y=TsetCoo)
    annotation (Placement(transformation(extent={{20,14},{40,34}})));
  Modelica.Blocks.Interfaces.RealOutput TCooSet
    "set value for temperature control of cooler"
    annotation (Placement(transformation(extent={{100,30},{120,50}})));
  Modelica.Blocks.Interfaces.RealOutput XCooSet if dehumidifying
    "set value for humidity control of cooler"
    annotation (Placement(transformation(extent={{100,-50},{120,-30}})));
protected
  Modelica.Blocks.Interfaces.RealInput X_intern "internal mass fraction";
equation

  if not dehumidifying then
    X_intern = X_coolerIn;
  else
    if use_PhiSet then
      connect(X_intern,x_pTphi.X[1]);
    else
      connect(X_intern,Xset);
    end if;
  end if;

  TsetCoo = smooth(1, if X_intern < X_coolerIn then dewPoi.T else Tset);

  connect(X_intern, pWat.X_w);

  connect(Tset, x_pTphi.T) annotation (Line(points={{-120,50},{-76,50},{-76,-34},
          {-62,-34}}, color={0,0,127}));
  connect(PhiSet, x_pTphi.phi) annotation (Line(points={{-120,-70},{-76,-70},{-76,
          -40},{-62,-40}},                     color={0,0,127}));
  connect(pWat.p_w, dewPoi.p_w) annotation (Line(points={{-47.5,13},{-42.75,13},
          {-42.75,13},{-38.5,13}}, color={0,0,127}));

  connect(Tintern.y, TCooSet) annotation (Line(points={{41,24},{58,24},{58,40},{
          110,40}}, color={0,0,127}));
  connect(X_intern, XCooSet);
  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end ControlerCooler;
