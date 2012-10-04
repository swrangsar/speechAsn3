function [pitch, LPCCoeffs, gain] = estimateSpeechParameters(inputFile)

poleOrder = 10;
[residualSignal, fs] = getResidualSignal(inputFile, poleOrder);
magnitudeSpectrum = abs(fft(residualSignal));

% figure; plot(magnitudeSpectrum); axis tight;

pitch = getPitch(inputFile, fs)
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

%% get pitch of the windowed signal using harmonic product spectrum

function pitch = getPitch(inputFile, fs)

windowedSignal = getWindowedSignal(inputFile);
magnitudeSpectrum = abs(fft(windowedSignal, length(windowedSignal)));
frequencyFactor = fs ./ length(magnitudeSpectrum);
magnitudeSpectrum = magnitudeSpectrum(1:round(length(magnitudeSpectrum)/2));
spectralPeaks = magnitudeSpectrum;

for k = 2:length(magnitudeSpectrum)-1
    spectralPeaks = spectralPeaks + getDownsampledSignal(magnitudeSpectrum, k);
end

spectralPeaks(1) = 0;

maxIndex = find(spectralPeaks == max(spectralPeaks));
maxIndex = maxIndex(1);

figure, stem(spectralPeaks);

pitch = (maxIndex-1) * frequencyFactor;

end