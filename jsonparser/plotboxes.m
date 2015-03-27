function plotboxes(signal,varargin)
nkeys = length(signal);
e = [];
if ~isempty(varargin)
    e = varargin{1};
    for v=2:length(varargin)
        e = [e,'|', varargin{v}];        
    end
end
for k=1:nkeys
    
    sn = signal(k).signalName;
    if ~isempty(e)
        m = regexp(sn,e,'ONCE');
        if isempty(m)
            continue
        end
        %     if ~(strcmp(sn,'tau_0_0') || strcmp(sn,'sx_0_0') || strcmp(sn,'sy_0_0'))
        %         if ~(strcmp(sn,'v_0_0') || strcmp(sn,'sx_dot_0_0') || strcmp(sn,'v_0_0'))
        %         continue
    end
    disp(['plotting ',sn,'...'])
    figure
    hold on
    N=20;
    
    for i=1:length(signal(k).timesteps)
        ts = signal(k).timesteps{i};
        it = signal(k).intervals{i};
        w = ts(2) - ts(1);
        h = it(2) - it(1);
        
        if w==0
            hv = it(1):h/N:it(1);
            plot(ts(1)*ones(1,length(hv)), hv)
            hold on
            
        elseif h==0
            wv = ts(1):w/N:ts(2);
            plot(wv, it(1)*ones(1,length(wv)))
            hold on
            
        else
            
            rectangle('position', [ts(1),it(1), w,h], 'facecolor', 'b')
            
            hold on
            
        end
        
    end
    title(sn)
    
end



