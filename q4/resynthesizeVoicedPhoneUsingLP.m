function [sampledSignal, samplingFrequency] = resynthesizeVoicedPhoneUsingLP(inputFile)

duration = 0.300; % in seconds
samplingFrequency = 8000; % in hertz

[pitch, gain, LPCCoeffs] = estimateSpeechParameters(inputFile);
timePeriod = 1/pitch;
signalLength = round(duration/timePeriod);


impulseTrain = getImpulseTrainOfLength(signalLength);
filteredSignal = getFilteredSignal(impulseTrain, gain, LPCCoeffs);
sampledSignal = getSampledSignal(filteredSignal, samplingFrequency, timePeriod, duration);

end


%% get impulse train of specified length

function impulseTrain = getImpulseTrainOfLength(signalLength)

impulseTrain = ones(signalLength, 1);

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

%% get sampled version of the filtered signal

function sampledSignal = getSampledSignal(filteredSignal, samplingFrequency, timePeriod, duration)

samplingPeriod = 1/samplingFrequency;
sampledSignalLength = duration/samplingPeriod;

sampledSignal = zeros(sampledSignalLength, 1);

for k = 1:length(filteredSignal)
    m = round((k * timePeriod)/samplingPeriod);
    if m > length(sampledSignal)
        break;
    end
    sampledSignal(m) = filteredSignal(k);
end

end
    
