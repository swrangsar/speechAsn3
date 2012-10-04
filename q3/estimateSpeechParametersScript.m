close all; clear all;
addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q2ab/
addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/

[pitch1, gain1, LPCCoeffs1] = estimateSpeechParameters('a_pani.wav');
[pitch2, gain2, LPCCoeffs2] = estimateSpeechParameters('n_pani.wav');
[pitch3, gain3, LPCCoeffs3] = estimateSpeechParameters('i_pani.wav');
[pitch4, gain4, LPCCoeffs4] = estimateSpeechParameters('s_uska.wav')


rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/
rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q2ab/