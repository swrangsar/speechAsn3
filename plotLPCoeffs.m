close all; clear all;

getLPCoefficients('a_pani', 6);
getLPCoefficients('a_pani', 8);
getLPCoefficients('a_pani', 10);
getLPCoefficients('a_pani', 12);
getLPCoefficients('a_pani', 16);

getLPCoefficients('n_pani', 6);
getLPCoefficients('n_pani', 8);
getLPCoefficients('n_pani', 10);
getLPCoefficients('n_pani', 12);
getLPCoefficients('n_pani', 16);

getLPCoefficients('i_pani', 6);
getLPCoefficients('i_pani', 8);
getLPCoefficients('i_pani', 10);
getLPCoefficients('i_pani', 12);
getLPCoefficients('i_pani', 16);

getLPCoefficients('s_uska', 6);
getLPCoefficients('s_uska', 8);
getLPCoefficients('s_uska', 10);
getLPCoefficients('s_uska', 12);
getLPCoefficients('s_uska', 16);

figure, stem(ACCoeff);
title(['Autocorrelation coefficients of ''', inputFile, ''' for p = ''', num2str(poleOrder), ''''], 'interpreter', 'none');

figure, stem(LPCoeffs);
title(['LP coefficients of ''', inputFile, ''' for p = ''', num2str(poleOrder), ''''], 'interpreter', 'none');
