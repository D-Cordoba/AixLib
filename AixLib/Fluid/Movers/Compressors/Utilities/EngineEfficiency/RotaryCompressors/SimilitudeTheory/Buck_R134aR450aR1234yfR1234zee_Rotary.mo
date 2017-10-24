within AixLib.Fluid.Movers.Compressors.Utilities.EngineEfficiency.RotaryCompressors.SimilitudeTheory;
model Buck_R134aR450aR1234yfR1234zee_Rotary
  "Power - Similutude for R134a, R450a, R1234yf, R1234ze(e) - Rotary"
  extends PowerEngineEfficiency(
    final useIseWor=true,
    final MRef = 0.102032,
    final rotSpeRef = 9.334,
    final powMod=Choices.EnginePowerModels.MendozaMirandaEtAl2016,
    final a=1,
    final b={-0.1642,0.2050,0.0659,07669});

end Buck_R134aR450aR1234yfR1234zee_Rotary;
