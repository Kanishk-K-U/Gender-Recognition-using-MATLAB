clc;
clear all;
close all;

[man,FS]= audioread('samples/f3.wav');
[f0,idx] = freq(man);
b=mean(f0);
if b>165
fprintf("Female Voice");
else
fprintf('Male Voice');
end