close all; clear all;
addpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/

poleOrders = [6 8 10 12 16];

plotResidualEnergyVersusP('a_pani.wav', poleOrders);
plotResidualEnergyVersusP('n_pani.wav', poleOrders);
plotResidualEnergyVersusP('i_pani.wav', poleOrders);
plotResidualEnergyVersusP('s_uska.wav', poleOrders);


rmpath /Users/swrangsarbasumatary/Desktop/speechProcessingProject/