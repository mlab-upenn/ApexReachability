function outname = jsonbuild(jsonfile)

fid = fopen([jsonfile,'.json']);
tline = fgetl(fid);
nkeys = 0;
while ischar(tline)
    %fprintf('%s\n',tline)
    key = regexp(tline, 'key": "(?<signalName>\w+)"', 'names');
    tokens = regexp(tline, '"time":\s+(?<timestep>\[.*\]),\s+"enclosure":\s+(?<interval>\[.*\])', 'names');
    if ~isempty(key)
        nkeys = nkeys + 1;
        disp(key.signalName);
        i2 = 0; % initialize counter of timesteps
        signal(nkeys).signalName = key.signalName;
        signal(nkeys).timesteps = [];
        signal(nkeys).intervals = [];
    elseif ~isempty(tokens)
        if i2 > 14
            continue
        end

        %"time": [0, 0], "enclosure": [0, 0]},
        i2=i2+1;
        signal(nkeys).timesteps{i2} = str2num(tokens.timestep);
        signal(nkeys).intervals{i2} = str2num(tokens.interval);
    end

    tline = fgetl(fid);
end

fclose(fid);
outname = [jsonfile, '.mat'];
save(outname, 'signal')
disp(['Wrote ',outname])