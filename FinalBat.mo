model FinalBat
  Modelica.Electrical.Analog.Sources.SignalCurrent signalCurrent2 annotation(
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Electrical.Batteries.Utilities.PulseSeries pulseSeries(T1 = 60, Tp = 60, Tp1 = 1, n1 = 7, n2 = 7, startTime = 60) annotation(
    Placement(visible = true, transformation(extent = {{-84, -70}, {-64, -50}}, rotation = 0)));
  parameter Modelica.Electrical.Batteries.ParameterRecords.TransientData.ExampleData cellData2(Idis = 0.1, Qnom (displayUnit = "C") = 18000, Ri = cellData2.OCVmax / 1200, nRC = 2, rcData = {Modelica.Electrical.Batteries.ParameterRecords.TransientData.RCData(R = 0.2 * cellData2.Ri, C = 60 / (0.2 * cellData2.Ri)), Modelica.Electrical.Batteries.ParameterRecords.TransientData.RCData(R = 0.1 * cellData2.Ri, C = 10 / (0.1 * cellData2.Ri))}, useLinearSOCDependency = false) annotation(
    Placement(visible = true, transformation(extent = {{60, -80}, {80, -60}}, rotation = 0)));
  Modelica.Electrical.Analog.Basic.Ground ground2 annotation(
    Placement(visible = true, transformation(extent = {{10, -100}, {30, -80}}, rotation = 0)));
  Modelica.Blocks.Continuous.Integrator energy2(u(unit = "W"), y(unit = "J")) annotation(
    Placement(visible = true, transformation(extent = {{60, -50}, {80, -30}}, rotation = 0)));
  Modelica.Electrical.Analog.Sensors.PowerSensor powerSensor2 annotation(
    Placement(visible = true, transformation(extent = {{10, -30}, {30, -10}}, rotation = 0)));
  Modelica.Electrical.Batteries.BatteryStacks.CellRCStack battery2(Np = 2, Ns = 10, SOC(fixed = true, start = 0.95), cellData = cellData2, useHeatPort = false) annotation(
    Placement(visible = true, transformation(origin = {40, -60}, extent = {{-10, 10}, {10, -10}}, rotation = 270)));
  Modelica.Blocks.Math.Gain gain(k = 75) annotation(
    Placement(visible = true, transformation(extent = {{-44, -70}, {-24, -50}}, rotation = 0)));
equation
  connect(powerSensor2.nc, battery2.p) annotation(
    Line(points = {{30, -20}, {40, -20}, {40, -50}}, color = {0, 0, 255}));
  connect(powerSensor2.pc, powerSensor2.pv) annotation(
    Line(points = {{10, -20}, {10, -10}, {20, -10}}, color = {0, 0, 255}));
  connect(powerSensor2.nv, ground2.p) annotation(
    Line(points = {{20, -30}, {20, -80}}, color = {0, 0, 255}));
  connect(signalCurrent2.p, powerSensor2.pc) annotation(
    Line(points = {{0, -50}, {0, -20}, {10, -20}}, color = {0, 0, 255}));
  connect(signalCurrent2.n, ground2.p) annotation(
    Line(points = {{0, -70}, {0, -80}, {20, -80}}, color = {0, 0, 255}));
  connect(battery2.n, ground2.p) annotation(
    Line(points = {{40, -70}, {40, -80}, {20, -80}}, color = {0, 0, 255}));
  connect(powerSensor2.power, energy2.u) annotation(
    Line(points = {{10, -31}, {10, -40}, {58, -40}}, color = {0, 0, 127}));
  connect(gain.y, signalCurrent2.i) annotation(
    Line(points = {{-23, -60}, {-12, -60}}, color = {0, 0, 127}));
  connect(pulseSeries.y, gain.u) annotation(
    Line(points = {{-63, -60}, {-46, -60}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "4.0.0")));
end FinalBat;
