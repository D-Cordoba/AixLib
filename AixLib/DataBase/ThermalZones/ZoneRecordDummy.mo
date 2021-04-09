within AixLib.DataBase.ThermalZones;
record ZoneRecordDummy "This is a dummy record with non-physical parameter values."
  extends AixLib.DataBase.ThermalZones.ZoneBaseRecord(
    T_start=Modelica.Constants.eps,
    withAirCap=true,
    VAir=Modelica.Constants.inf,
    AZone=Modelica.Constants.inf,
    hRad=Modelica.Constants.eps,
    lat=Modelica.Constants.eps,
    nOrientations=1,
    AWin=fill(Modelica.Constants.eps, nOrientations),
    ATransparent=fill(Modelica.Constants.eps, nOrientations),
    hConWin=Modelica.Constants.eps,
    RWin=Modelica.Constants.inf,
    gWin=Modelica.Constants.eps,
    UWin=Modelica.Constants.eps,
    ratioWinConRad=Modelica.Constants.eps,
    AExt=fill(Modelica.Constants.inf, nOrientations),
    hConExt=Modelica.Constants.eps,
    nExt=1,
    RExt=fill(Modelica.Constants.inf, nExt),
    RExtRem=Modelica.Constants.inf,
    CExt=fill(Modelica.Constants.inf, nExt),
    AInt=Modelica.Constants.inf,
    hConInt=Modelica.Constants.eps,
    nInt=1,
    RInt=fill(Modelica.Constants.inf, nExt),
    CInt=fill(Modelica.Constants.inf, nExt),
    AFloor=Modelica.Constants.inf,
    hConFloor=Modelica.Constants.eps,
    nFloor=1,
    RFloor=fill(Modelica.Constants.inf, nFloor),
    RFloorRem=Modelica.Constants.inf,
    CFloor=fill(Modelica.Constants.inf, nFloor),
    ARoof=Modelica.Constants.inf,
    hConRoof=Modelica.Constants.eps,
    nRoof=1,
    RRoof=fill(Modelica.Constants.inf, nRoof),
    RRoofRem=Modelica.Constants.inf,
    CRoof=fill(Modelica.Constants.inf, nRoof),
    nOrientationsRoof=1,
    tiltRoof=fill(Modelica.Constants.eps, nOrientationsRoof),
    aziRoof=fill(Modelica.Constants.eps, nOrientationsRoof),
    wfRoof=fill(Modelica.Constants.eps/nOrientationsRoof, nOrientationsRoof),
    aRoof=Modelica.Constants.eps,
    aExt=Modelica.Constants.eps,
    TSoil=Modelica.Constants.eps,
    hConWallOut=Modelica.Constants.eps,
    hRadWall=Modelica.Constants.eps,
    hConWinOut=Modelica.Constants.eps,
    hConRoofOut=Modelica.Constants.eps,
    hRadRoof=Modelica.Constants.eps,
    tiltExtWalls=fill(Modelica.Constants.eps, nOrientations),
    aziExtWalls=fill(Modelica.Constants.eps, nOrientations),
    wfWall=fill(1/nOrientations, nOrientations),
    wfWin=fill(1/nOrientations, nOrientations),
    wfGro=Modelica.Constants.eps,
    specificPeople=Modelica.Constants.eps,
    activityDegree=Modelica.Constants.eps,
    fixedHeatFlowRatePersons=Modelica.Constants.eps,
    ratioConvectiveHeatPeople=Modelica.Constants.eps,
    internalGainsMoistureNoPeople=Modelica.Constants.eps,
    internalGainsMachinesSpecific=Modelica.Constants.eps,
    ratioConvectiveHeatMachines=Modelica.Constants.eps,
    lightingPowerSpecific=Modelica.Constants.eps,
    ratioConvectiveHeatLighting=Modelica.Constants.eps,
    useConstantACHrate=false,
    baseACH=Modelica.Constants.eps,
    maxUserACH=1,
    maxOverheatingACH={Modelica.Constants.inf,Modelica.Constants.eps},
    maxSummerACH={Modelica.Constants.eps,Modelica.Constants.eps,2*Modelica.Constants.eps},
    winterReduction={Modelica.Constants.eps,Modelica.Constants.eps,2*Modelica.Constants.eps},
    withAHU=false,
    minAHU=Modelica.Constants.eps,
    maxAHU=2*Modelica.Constants.eps,
    shadingFactor=fill(Modelica.Constants.eps, nOrientations),
    maxIrr=fill(Modelica.Constants.eps, nOrientations),
    hHeat=2*Modelica.Constants.eps,
    lHeat=Modelica.Constants.eps,
    KRHeat=Modelica.Constants.eps,
    TNHeat=Modelica.Constants.eps,
    HeaterOn=false,
    hCool=-1*Modelica.Constants.eps,
    lCool=-2*Modelica.Constants.eps,
    KRCool=Modelica.Constants.eps,
    TNCool=Modelica.Constants.eps,
    CoolerOn=false,
    TThresholdHeater=Modelica.Constants.eps,
    TThresholdCooler=2*Modelica.Constants.eps,
    withIdealThresholds=false,
    TThresholdHeaterTabs = Modelica.Constants.eps,
    TThresholdCoolerTabs = 2*Modelica.Constants.eps,
    powerHeatTabs = Modelica.Constants.eps,
    powerCoolTabs = Modelica.Constants.eps,
    hHeatPanel = Modelica.Constants.eps,
    lHeatPanel = Modelica.Constants.eps,
    KRHeatPanel = Modelica.Constants.eps,
    TNHeatPanel = Modelica.Constants.eps,
    hCoolPanel = Modelica.Constants.eps,
    lCoolPanel = Modelica.Constants.eps,
    KRCoolPanel = Modelica.Constants.eps,
    TNCoolPanel = Modelica.Constants.eps,
    hHeatRem = Modelica.Constants.eps,
    lHeatRem = Modelica.Constants.eps,
    KRHeatRem = Modelica.Constants.eps,
    TNHeatRem = Modelica.Constants.eps,
    hCoolRem = Modelica.Constants.eps,
    lCoolRem = Modelica.Constants.eps,
    KRCoolRem = Modelica.Constants.eps,
    TNCoolRem = Modelica.Constants.eps,
    shareHeatTabsExt = Modelica.Constants.eps,
    shareHeatTabsInt = Modelica.Constants.eps,
    shareHeatPanelExt = Modelica.Constants.eps,
    shareHeatPanelInt = Modelica.Constants.eps,
    shareHeatRadExt = Modelica.Constants.eps,
    shareHeatRadInt = Modelica.Constants.eps,
    shareHeatConv = Modelica.Constants.eps,
    shareCoolTabsExt = Modelica.Constants.eps,
    shareCoolTabsInt = Modelica.Constants.eps,
    shareCoolPanelExt = Modelica.Constants.eps,
    shareCoolPanelInt = Modelica.Constants.eps,
    shareCoolRadExt = Modelica.Constants.eps,
    shareCoolRadInt = Modelica.Constants.eps,
    shareCoolConv = Modelica.Constants.eps);
  annotation (Documentation(revisions="<html><ul>
  <li>
    <i>March 20, 2020 by Philipp Mehrfeld:</i><br/>
    <a href=\"https://github.com/RWTH-EBC/AixLib/issues/879\">#879</a>
    Implement dummy zone record to assign this record as default
    parameter value, where unavoidable.
  </li>
</ul>
</html>"));
end ZoneRecordDummy;
