close all; clear all;
addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q2ab/
addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/

estimateSpeechParameters('a_pani.wav');
estimateSpeechParameters('n_pani.wav');
estimateSpeechParameters('i_pani.wav');
estimateSpeechParameters('s_uska.wav');


rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/
rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/q2ab/