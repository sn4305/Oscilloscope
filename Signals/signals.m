%% OSCILLOSCOPE TEST SIGNALS

                                        
%% FM Synteesi

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

fc = 100; % Carrier freq
fm = 300; % Modulation freq
l = 1; % modulation amount

y = 3*sin(2*pi*fc*t + l*sin(2*pi*fm*t));

audiowrite('taajuusmodulaatio_100Hz.wav', y./(1.01*max(y)), Fs);

fm = roundn(y',-6); % pyorista
dlmwrite('taajuusmodulaatio_100Hz_3V.csv',fm); % kirjoitetaan tiedostoon
    
%% Plot
figure();
plot(t,y);
xlabel('Aika (s)');
axis([0 0.02 -1.1 1.1]);
grid on;

%% FFT

N = max(size(y));
Xf = 2*abs(fft(y)); % FFT
Xf = 20*log10(Xf./(max(Xf))); 
f0 = Fs/N; tf = 0:f0:(N-1)*f0;

figure(); semilogx(tf, Xf); grid on; axis([50 4000 -80 3]); % Spektri
ylabel('Magnitudi (dB)'); xlabel('Taajuus (Hz)');
set(gca,'XTick',[50 100 200 400 800 1600])
set(gca,'XTickLabel',{50 100 200 400 800 '1,6k'})

figure(); semilogx(tf, Xf); grid on; axis([20 20000 -100 3]); % Spektri
ylabel('Magnitudi (dB)'); xlabel('Taajuus (Hz)');
set(gca,'XTick',[20 100 200 400 800 2000 4000 8000 16000])
set(gca,'XTickLabel',{20 100 200 400 800 '2k' '4k' '8k' '16k'})

%% FM Synteesi muuttuva mod

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

fc = 100; % Carrier freq
fm = logspace(0.1,3, max(size(t)));
l = 1; % modulation amount

y = 3*sin(2*pi*fc*t + l*sin(2*pi.*fm.*t));

fm = roundn(y',-6);
dlmwrite('taajuusmodulaatio_100Hz_3V_muuttuva.csv',fm);

audiowrite('taajuusmodulaatio_100Hz_muuttuva.wav', y./(1.01*max(y)), Fs);

%% Trigger 1 Hz

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;
f = 1;

y = square(2*pi*f*t); % kanttiaalto -1...1

audiowrite('trigger_1Hz.wav', y./(1.01*max(y)), Fs);

trigger = roundn(y',-6);
dlmwrite('trigger_1Hz.csv',trigger);

%% Trigger 2 Hz

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

f = 2; 
y = square(2*pi*f*t);

audiowrite('trigger_2Hz.wav', y./(1.01*max(y)), Fs);
    
trigger2 = roundn(y',-6);
dlmwrite('trigger_2Hz.csv',trigger2);

%% Trigger 5 Hz 

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;
f = 5; 

y = square(2*pi*f.*t);

audiowrite('trigger_5Hz.wav', y./(1.01*max(y)), Fs);

trigger5 = roundn(y',-6);
dlmwrite('trigger_5Hz.csv',trigger5);

%% Trigger 10 Hz 

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;
f = 10; 

y = square(2*pi*f.*t);

audiowrite('trigger_10Hz.wav', y./(1.01*max(y)), Fs);

trigger10 = roundn(y',-6);
dlmwrite('trigger_10Hz.csv',trigger10);

%% Trigger 50 Hz 

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;
f = 50; 

y = square(2*pi*f*t);

audiowrite('trigger_50Hz.wav', y./(1.01*max(y)), Fs);

trigger50 = roundn(y',-6);
dlmwrite('trigger_50Hz.csv',trigger50);

%% Trigger 100 Hz 

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;
f = 100; 

y = square(2*pi*f*t);

audiowrite('trigger_100Hz.wav', y./(1.01*max(y)), Fs);

trigger100 = roundn(y',-6);
dlmwrite('trigger100Hz.csv',trigger100);

%% random

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = abs(0.0313*sawtooth(2*pi*50*t,0.5) ...
    + 0.015*(sin(2*pi*33*t)+1).*randn(size(t)));

audiowrite('random.wav', y./(1.01*max(y)), Fs);
    
random = roundn(y',-6);
dlmwrite('random.csv',random);

%% Lissajous 0,2 Hz

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

a = 3;
b = 4;
phi = pi/2;

x = 4*sin(0.4*pi*a.*t + phi);
y = 4*sin(0.4*pi*b.*t);

lissajousX = roundn(x',-6);
dlmwrite('lissajous_34_X.csv',lissajousX);

lissajousY = roundn(y',-6);
dlmwrite('lissajous_34_Y.csv',lissajousY);

%% Lissajous 50 Hz

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

a = 3;
b = 4;
phi = pi/2;

x = 4*sin(50*2*pi*a.*t + phi);
y = 4*sin(50*2*pi*b.*t);

lissajousX = roundn(x',-6);
dlmwrite('lissajous_34_X_50Hz.csv',lissajousX);

lissajousY = roundn(y',-6);
dlmwrite('lissajous_34_Y_50Hz.csv',lissajousY);

%% Lissajous 2 5 Hz

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

a = 1;
b = 2;
phi = pi/2;

x = 2*sin(10*pi*a.*t + phi);
y = 2*sin(10*pi*b.*t);

lissajous2X = roundn(x',-6);
dlmwrite('lissajous_12_X_5Hz.csv',lissajous2X);

lissajous2Y = roundn(y',-6);
dlmwrite('lissajous_12_Y_5Hz.csv',lissajous2Y);

%% Lissajous dyn freq

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

f = logspace(-1.3,1.3,max(size(t))); % f = 10^-1.3 ... 10^1.3

a = 3;
b = 4;
phi = pi/2;

x = 4*sin(2*pi.*f*a.*t + phi);
y = 4*sin(2*pi.*f*b.*t);

lissajousX = roundn(x',-6);
dlmwrite('lissajous_34_X_muuttuva.csv',lissajousX);

lissajousY = roundn(y',-6);
dlmwrite('lissajous_34_Y_muuttuva.csv',lissajousY);

%% Sini 50 Hz + Kohina

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = 0.2*(sin(2*pi*50.*t) + randn(size(t))/10);

sin50Hz_noise = roundn(y',-6);
dlmwrite('sin_50Hz_noise_200mV.csv',sin50Hz_noise);

%% Sini 10 Hz kohina

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = 4*(sin(2*pi*100.*t) + randn(size(t))/5);

sin10Hz_noise = roundn(y',-6);
dlmwrite('sin_100Hz_noise_4V.csv',sin10Hz_noise);

%% Sini 100 Hz 2V

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = 2*sin(2*pi*100*t);  

sin100 = roundn(y',-6);
dlmwrite('sin_100Hz_2V.csv',sin100);

audiowrite('sin_100Hz.wav', y./(1.01*max(y)), Fs);


%% Sini 100 Hz offset

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = sin(2*pi*100*t) + 2;  

sin100 = roundn(y',-6);
dlmwrite('sin_100Hz_offset.csv',sin100);

%% Sini 100 Hz neg offset

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = 0.5*sin(2*pi*100*t) - 3;  

sin100 = roundn(y',-6);
dlmwrite('sin_100Hz_offset_neg.csv',sin100);

%% Sini 0.5 sec!

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:0.5-Ts;

y = 0.99*sin(2*pi*100*t);  

sin100 = roundn(y',-6);
dlmwrite('sin_liianlyhyt.csv',sin100);

audiowrite('sin_liianlyhyt.wav', y, Fs);

%% Sini stereo

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = zeros(max(size(t)), 2);

y(:,1) = 0.99*sin(2*pi*100*t);
y(:,2) = 0.99*sin(2*pi*100*t);  

audiowrite('sin_stereo.wav', y, Fs);

%% Sini 24 bit wav

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = 0.99*sin(2*pi*100*t);

audiowrite('sin_24bit.wav', y, Fs,'BitsPerSample', 24);

%% Sini 100 Hz 2V särö 10% THD

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;
f = 100;

y = 2*sin(2*pi*f*t) + 0.2*sin(2*pi*3*f*t) ...
    + 0.05*sin(2*pi*5*f*t) + 0.01*sin(2*pi*7*f*t);  

audiowrite('sin_100Hz_2V_särö_THD10.wav', y./(1.01*max(y)), Fs);

thd(y, Fs)

figure();
plot(t,y,t,2*sin(2*pi*100*t));
xlabel('Aika (s)');
axis([0 0.02 -3.1 3.1]);
grid on;

N = max(size(y));
Xf = 2*abs(fft(y)); % FFT
Xf = 20*log10(Xf./(max(Xf))); 
f0 = Fs/N; tf = 0:f0:(N-1)*f0;

figure(); semilogx(tf, Xf); grid on; axis([80 7400 -80 3]); % Spektri
ylabel('Magnitudi (dB)'); xlabel('Taajuus (Hz)');
set(gca,'XTick',[ 100 200 400 800 1600 3200])
set(gca,'XTickLabel',{ 100 200 400 800 '1,6k' '3,2k'})

sin100 = roundn(y',-6);
dlmwrite('sin_100Hz_2V_särö.csv',sin100);

%% Sini 100 Hz 2V saturoitu

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = 2.2*audioread('sin_100HZ_saturaatio.wav');

thd(y, Fs, 10)

figure();
plot(t,y,t,2*sin(2*pi*100*t));
xlabel('Aika (s)');
axis([0 0.02 -3.1 3.1]);
grid on;

N = max(size(y));
Xf = 2*abs(fft(y)); % FFT
Xf = 20*log10(Xf./(max(Xf))); 
f0 = Fs/N; tf = 0:f0:(N-1)*f0;

figure(); semilogx(tf, Xf); grid on; axis([80 7400 -90 3]); % Spektri
ylabel('Magnitudi (dB)'); xlabel('Taajuus (Hz)');
set(gca,'XTick',[ 100 200 400 800 1600 3200])
set(gca,'XTickLabel',{ 100 200 400 800 '1,6k' '3,2k'})

sin100 = roundn(y,-6);
dlmwrite('sin_100Hz_2V_saturaatio.csv',sin100);

%% Kosini 100 Hz

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = 2*cos(2*pi*100*t);
    
cos100 = roundn(y',-6);
dlmwrite('cos_100Hz_2V.csv',cos100);

audiowrite('cos_100Hz.wav', y./(1.01*max(y)), Fs);

%% Kosini 100 Hz vaiheliike

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

vaihe = pi * (sawtooth(2*pi*1/10*t, 0.5)+1)./2; % 0...pi...0

y = 2*cos(2*pi*100*t - vaihe);
    
phaseshift = roundn(y',-6);
dlmwrite('cos_vaiheliike.csv',phaseshift);

audiowrite('cos_vaiheliike.wav', y./max(y), Fs);

%% Sin muuttuva amplitudi

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

a = 0.1 + 4*(sawtooth(2*pi*1/10*t, 0.5)+1)./2; % 0.1 - 4.1 V

f = 100;

y = a.*sin(2*pi*f.*t);

out = roundn(y',-6);
dlmwrite('sin_100Hz_amplitudimuutos.csv',out);

%% Sini muuttuva taajuus

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

f = linspace(20,200, max(size(t))); % f: 20 -> 200 Hz

y = 2*sin(2*pi.*f.*t);  

out = roundn(y',-6);
dlmwrite('sin_muuttuva_taajuus.csv',out);

%% Sini muuttuva 

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

f = 50;

k = 4*sin(2*pi*1/10.*t); % 0...4V...-4V...0

y = k.*sin(2*pi.*f.*t);  

out = roundn(y',-6);
dlmwrite('sin_50Hz_amplitudimuutos.csv',out);

%% Muuttuva sini

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

a = 1-0.5*(sawtooth(2*pi*1/10*t, 0.5)+1)./2 ; % 1...0,5...1
f = logspace(2,3,max(size(t))); % 100...1000 Hz

y = 4*a.*(sin(2*pi.*f.*t));

audiowrite('sin_muuttuva_amplitudi_ja_taajuus.wav', y./(1.01*max(y)), Fs);

sinmuutos = roundn(y',-6);
dlmwrite('sin_muuttuva_amplitudi_ja_taajuus.csv',sinmuutos);

%% Chirp

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:10-Ts;

y = chirp(t,50,10,3200,'lo');

audiowrite('sin_logsweep_50Hz_3200Hz.wav', y./max(y), Fs);

chirppi = roundn(y',-6);
dlmwrite('sin_logsweep_50Hz_3200Hz.csv',chirppi);

%% Chirp 2

Fs = 48000;
Ts = 1/Fs;
t = 0:Ts:5-Ts;

y = chirp(t,50,5,1600,'lo');

y2 = chirp(t,1600,5,50,'lo');

yy = horzcat(y,y2);

audiowrite('sin_logsweep_50Hz_1600Hz_50Hz.wav', yy./max(yy), Fs);

chirppi = roundn(yy',-6);
dlmwrite('sin_logsweep_50Hz_1600Hz_50Hz.csv',chirppi);