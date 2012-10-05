close all; clear all;

addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/
addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q2ab/
addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q3/

[y1, fs1] = resynthesizeVoicedPhoneUsingLP('a_pani.wav');
[y2, fs2] = resynthesizeVoicedPhoneUsingLP('n_pani.wav');
[y3, fs3] = resynthesizeVoicedPhoneUsingLP('i_pani.wav');

%% viewing the sound

figure; stem(y1); axis tight;
figure; stem(y2); axis tight;
figure; stem(y3); axis tight;

%% writing the sound

N = 16; % N-bit sound

wavwrite(y1, fs1, N, 'a_pani_synth.wav');
wavwrite(y2, fs2, N, 'n_pani_synth.wav');
wavwrite(y3, fs3, N, 'i_pani_synth.wav');

%% playing the sound

bits = 16;

% sound(y1, fs1, bits);
% sound(y2, fs2, bits);
% sound(y3, fs3, bits);

rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q3/
rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q2ab/
rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/