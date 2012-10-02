function [ coeff, b0 ] = levinsonDurbin( data , p)


rx = data; % autocorr coefficients
a = zeros(p+1);
e = zeros(1, p+1);
G = zeros(1, p+1);
reflected = zeros(1, p+1);
a(1, 1) = 1; e(1) = rx(1);

for j = 1:p;
    G(j) = rx(j+1);
    sum = 0;
    for i = 2:j;
        sum = sum + (a(j, i)*rx(j-i+1));
    end
    G(j) = G(j) + sum;
    reflected(j+i) = -G(j)/e(j);
    
    for i  = 2:j;
            a(j+1, i) = a(j, i) + (reflected(j+1)*a(j, j-i+1));
    end
    
    a(j+1, j+1) = reflected(j+1);
    e(j+1) = e(j) * (1-(abs(reflected(j+1))^2));
    
end
b0 = sqrt(e(p+1)); % the b(0) that we require in the numerator of the transfer function
coeff = a(p+1, 2:end); % coeff is the array of a(p) coefficients
coeff = -1 * coeff;
% length(coeff)

% % the code below forms the equation of the power spectrum and then plots it
% res = 100000; % resolution some kind of 
% w = 0:res;
% w = w.*2*pi*(1/res);
% denominator = 1;
% for k = 1:length(coeff);
%     denominator = denominator + (coeff(k) * exp(-1i*k.*w));
% end
% 
% numerator = abs(b0)^2;
% denominator = abs(denominator).^2;
% Px = numerator./denominator;
% 
% figure, plot (w, Px);
% title(['Power Spectrum of an AR process of degree ', num2str(p)]);
% xlabel('Frequency (rad/s)');
% ylabel('Magnitude (unitless)');

end


