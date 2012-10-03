function [narrowbandSpectrum, LPCSpectrum, w ]= getHammingNarrowbandSpectrum(inputFile, poleOrder)

% poleOrder = 6;
% inputFile = 'a_pani.wav';

windowDuration = 0.030; % in ms

[y, fs] = preEmphasize(inputFile);

siz = size(y(:));
length = siz(1);
centralIndex = round(length/2);
M = round(windowDuration * fs);
startIndex = round(centralIndex - M/2);

windowedSignal = y(startIndex:startIndex + M-1);

narrowbandSpectrum = abs(fft(windowedSignal));
narrowbandSpectrum = narrowbandSpectrum(1:round(M/2));
narrowbandSpectrum = 10 * log10(abs(narrowbandSpectrum));

% getting the LPC spectrum

LPCoeffs = getLPCoefficients(inputFile, poleOrder);
frequencies = (fs/M) * (0:M-1);

denominator = 1;
numerator = 1;

for k = 1:poleOrder
    denominator = denominator - (LPCoeffs(k) * (exp(-1i * 2 * pi * frequencies ./ fs) .^ k));
end

H = numerator ./ denominator;
LPCSpectrum = 10 * log10(abs(H));
LPCSpectrum = LPCSpectrum(1:round(M/2));
w = frequencies(1:round(M/2));

figure, plot(w, narrowbandSpectrum);
hold on;
linePlot = plot(w, LPCSpectrum);
set(linePlot,'Color','green');
hold off;
title({'LPC spectrum (green) superimposed on narrowband speech'; ...
    ['spectrum (blue) of ''', inputFile, ''' for p = ''', ...
    num2str(poleOrder), '''']}, 'interpreter', 'none');
xlabel('Frequency in Hz');
ylabel('Magnitude in dB');

end