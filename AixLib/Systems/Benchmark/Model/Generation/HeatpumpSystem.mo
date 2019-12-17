within AixLib.Systems.Benchmark.Model.Generation;
model HeatpumpSystem "Heatpump system for cold and hot water generation"
  extends AixLib.Systems.EONERC_MainBuilding.HeatpumpSystem(pump_cold(
        PumpInterface(pump(redeclare
            AixLib.Fluid.Movers.Data.Pumps.Wilo.VeroLine50slash150dash4slash2
            per))), heatPump(redeclare model PerDataMainHP =
          AixLib.DataBase.ThermalMachines.HeatPump.PerformanceData.LookUpTable2D
          ( dataTable=HeatpumpBenchmarkSystem()),
        redeclare model PerDataRevHP =
          AixLib.DataBase.ThermalMachines.HeatPump.PerformanceData.LookUpTable2D
          ( dataTable=HeatpumpBenchmarkSystem())),
    heatStorage(data=DataBase.Storage.Generic_22000l()),
    coldStorage(data=DataBase.Storage.Generic_46000l()));

  annotation (Icon(coordinateSystem(preserveAspectRatio=false)), Diagram(
        coordinateSystem(preserveAspectRatio=false)));
end HeatpumpSystem;
