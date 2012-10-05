function [sampledSignal, samplingFrequency] = resynthesizeUnvoicedPhoneUsingLP(inputFile)

duration = 0.300; % in seconds
samplingFrequency = 8000; % in hertz

[~, gain, LPCCoeffs] = estimateSpeechParameters(inputFile);
timePeriod = 1/samplingFrequency;
signalLength = round(duration/timePeriod);


whiteNoise = wgn(signalLength, 1, 0);

filteredSignal = getFilteredSignal(whiteNoise, gain, LPCCoeffs);
sampledSignal = filteredSignal;
end


%% get LPC filtered signal of input

function filteredSignal = getFilteredSignal(signal, gain, LPCCoeffs)

filteredSignal = zeros(size(signal));

for k = 1:length(filteredSignal)
    filteredSignal(k) = gain * signal(k);
    for m = 1:length(LPCCoeffs)
        if (k - m) < 1
            break;
        else
            filteredSignal(k) = filteredSignal(k) + (LPCCoeffs(m) * filteredSignal(k - m));
        end
    end
end

end