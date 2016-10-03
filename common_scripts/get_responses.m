clear
settings;

%Sim settings
load_system('object_os.mdl');
objOsSimParams.SolverType = 'Fixed-step';
objOsSimParams.Solver = 'ode4';
objOsSimParams.StartTime = '0';
objOsSimParams.StopTime = num2str(params.simulationTime);
objOsSimParams.SaveTime = 'on';
objOsSimParams.SaveOutput = 'on';
objOsSimParams.OutputSaveName = 'data';
objOsSimParams.LimitDataPoints = 'off';
objOsSimParams.FixedStep = num2str(params.simulationStep);
%End of sim settings

%Input signal settings
set_param('object_os/Step', 'Time', num2str(params.tau));
%end input settings

%{
Start simulation
%}
for currentAmpl = 1:1:(params.exp_count)
    if currentAmpl == (params.exp_count/2)
        %currentAmpl = currentAmpl + 1;
        set_param('object_os/InputGain', 'Gain', num2str(-100));
        objectOsSim = sim('object_os', objOsSimParams);
        data = objectOsSim.get('data');
        time = objectOsSim.get('tout');
        simulation_array(:,:,currentAmpl) = [time, data];
        continue;
    end
    set_param('object_os/InputGain', 'Gain', num2str(-100+100/(params.exp_count/2)*currentAmpl));
    objectOsSim = sim('object_os', objOsSimParams);
    data = objectOsSim.get('data');
    time = objectOsSim.get('tout');
    simulation_array(:,:,currentAmpl) = [time, data];
end


%{
Plotting
%}
prompt = 'Display plot? y/n [n]: ';
str = input(prompt,'s');
switch(str)
    case 'y'
         countOfExp = size(simulation_array);
        hold on;
        grid on;
        for i=1:1:countOfExp(3)
            plot(simulation_array(1:countOfExp(1),1,i), simulation_array(1:countOfExp(1),2,i))
        end
    otherwise
end
%end plotting


%{
Saving results
%}
prompt = 'Save results? y/n [n]: ';
str = input(prompt,'s');
switch(str)
    case 'y'
        [currentPath, name,ext] = fileparts(mfilename('fullpath'));
        fileName = [currentPath,'\..\responses\'];
        fileName = [fileName, 'object_os@impulse#'];
        fileName = [fileName num2str(params.exp_count)];
        fileName = [fileName, '.mat'];
        save(fileName, 'simulation_array');
    otherwise
end
%end saving results

close_system('object_os', 0)