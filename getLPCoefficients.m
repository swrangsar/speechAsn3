function getLPCoefficients(inputFile, poleOrder)


autocorrCoeffs = getAutoCorrCoefficients(inputFile, poleOrder);
LPCoeffs = levinsonDurbin(autocorrCoeffs, poleOrder);
figure, stem(LPCoeffs);
title(['LP coefficients of ''', inputFile, ''' for p = ''', num2str(poleOrder), ''''], 'interpreter', 'none');

end