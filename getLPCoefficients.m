function LPCoeffs = getLPCoefficients(inputFile, poleOrder)


autocorrCoeffs = getAutoCorrCoefficients(inputFile, poleOrder);
LPCoeffs = levinsonDurbin(autocorrCoeffs);
end