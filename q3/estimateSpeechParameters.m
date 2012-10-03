function estimateSpeechParameters(inputFile)

poleOrder = 10;
residualSignal = getResidualSignal(inputFile, poleOrder);
figure; plot(residualSignal); axis tight;

end
    



%% get residual signal of full signal

function residualSignal = getResidualSignal(inputFile, poleOrder)

LPCoeffs = getLPCoefficients(inputFile, poleOrder);
fullSignal = wavread(inputFile);
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