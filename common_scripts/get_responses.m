clear
settings;

simulationStep = 0.0001;
t = 0:simulationStep:3;
load_system('object_os.mdl');
objOsSimParams.SolverType = 'Fixed-step';
objOsSimParams.Solver = 'ode4';
objOsSimParams.StartTime = '0';
objOsSimParams.StopTime = '3';
objOsSimParams.SaveTime = 'on';
objOsSimParams.SaveOutput = 'on';
objOsSimParams.OutputSaveName = 'data';
objOsSimParams.LimitDataPoints = 'off';
objOsSimParams.FixedStep = num2str(simulationStep);
objectOsSim = sim('object_os', objOsSimParams)

data = objectOsSim.get('data');
time = objectOsSim.get('tout');


close_system('object_os', 0)

plot(time, data)