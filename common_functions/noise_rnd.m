%simulation_array
function [s] = noise_rnd(s, noise, params)
    type = params.type;
    if strcmp(type, 'rel')
        base = params.base;
    end
    randomizer = params.randomizer;

    switch type
        case 'abs'
            r = getRand(randomizer, size(s));
            s = s + noise * 2 * (r - 0.5);
        case 'rel'
            switch base
                case 'min'
                    m = max(abs(s));
                    m = min(m(m~=0));
                case 'max'
                    m = max(abs(s));
                    m = max(m(m~=0));
                otherwise
                    disp('Error: Unknown base!');
            end
            for i = 1 : size(s, 2)
                si = s(:, i);
                r = getRand(randomizer, size(si));
                si = si + noise * m * 2 * (r); % randn
                si = si + noise * m * 2 * (r-0.5); % rand
                s(:, i) = si;
            end
        otherwise
            disp('Error: Unknown type!');
            return;
    end
end


function [ r ] = getRand(randomizer, size)
    switch randomizer
        case 'rand'
            r = rand(size);
        case 'randn'
            r = randn(size);
        otherwise
            disp('Error: Unknown randomizer!');
            return;
    end
end