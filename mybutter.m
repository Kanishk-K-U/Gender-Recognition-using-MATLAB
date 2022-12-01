function [B,A] = mybutter(W)



V  = tan(W * 1.5707963267948966);  
Sg = V ^ 2;
Sp = V * [-1-1i, -1+1i] / sqrt(2);

P = (1 + Sp) ./ (1 - Sp);
G = real(Sg / prod(1 - Sp));

B = G * [1, 2, 1];
A = real(poly(P));
end
