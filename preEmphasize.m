function [signal, fs] = preEmphasize(inputFile)

[y, fs] = wavread(inputFile);
siz = size(y);
length = siz(1);

for k = 1:length
    if k > 1
        y(k) = y(k) - (0.97*y(k-1));
    end
end

signal = y;
end