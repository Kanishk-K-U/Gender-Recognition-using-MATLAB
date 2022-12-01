clc;clear all;close all;

[y ,Fs]=audioread('samples/m2.wav'); % Read the audio sample
frame=3500; % Set the frame rate

[b0,a0]=mybutter(350/(Fs/2)); % Get teh coefficient of the filter matrix
%% Identify the frequency of each frame
for i=1:length(y)/frame
    x=y(1+(i-1)*frame:i*frame);
    xin = abs(x);
    xin=myfilter(b0,a0,xin);    
    xin = xin-mean(xin);   
    x_out(1+(i-1)*frame:i*frame,1)=xin;
    x2=zeros(length(xin),1);
    x2(1:length(x)-1)=xin(2:length(x));
    zc=length(find((xin>0 & x2<0) | (xin<0 & x2>0)));
    F0(i)=0.5*Fs*zc/length(x);
    
end
Fx=mean(F0); % Take mean of all the frequency for each frame

%% Display the output frequency
fprintf('Estimated frequency is %3.2f Hz.\n',Fx);
fprintf('Estimated frequency by in-built function is %3.2f Hz.\n',mean(freq(y))); % Use the function freq to find the frequency

%% Display the final Gender
if Fx>165   % set the threshold
    fprintf('Female Voice\n');
else
    fprintf('Male Voice\n');
end