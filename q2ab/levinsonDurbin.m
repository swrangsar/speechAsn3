function [ coeff, b0 ] = levinsonDurbin(autocorrCoeffs)

siz = size(autocorrCoeffs(:));
poleOrder = siz(1) - 1;
p = poleOrder;
rx = autocorrCoeffs(:); % autocorr coefficients
a = zeros(p+1);
e = zeros(1, p+1);
G = zeros(1, p+1);
reflected = zeros(1, p+1);
a(1, 1) = 1; e(1) = rx(1);

for j = 0:p-1;
    G(j+1) = rx(j+2);
    sum = 0;
    if j > 0
        for i = 1:j;
            sum = sum + (a(j+1, i+1)*rx(j+2-i));
        end
    end
    G(j+1) = G(j+1) + sum;
    reflected(j + 2) = -G(j+1)/e(j+1);
    
    for i  = 1:j;
            a(j+2, i+1) = a(j+1, i+1) + (reflected(j+2)*a(j+1, j-i+2));
    end
    
    a(j+2, j+2) = reflected(j+2);
    e(j+2) = e(j + 1) * (1-(abs(reflected(j+2))^2));
    
end
b0 = sqrt(e(p+1)); % the b(0) that we require in the numerator of the transfer function
coeff = a(p+1, (2:end)); % coeff is the array of a(p) coefficients
coeff = -1 * coeff;

end