function printNarrowbandSpectrum(fileInput)

[y, fs] = wavread(fileInput);

colormap('gray');
map = colormap;
imap = flipud(map);
M = round(0.030*fs);  % 30 ms window
N = 2^nextpow2(4*M); % with zero padding 
w = 0.54 - 0.46 * cos(2*pi*[0:M-1]/(M-1)); % w = hamming(M);
[~,F,T,P] = spectrogram(y, w, (M*(15/16)), N, fs);

surf(T,F,10*log10(P),'edgecolor','none');
title(['Narrowband spectrum for ''', fileInput, ''''], 'interpreter', 'none');
axis tight;
colormap(imap);
view(0,90);
xlabel('Time (Seconds)'); ylabel('Hz');

end