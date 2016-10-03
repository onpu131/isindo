
countOfExp = size(simulation_array);
for i=1:1:countOfExp(3)
  simulation_array(:,[2],i) = noise_rnd(simulation_array(:,[2],i), 0.01, params); 
end

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
