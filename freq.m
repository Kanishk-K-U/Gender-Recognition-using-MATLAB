function [ f0 ] = freq( x ,fs)
oneCast = 1;
r       = length(x);
c       = 1;
WindowLength=2293;
hopLength =441;
numHopsFinal = ceil((r-WindowLength)/hopLength) + oneCast;
N= 2293;
hopSize = 441;
numHops = ceil((r-N)/hopSize) + oneCast;
y = zeros(N,numHops);
    for hop = 1:numHops
        temp = x(1+hopSize*(hop-1):min(N+hopSize*(hop-1),r),1);
        y(1:min(N,numel(temp)),hop) = temp;
    end

f0 = NCF(y);
bE =[50,400];
f0(f0<bE(1))   = bE(1);
f0(f0>bE(end)) = bE(end);
f0 = reshape(f0,numHopsFinal,c);

end

function f0 = NCF(y)
ran=[50,400];
fs=44100;
edge = round(fs./fliplr(ran));
r    = cast(size(y,1),'like',y);
mxl = min(edge(end),r - 1);
m2  = 2^nextpow2(2*r - 1);
c1  = real(ifft(abs(fft(y,m2,1)).^2,[],1))./sqrt(m2);
Rt  = [c1(m2 - mxl + (1:mxl),:); c1(1:mxl+1,:)];
yRMS = sqrt(Rt(edge(end)+1,:));
lag  = Rt( (edge(end)+1+edge(1)):end, : );
yRMS = repmat(yRMS,size(lag,1),1);
lag = lag./yRMS;
domain = [zeros(edge(1)-1,size(lag,2));lag];
locs = getCandidates(domain,edge);
f0 = fs./locs;
end

function locs = getCandidates(domain,edge)
numCol = size(domain,2);
locs = zeros(numCol,1,'like',domain);
lower  = edge(1);
upper  = edge(end);
assert(upper<192000);
domain = domain(lower:upper,:);
for c = 1:numCol
    [~,tempLoc] = max( domain(:,c) );
    locs(c) = tempLoc;
end
locs = lower + locs - 1;
end

