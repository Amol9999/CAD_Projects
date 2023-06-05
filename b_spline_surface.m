% settings
clc;
clear all;
close all;
% surface specifications
n = 4;                  % no. of control points in u direction
m = 5;                  % no. of control points in v direction
k = 4;                  % degree in u direction
l = 5;                  % degree in v direction
% points
p= [ 60 100 170 220;    % points in x-direction
    60 100 150 250;
    40 100 180 220;
    50 100 160 230;
    55 100 170 240];
q = [ 60 80 30 30;      % points in y-direction
    100 120 150 200;
    250 280 280 300;
    320 350 330 370;
    380 400 420 430];
r = [10 10 10 10;       % points in z-direction
    20 20 20 20;
    30 30 30 30;
    40 40 40 40;
    50 50 50 50];
% knot vectors
% u-direction
j=n+k;                              %knot vector limit
for i=1:1:j                         %starting from 1 because matlab not consider 0
    l=k+1;                          %increment in k because t0 value is shifting to t1
    if  i<l
        t(i)=0;
    elseif i>=l && i<=n+1
        t(i)=i-k;                   % i-k instead of i-k+1
    else
        t(i)=n-k+1;                 % n-k+1 instead of n-k+2
    end;
end;
%v-direction
j=l+m;                              %knot vector limit
for i=1:1:j                         %starting from 1 because matlab not consider 0
    l=k+1;                          %increment in l because s0 value is shifting to s1
    if  i<l
        s(i)=0;
    elseif i>=l && i<=n+1
        s(i)=i-k;                   % i-l instead of i-l+1
    else
        s(i)=n-k+1;                 % m-l+1 instead of m-l+2
    end;
end;
% Bspline funnction
un = n-k+1;      % u maximum value n-k+1 intead of n-k+2 (k vale change to k+1)
um = m-l+1;      % u maximum value n-k+1 intead of n-k+2 (k vale change to k+1)
for u = 0 : 0.1 : un
    for v = 0 : 0.1 : um
        x1 = 0; y1 = 0; z1 = 0;
        for i = 1 : n
            for j = 1 : m
                bn(i) = B_Spline(t,k,u,i);  % Bspline function in u-direction
                bm(j) = B_Spline(s,l,v,j);  % Bspline function in v-direction
                x1=x1+(bn(i)*bm(j)*p(j,i));
                y1=y1+(bn(i)*bm(j)*q(j,i));
                z1=z1+(bn(i)*bm(j)*r(j,i));
            end;
        end
        plot3(x1,y1,z1,'*b');hold on; rotate3d on;
    end
end