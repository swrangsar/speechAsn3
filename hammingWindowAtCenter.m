function autocorrelationCoefficients = hammingWindowAtCenter(inputFile, poleOrder)
% poleOrder = 6 ;
% inputFile = 'a_pani.wav';
windowDuration = 0.030; % in ms

[y, fs] = preEmphasize(inputFile);

siz = size(y);
length = siz(1);
centralIndex = round(length/2);
M = round(windowDuration * fs);
startIndex = round(centralIndex - M/2);

windowedSignal = y(startIndex:startIndex + M-1);
ACCoeff = zeros(poleOrder+1, 1);

for p = 0:poleOrder
    for k = 0:M-1
        valueToBeAdded = 0;
        if k-p >= 0
            valueToBeAdded = windowedSignal(k+1) .* windowedSignal(k+1-p);
        end
        ACCoeff(p+1) = ACCoeff(p+1) + valueToBeAdded;
    end
end

autocorrelationCoefficients = ACCoeff;
figure(100), stem(ACCoeff);

end