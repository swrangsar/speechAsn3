close all; clear all;
%% for /a/ in 'pani'

inputFile = 'a_pani.wav';
poleOrder1 = 6;
poleOrder2 = 10;
num = (1);

LPCoeffs1 = -getLPCoefficients(inputFile, poleOrder1);
LPCoeffsFull1 = (cat(1, (1), LPCoeffs1(:)))'
LPCoeffs2 = -getLPCoefficients(inputFile, poleOrder2);
LPCoeffsFull2 = (cat(1, (1), LPCoeffs2(:)))';

figure(100); clf;
subplot(2, 1, 1), zplane(num, LPCoeffsFull1);
title(['Pole-zero plot for all pole filter of order = ''', num2str(poleOrder1), ''' in ''', inputFile, ''''], 'interpreter', 'none');
subplot(2, 1, 2), zplane(num, LPCoeffsFull2);
title(['Pole-zero plot for all pole filter of order = ''', num2str(poleOrder2), ''' in ''', inputFile, ''''], 'interpreter', 'none');


%% for /n/ in 'pani'

inputFile = 'n_pani.wav';
poleOrder1 = 6;
poleOrder2 = 10;
num = (1);

LPCoeffs1 = -getLPCoefficients(inputFile, poleOrder1);
LPCoeffsFull1 = (cat(1, (1), LPCoeffs1(:)))'
LPCoeffs2 = -getLPCoefficients(inputFile, poleOrder2);
LPCoeffsFull2 = (cat(1, (1), LPCoeffs2(:)))';

figure(200); clf;
subplot(2, 1, 1), zplane(num, LPCoeffsFull1);
title(['Pole-zero plot for all pole filter of order = ''', num2str(poleOrder1), ''' in ''', inputFile, ''''], 'interpreter', 'none');
subplot(2, 1, 2), zplane(num, LPCoeffsFull2);
title(['Pole-zero plot for all pole filter of order = ''', num2str(poleOrder2), ''' in ''', inputFile, ''''], 'interpreter', 'none');

%% for /I/ in 'pani'

inputFile = 'i_pani.wav';
poleOrder1 = 6;
poleOrder2 = 10;
num = (1);

LPCoeffs1 = -getLPCoefficients(inputFile, poleOrder1);
LPCoeffsFull1 = (cat(1, (1), LPCoeffs1(:)))'
LPCoeffs2 = -getLPCoefficients(inputFile, poleOrder2);
LPCoeffsFull2 = (cat(1, (1), LPCoeffs2(:)))';

figure(300); clf;
subplot(2, 1, 1), zplane(num, LPCoeffsFull1);
title(['Pole-zero plot for all pole filter of order = ''', num2str(poleOrder1), ''' in ''', inputFile, ''''], 'interpreter', 'none');
subplot(2, 1, 2), zplane(num, LPCoeffsFull2);
title(['Pole-zero plot for all pole filter of order = ''', num2str(poleOrder2), ''' in ''', inputFile, ''''], 'interpreter', 'none');

%% for /s/ in 'uska'

inputFile = 's_uska.wav';
poleOrder1 = 6;
poleOrder2 = 10;
num = (1);

LPCoeffs1 = -getLPCoefficients(inputFile, poleOrder1);
LPCoeffsFull1 = (cat(1, (1), LPCoeffs1(:)))'
LPCoeffs2 = -getLPCoefficients(inputFile, poleOrder2);
LPCoeffsFull2 = (cat(1, (1), LPCoeffs2(:)))';

figure(400); clf;
subplot(2, 1, 1), zplane(num, LPCoeffsFull1);
title(['Pole-zero plot for all pole filter of order = ''', num2str(poleOrder1), ''' in ''', inputFile, ''''], 'interpreter', 'none');
subplot(2, 1, 2), zplane(num, LPCoeffsFull2);
title(['Pole-zero plot for all pole filter of order = ''', num2str(poleOrder2), ''' in ''', inputFile, ''''], 'interpreter', 'none');
