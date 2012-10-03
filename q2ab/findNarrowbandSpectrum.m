close all; clear all;


figure(100); clf;
printNarrowbandSpectrum('a_pani.wav');
[y, fs] = preEmphasize('a_pani.wav');
wavwrite(y, fs, 32, 'a_pani_pre_emphasized.wav');
figure(200); clf;
printNarrowbandSpectrum('a_pani_pre_emphasized.wav');

figure(300); clf;
printNarrowbandSpectrum('n_pani.wav');
[y, fs] = preEmphasize('n_pani.wav');
wavwrite(y, fs, 32, 'n_pani_pre_emphasized.wav');
figure(400); clf;
printNarrowbandSpectrum('n_pani_pre_emphasized.wav');

figure(500); clf;
printNarrowbandSpectrum('i_pani.wav');
[y, fs] = preEmphasize('i_pani.wav');
wavwrite(y, fs, 32, 'i_pani_pre_emphasized.wav');
figure(600); clf;
printNarrowbandSpectrum('i_pani_pre_emphasized.wav');

figure(700); clf;
printNarrowbandSpectrum('s_uska.wav');
[y, fs] = preEmphasize('s_uska.wav');
wavwrite(y, fs, 32, 's_uska_pre_emphasized.wav');
figure(800); clf;
printNarrowbandSpectrum('s_uska_pre_emphasized.wav');