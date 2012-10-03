close all; clear all;
poleOrder = [6 8 10 12 16];
siz = size(poleOrder(:));
length = siz(1);

for k = 1:length;
    getHammingNarrowbandSpectrum('a_pani.wav', poleOrder(k));
end

for k = 1:length;
    getHammingNarrowbandSpectrum('n_pani.wav', poleOrder(k));
end

for k = 1:length;
    getHammingNarrowbandSpectrum('i_pani.wav', poleOrder(k));
end

for k = 1:length;
    getHammingNarrowbandSpectrum('s_uska.wav', poleOrder(k));
end

