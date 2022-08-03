clear;
clc;
%close all;
vib1=readtable('vibration_fdm4.txt');
vib2=vib1(:,1:4);
vib=table2array(vib2);
%{
% Starting the engine
s1=24450;
s2=24900;
%}
% Idle (800 RPM)
s1=57000;
s2=57200;
%{
% 2000 RPM
s1=61700;
s2=62100;
%
% 3000 RPM
s1=74400;
s2=74800;
%
% Turn Off the engine
s1=79750;
s2=80050;
%}

t=vib(s1:s2,1);
sbx=vib(s1:s2,2);
%sbx=highpass(xxx,25,1/0.0038);
sby=vib(s1:s2,3);
%sby=highpass(yyy,25,1/0.0038);
sbz=vib(s1:s2,4);
%sbz=highpass(zzz,25,1/0.0038);

J=500;
subplot(3,2,1);
plot(vib(s1-J:s2+J,1),vib(s1-J:s2+J,2),t,sbx);
title('Getaran Sumbu X')
xlabel('waktu (s)')
ylabel('Magnitude (m/s^2)')
subplot(3,2,3);
plot(vib(s1-J:s2+J,1),vib(s1-J:s2+J,3),t,sby);
title('Getaran Sumbu Y')
xlabel('waktu (s)')
ylabel('Magnitude (m/s^2)')
subplot(3,2,5);
plot(vib(s1-J:s2+J,1),vib(s1-J:s2+J,4),t,sbz);
title('Getaran Sumbu Z')
xlabel('waktu (s)')
ylabel('Magnitude (m/s^2)')

T=0.0038;               % Sampling Period
Fs=1/T;                 % Sampling Frequency
L = s2-s1;              % Length of signal

f = Fs*(1:(L/2))/L;
Y=fft(sbx);
P2 = abs(Y/L);
P1 = P2(2:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
subplot(3,2,2);
bar(f,P1)
title('Spektrum Getaran Sumbu X')
xlabel('f (Hz)')
ylabel('Amplitude (V)')

Y=fft(sby);
P2 = abs(Y/L);
P1 = P2(2:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
subplot(3,2,4);
bar(f,P1)
title('Spektrum Getaran Sumbu Y')
xlabel('f (Hz)')
ylabel('Amplitude (V)')

Y=fft(sbz);
P2 = abs(Y/L);
P1 = P2(2:L/2+1);
P1(2:end-1) = 2*P1(2:end-1);
subplot(3,2,6);
bar(f,P1)
title('Spektrum Getaran Sumbu Z')
xlabel('f (Hz)')
ylabel('Amplitude (V)')

%}
%{
s1=52000;       % Start time
s2=52400;       % End time
% Version 2
%}