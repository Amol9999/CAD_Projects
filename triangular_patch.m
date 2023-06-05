% *********************PROGRAM FOR TRIANGULAR PATCH ******************
% INPUT ARGUMENTS : COORDINATES
% OUTPUT : PLOT OF TRIANGULAR PATCH
% *************************************************************************

clc;
clear;
close all;
n = 3;
x = [50 100 140 200 90 120 180 100 130 120];
y = [50 60 50 55 150 140 160 200 220 250];
z = [10 10 10 10 20 20 20 30 30 40];
for u = 0:0.05:1
    for v = 0:0.05:1
        for w = 0:0.05:1
            l=u+v+w;
            if l>=0.99 && l<=1.001
                x1 = 0;y1 =0;z1 =0;t=1;
                for i = 0:1:n
                    for j = 0:1:n
                        for k = 0:1:n
                            if i+j+k ==n
                                p = factorial(n);
                                q = factorial(i)*factorial(j)*factorial(k);
                                B = (p/q)*(u^i)*(v^j)*(w^k);
                                x1 = x1+ B*x(t);
                                y1 = y1+ B*y(t);
                                z1 = z1+ B*z(t);
                                t = t+1;
                            end
                        end
                    end
                end
                plot3(x1,y1,z1,'*b');hold on;grid on;rotate3d on;
            end
        end
    end
end