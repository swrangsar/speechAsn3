close all; clear all;

addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/
addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q2ab/
addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q3/

[y1, fs1] = resynthesizeVoicedPhoneUsingLP('a_pani.wav');
[y2, fs2] = resynthesizeVoicedPhoneUsingLP('n_pani.wav');
[y3, fs3] = resynthesizeVoicedPhoneUsingLP('i_pani.wav');
[y4, fs4] = resynthesizeUnvoicedPhoneUsingLP('s_uska.wav');


%% viewing the sound

samplingPeriod = 1/fs1; % since all of them are the same using just one
w1 = (0:length(y1) - 1) * samplingPeriod;
w2 = (0:length(y2) - 1) * samplingPeriod;
w3 = (0:length(y3) - 1) * samplingPeriod;
w4 = (0:length(y4) - 1) * samplingPeriod;

figure(100); stem(w1, y1); axis tight;
title('LPC synthesized vowel /a/');
xlabel('Time in seconds');

figure(200); stem(w2, y2); axis tight;
title('LPC synthesized vowel /n/');
xlabel('Time in seconds');


figure(300); stem(w3, y3); axis tight;
title('LPC synthesized vowel /i/');
xlabel('Time in seconds');

figure(400); stem(w4, y4); axis tight;
title('LPC synthesized phone /s/');
xlabel('Time in seconds');


%% writing the sound

N = 32; % N-bit sound

wavwrite(y1, fs1, N, 'a_pani_synth.wav');
wavwrite(y2, fs2, N, 'n_pani_synth.wav');
wavwrite(y3, fs3, N, 'i_pani_synth.wav');
wavwrite(y4, fs4, N, 's_uska_synth.wav');


%% playing the sound

bits = 16;

% sound(y1, fs1, bits);
% sound(y2, fs2, bits);
% sound(y3, fs3, bits);
% sound(y4, fs4, bits);


rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q3/
rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q2ab/
rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/