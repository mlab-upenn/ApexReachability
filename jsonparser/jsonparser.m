jsonfile = 'smaller';
% fid = fopen([jsonfile,'.json']);
% tline = fgetl(fid);
% nkeys = 0;
% while ischar(tline)
%     %fprintf('%s\n',tline)
%     key = regexp(tline, 'key": "(?<signalName>\w+)"', 'names');
%     tokens = regexp(tline, '"time":\s+(?<timestep>\[.*\]),\s+"enclosure":\s+(?<interval>\[.*\])', 'names');
%     if ~isempty(key)
%         nkeys = nkeys + 1;
%         disp(key.signalName);
%         i2 = 0; % initialize counter of timesteps
%         signal(nkeys).signalName = key.signalName;
%         signal(nkeys).timesteps = [];
%         signal(nkeys).intervals = [];
%     elseif ~isempty(tokens)
%         if i2 > 14
%             continue
%         end
%
%         %"time": [0, 0], "enclosure": [0, 0]},
%         i2=i2+1;
%         signal(nkeys).timesteps{i2} = str2num(tokens.timestep);
%         signal(nkeys).intervals{i2} = str2num(tokens.interval);
%     end
%
%     tline = fgetl(fid);
% end
%
% fclose(fid);
% save([jsonfile, '_signal.mat', 'signal')

load('smaller_signal.mat');
% survivorpairs(p,1) is the index of the signal in signal, and
% survivorpairs(p,2) is the index of the signal's derivative in signal.
survivorpairs = [1,2];
for p=1:size(survivorpairs,1)
    xt      = signal(survivorpairs(p,1)).timesteps;
    x       = signal(survivorpairs(p,1)).intervals;
    xtdot   = signal(survivorpairs(p,2)).timesteps;
    xdot    = signal(survivorpairs(p,2)).intervals;
    % sort the x intervals
    nbinterv    = length(x);
    xlowerep    = zeros(nbinterv,1);
    xupperep    = xlowerep;
    xdotlowerep = xlowerep;
    xdotupperep = xlowerep;
    for i = 1:nbinterv
        xlowerep(i) = x{i}(1,1);
        xupperep(i) = x{i}(1,2);
        xdotlowerep(i) = xdot{i}(1,1);
        xdotupperep(i) = xdot{i}(1,2);
    end
    xdotmin = min(xdotlowerep);
    xdotmax = max(xdotupperep);
    
    % First, sort all the end points together
    myintervals     = [xlowerep, xupperep];
    myDOTintervals  = [xdotlowerep, xdotupperep];
    sepmeta.index   = [1:nbinterv, 1:nbinterv]'; % an index to the intervals in myintervals
    sepmeta.startend = [zeros(nbinterv,1); ones(nbinterv,1)]; % 0 to indicate starting an interval, 1 to indicate ending it
    [sep,ix]  = sort([xlowerep; xupperep]);
    
    % Now sort the metadata to keep it synchronized with sep
    % index(k) is the index in  myintervals of the interval to which
    % belongs sep(k). I.e. sep(k) either starts or ends myintervals(k,:)
    sepmeta.index       = sepmeta.index(ix);
    
    % if startend(k)=0, this means sep(k) start the interval
    % myintervals(k,:). Else, it ends it.
    sepmeta.startend    = sepmeta.startend(ix);
    
    % sep can have repeated entries in case one interval ends where another
    % begins. For those repeated points, associate them with all the
    % intervals they either begin or start
    d = sep(2:end) - sep(1:end-1); % d(i) = 0 means sep(i) = sep(i+1) and so we collapse them
    guard = 0;
    i = 1;
    k = 1;
    while 1
        guard = guard+1;
        % add this endpoint
        collapsed(k).endpoints = sep(i);
        collapsed(k).starting_intervals = [];
        collapsed(k).ending_intervals   = [];
        if sepmeta.startend(i) == 0
            collapsed(k).starting_intervals = sepmeta.index(i);
        else
            collapsed(k).ending_intervals = sepmeta.index(i);
        end
        % Now check if it is shared with other intervals
        j=0;
        if i < length(sep)
            while d(i+j)==0
                i2 = i+j+1;
                if sepmeta.startend(i2) == 0
                    collapsed(k).starting_intervals = [collapsed(k).starting_intervals, sepmeta.index(i2)];
                else
                    collapsed(k).ending_intervals = [collapsed(k).ending_intervals, sepmeta.index(i2)];
                end
                j=j+1;
            end
        end
        i = i+j+1;
        k = k+1;
        if i > length(sep)
            break
        end
    end
    
    % Now traverse the sep left to right. Each sep point gets associated
    % with the xDOT intervals starting there. xDOT intervals already in
    % flight and who die here are removed from the list.
    divided = zeros(length(collapsed),4);
    inflight = [];
    for i=1:length(collapsed)-1
        x = collapsed(i).endpoints;
        % y is decided from inflight intervals and intervals starting here
        % First remove intervals that ended here from inflight
        if ~isempty(inflight)
            inflight = setdiff(inflight, collapsed(i).ending_intervals);
            y1 = myDOTintervals(inflight,1);
        else
            % If  empty_intervals is not empty, this indicates what
            % intervals are ending there and therefore give their range to
            % the union. If it is empty, then this is just empty.
            y1 = collapsed(i).ending_intervals;
        end
        y2 = myDOTintervals(collapsed(i).starting_intervals,1);
        if ~isempty(collapsed(i).starting_intervals)
            inflight = [inflight, collapsed(i).starting_intervals];
        end
        y = min([y1;y2]);
        assert(~isempty(y), 'either something is inflight or something started, can not have neither')
        width = collapsed(i+1).endpoints - x;
        height = max([y1;y2])-y;
        divided(i,:) = [x,y,width,height];
    end
    
    
    figure
    N = 20;
    for i=1:length(divided)
        x=divided(i,1);y=divided(i,2);width = divided(i,3); height = divided(i,4);
        if width==0
            vy = y:height/N:y+height;
            plot(x*ones(1,length(vy)), vy)
            hold on
        elseif height==0
            vx =x:width/N:x+width ;
            plot(vx, y*ones(1,length(vx)))
            hold on
        else
            rectangle('position', divided(i,:),'facecolor','b')
        end
    end
    
    
end


%

