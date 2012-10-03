close all; clear all;

inputFile = 'a_pani.wav';
poleOrder = 10;

LPCoeffs = -getLPCoefficients(inputFile, poleOrder);

LPCoeffsFull = (cat(1, [1], LPCoeffs(:)))'