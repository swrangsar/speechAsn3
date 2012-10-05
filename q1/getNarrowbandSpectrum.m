function getNarrowbandSpectrum(inputFile)

[windowedSignal, fs] = getWindowedSignal(inputFile);
N = 2 ^ nextpow2(length(windowedSignal) * 4);

magnitudeSpectrum = 10* log10(abs(fft(windowedSignal, N)));
frequencyFactor = fs/length(magnitudeSpectrum);
magnitudeSpectrum = magnitudeSpectrum(1:round(length(magnitudeSpectrum)/2));
w = (0:length(magnitudeSpectrum)-1) * frequencyFactor;

figure; plot(w, magnitudeSpectrum); axis tight;
title(['Short-term narrowband spectrum of ''', inputFile, ''''], ...
    'interpreter', 'none');
xlabel('Frequency in ''Hz''');
ylabel('Magnitude in ''dB''');

end


%% get hamming windowed central part of a signal

function [windowedSignal, fs] = getWindowedSignal(inputFile)

% inputFile = 'a_pani.wav';
windowDuration = 0.030; % in ms
%[y, fs] = preEmphasize(inputFile);
[y, fs] = wavread(inputFile);
siz = size(y);
length = siz(1);
centralIndex = round(length/2);
M = round(windowDuration * fs);
startIndex = round(centralIndex - M/2);
windowedSignal = y(startIndex:startIndex + M-1);
end