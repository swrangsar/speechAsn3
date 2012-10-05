function [pitch, gain, LPCCoeffs] = estimateSpeechParameters(inputFile)

poleOrder = 10;
[residualSignal, fs] = getResidualSignal(inputFile, poleOrder);

N = 2 ^ nextpow2(length(residualSignal) * 4);
magnitudeSpectrum = abs(fft(residualSignal, N));
w = 0:length(magnitudeSpectrum)-1;
w = w .* 2 * pi * (1/length(magnitudeSpectrum));

% figure; plot(w, magnitudeSpectrum); axis tight;
% title(['Magnitude spectrum of residual signal for ''', inputFile, ...
%     ''''], 'interpreter', 'none');
% xlabel('''w'' in radians');

pitch = getPitch(inputFile, fs);
LPCCoeffs = getLPCCoefficients(inputFile, poleOrder);
gain = getGain(inputFile, poleOrder);

end


%% get residual signal of full signal

function [residualSignal, fs] = getResidualSignal(inputFile, poleOrder)

LPCoeffs = getLPCoefficients(inputFile, poleOrder);
[fullSignal, fs] = getFullSignal(inputFile);
siz = size(fullSignal(:));
M = siz(1);
errorSignal = zeros(M, 1);

for k = 1:M
    errorSignal(k) = fullSignal(k);
    for j = 1:poleOrder
        if k > j
            errorSignal(k) = errorSignal(k) - LPCoeffs(j) * fullSignal(k-j);
        else
            break;
        end
    end
end
residualSignal = errorSignal;

end

%% get hamming windowed central part of a signal

function [fullSignal, fs] = getFullSignal(inputFile)

[y, fs] = preEmphasize(inputFile);
fullSignal = y;

end

%% get autocorrelation coefficients of full signal

function autocorrelationCoefficients = getAutoCorrelationCoefficients(inputFile, poleOrder)

fullSignal = getFullSignal(inputFile);
M = length(fullSignal);
ACCoeff = zeros(poleOrder+1, 1);

for p = 0:poleOrder
    for k = 0:M-1
        valueToBeAdded = 0;
        if k-p >= 0
            valueToBeAdded = fullSignal(k+1) .* fullSignal(k+1-p);
        end
        ACCoeff(p+1) = ACCoeff(p+1) + valueToBeAdded;
    end
end

autocorrelationCoefficients = ACCoeff;

end

%% get LPC coefficients of full signal

function LPCCoeffs = getLPCCoefficients(inputFile, poleOrder)

autocorrCoeffs = getAutoCorrelationCoefficients(inputFile, poleOrder);
LPCCoeffs = levinsonDurbin(autocorrCoeffs);

end

%% get gain of the full signal

function gain = getGain(inputFile, poleOrder)

ACCoeffs = getAutoCorrelationCoefficients(inputFile, poleOrder);
LPCCoeffs = getLPCCoefficients(inputFile, poleOrder);

predictionError = ACCoeffs(1);
for k = 1:poleOrder
    predictionError = predictionError - (LPCCoeffs(k) * ACCoeffs(k+1));
end
gain = sqrt(predictionError);

end

%% get hamming windowed central part of a signal

function windowedSignal = getWindowedSignal(inputFile)

% inputFile = 'a_pani.wav';
windowDuration = 0.030; % in ms
[y, fs] = preEmphasize(inputFile);
siz = size(y);
length = siz(1);
centralIndex = round(length/2);
M = round(windowDuration * fs);
startIndex = round(centralIndex - M/2);
windowedSignal = y(startIndex:startIndex + M-1);
end

%% get the downsampled signal

function downsampledSignal = getDownsampledSignal(signal, factor)

downsampledSignal = zeros(size(signal));
l = 1;
k = 1;
while k < (length(signal) + 1)
    downsampledSignal(l) = signal(k);
    l = l + 1; k = k + factor;
end

end

%% highlight the peaks of the signal retaining their algebraic sign 
function highlightedSignal = highlightSignal(signal)

highlightedSignal = signal .^ 3;

end

%% get pitch of the windowed signal using harmonic product spectrum

function pitch = getPitch(inputFile, fs)
% We calculate the pitch by downsampling the narrowband spectrum by integer
% values and add them to the original spectrum. At F0, they give a peak
% because the peaks of other harmonics add up at F0. We take the second
% peak of the final spectrum because there could be other peaks in the
% spectrum including one at f = 0 Hz. This way of getting the pitch is not
% perfect because the pitch values change with the N-point of FFT
% considered.


windowedSignal = getWindowedSignal(inputFile);
windowedSignal = highlightSignal(windowedSignal);

N = 2 ^ (nextpow2(length(windowedSignal) * 4));
magnitudeSpectrum = abs(fft(windowedSignal, N));
frequencyFactor = fs ./ length(magnitudeSpectrum);
magnitudeSpectrum = magnitudeSpectrum(1:round(length(magnitudeSpectrum)/2));
spectralPeaks = magnitudeSpectrum;

for k = 2:length(magnitudeSpectrum)
    spectralPeaks = spectralPeaks + getDownsampledSignal(magnitudeSpectrum, k);
end

% spectralPeaks(1) = 0;
peaks = findpeaks(spectralPeaks);
maxIndex = find(spectralPeaks == peaks(2));
maxIndex = maxIndex(1);

% figure, stem(spectralPeaks); axis tight;

pitch = (maxIndex-1) * frequencyFactor;

end