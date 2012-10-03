close all; clear all;

autocorrCoeffs1 = getAutoCorrCoefficients('a_pani', 6);
autocorrCoeffs2 = getAutoCorrCoefficients('a_pani', 8);
autocorrCoeffs3 = getAutoCorrCoefficients('a_pani', 10);
autocorrCoeffs4 = getAutoCorrCoefficients('a_pani', 12);
autocorrCoeffs5 = getAutoCorrCoefficients('a_pani', 16);

figure(100); clf;
subplot(3,2,1); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''a_pani'' for p = ''6''', 'interpreter', 'none');
subplot(3,2,2); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''a_pani'' for p = ''8''', 'interpreter', 'none');
subplot(3,2,3); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''a_pani'' for p = ''10''', 'interpreter', 'none');
subplot(3,2,4); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''a_pani'' for p = ''12''', 'interpreter', 'none');
subplot(3,2,5); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''a_pani'' for p = ''16''', 'interpreter', 'none');

LPCoeffs1 = getLPCoefficients('a_pani', 6);
LPCoeffs2 = getLPCoefficients('a_pani', 8);
LPCoeffs3 = getLPCoefficients('a_pani', 10);
LPCoeffs4 = getLPCoefficients('a_pani', 12);
LPCoeffs5 = getLPCoefficients('a_pani', 16);

figure(200); clf;
subplot(3,2,1); stem(LPCoeffs1); axis tight;
title('LP coefficients of ''a_pani'' for p = ''6''', 'interpreter', 'none');
subplot(3,2,2); stem(LPCoeffs2); axis tight;
title('LP coefficients of ''a_pani'' for p = ''8''', 'interpreter', 'none');
subplot(3,2,3); stem(LPCoeffs3); axis tight;
title('LP coefficients of ''a_pani'' for p = ''10''', 'interpreter', 'none');
subplot(3,2,4); stem(LPCoeffs4); axis tight;
title('LP coefficients of ''a_pani'' for p = ''12''', 'interpreter', 'none');
subplot(3,2,5); stem(LPCoeffs5); axis tight;
title('LP coefficients of ''a_pani'' for p = ''16''', 'interpreter', 'none');


%% Now for n_pani 

autocorrCoeffs1 = getAutoCorrCoefficients('n_pani', 6);
autocorrCoeffs2 = getAutoCorrCoefficients('n_pani', 8);
autocorrCoeffs3 = getAutoCorrCoefficients('n_pani', 10);
autocorrCoeffs4 = getAutoCorrCoefficients('n_pani', 12);
autocorrCoeffs5 = getAutoCorrCoefficients('n_pani', 16);

figure(300); clf;
subplot(3,2,1); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''n_pani'' for p = ''6''', 'interpreter', 'none');
subplot(3,2,2); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''n_pani'' for p = ''8''', 'interpreter', 'none');
subplot(3,2,3); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''n_pani'' for p = ''10''', 'interpreter', 'none');
subplot(3,2,4); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''n_pani'' for p = ''12''', 'interpreter', 'none');
subplot(3,2,5); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''n_pani'' for p = ''16''', 'interpreter', 'none');

LPCoeffs1 = getLPCoefficients('n_pani', 6);
LPCoeffs2 = getLPCoefficients('n_pani', 8);
LPCoeffs3 = getLPCoefficients('n_pani', 10);
LPCoeffs4 = getLPCoefficients('n_pani', 12);
LPCoeffs5 = getLPCoefficients('n_pani', 16);

figure(400); clf;
subplot(3,2,1); stem(LPCoeffs1); axis tight;
title('LP coefficients of ''n_pani'' for p = ''6''', 'interpreter', 'none');
subplot(3,2,2); stem(LPCoeffs2); axis tight;
title('LP coefficients of ''n_pani'' for p = ''8''', 'interpreter', 'none');
subplot(3,2,3); stem(LPCoeffs3); axis tight;
title('LP coefficients of ''n_pani'' for p = ''10''', 'interpreter', 'none');
subplot(3,2,4); stem(LPCoeffs4); axis tight;
title('LP coefficients of ''n_pani'' for p = ''12''', 'interpreter', 'none');
subplot(3,2,5); stem(LPCoeffs5); axis tight;
title('LP coefficients of ''n_pani'' for p = ''16''', 'interpreter', 'none');


%% Now for i_pani 

autocorrCoeffs1 = getAutoCorrCoefficients('i_pani', 6);
autocorrCoeffs2 = getAutoCorrCoefficients('i_pani', 8);
autocorrCoeffs3 = getAutoCorrCoefficients('i_pani', 10);
autocorrCoeffs4 = getAutoCorrCoefficients('i_pani', 12);
autocorrCoeffs5 = getAutoCorrCoefficients('i_pani', 16);

figure(500); clf;
subplot(3,2,1); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''i_pani'' for p = ''6''', 'interpreter', 'none');
subplot(3,2,2); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''i_pani'' for p = ''8''', 'interpreter', 'none');
subplot(3,2,3); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''i_pani'' for p = ''10''', 'interpreter', 'none');
subplot(3,2,4); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''i_pani'' for p = ''12''', 'interpreter', 'none');
subplot(3,2,5); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''i_pani'' for p = ''16''', 'interpreter', 'none');

LPCoeffs1 = getLPCoefficients('i_pani', 6);
LPCoeffs2 = getLPCoefficients('i_pani', 8);
LPCoeffs3 = getLPCoefficients('i_pani', 10);
LPCoeffs4 = getLPCoefficients('i_pani', 12);
LPCoeffs5 = getLPCoefficients('i_pani', 16);

figure(600); clf;
subplot(3,2,1); stem(LPCoeffs1); axis tight;
title('LP coefficients of ''i_pani'' for p = ''6''', 'interpreter', 'none');
subplot(3,2,2); stem(LPCoeffs2); axis tight;
title('LP coefficients of ''i_pani'' for p = ''8''', 'interpreter', 'none');
subplot(3,2,3); stem(LPCoeffs3); axis tight;
title('LP coefficients of ''i_pani'' for p = ''10''', 'interpreter', 'none');
subplot(3,2,4); stem(LPCoeffs4); axis tight;
title('LP coefficients of ''i_pani'' for p = ''12''', 'interpreter', 'none');
subplot(3,2,5); stem(LPCoeffs5); axis tight;
title('LP coefficients of ''i_pani'' for p = ''16''', 'interpreter', 'none');


%% Now for s_uska 

autocorrCoeffs1 = getAutoCorrCoefficients('s_uska', 6);
autocorrCoeffs2 = getAutoCorrCoefficients('s_uska', 8);
autocorrCoeffs3 = getAutoCorrCoefficients('s_uska', 10);
autocorrCoeffs4 = getAutoCorrCoefficients('s_uska', 12);
autocorrCoeffs5 = getAutoCorrCoefficients('s_uska', 16);

figure(700); clf;
subplot(3,2,1); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''s_uska'' for p = ''6''', 'interpreter', 'none');
subplot(3,2,2); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''s_uska'' for p = ''8''', 'interpreter', 'none');
subplot(3,2,3); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''s_uska'' for p = ''10''', 'interpreter', 'none');
subplot(3,2,4); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''s_uska'' for p = ''12''', 'interpreter', 'none');
subplot(3,2,5); stem(autocorrCoeffs1); axis tight;
title('Autocorr coefficients of ''s_uska'' for p = ''16''', 'interpreter', 'none');

LPCoeffs1 = getLPCoefficients('s_uska', 6);
LPCoeffs2 = getLPCoefficients('s_uska', 8);
LPCoeffs3 = getLPCoefficients('s_uska', 10);
LPCoeffs4 = getLPCoefficients('s_uska', 12);
LPCoeffs5 = getLPCoefficients('s_uska', 16);

figure(800); clf;
subplot(3,2,1); stem(LPCoeffs1); axis tight;
title('LP coefficients of ''s_uska'' for p = ''6''', 'interpreter', 'none');
subplot(3,2,2); stem(LPCoeffs2); axis tight;
title('LP coefficients of ''s_uska'' for p = ''8''', 'interpreter', 'none');
subplot(3,2,3); stem(LPCoeffs3); axis tight;
title('LP coefficients of ''s_uska'' for p = ''10''', 'interpreter', 'none');
subplot(3,2,4); stem(LPCoeffs4); axis tight;
title('LP coefficients of ''s_uska'' for p = ''12''', 'interpreter', 'none');
subplot(3,2,5); stem(LPCoeffs5); axis tight;
title('LP coefficients of ''s_uska'' for p = ''16''', 'interpreter', 'none');
