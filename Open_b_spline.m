%% Assignment 3 closed B-spline curve with 8 control points
%% Amol Mathur (801984003)

%% Settings
clc
clear all
close all

%% Variable defination

x = [1 2 10 20 25 30 25 9];       % X-coordinates of control points
y = [1 10 20 30 40 50 10 10];     % Y-coordinates of control points

x = [20 10 10 20 60 70 70 60];       % X-coordinates of control points
y = [0 50 130 180 180 130 50 0];     % Y-coordinates of control points

plot(x,y,'-r');
hold on;

n = 7;                          % N+1 = n no. of Control Points)
k = 4;                          % K-1 = k degree of curve required

kv = zeros(n+2,1);              % Knot vectors

l1 = 0;
l2 = 0;

N = zeros(n+k,k);             % B-spline function

x1 = 0;
y1 = 0;

%% initialization

% knot vector values.
for i = 0 : n+k
    if i < k
        kv(i+1) = 0;
    end
    if i <= n && i >= k
        kv(i+1) = i - k + 1;
    end
    if i > n
        kv(i+1) = n - k + 2;
    end
end
a1111 = 1;
for u = 0 : 0.01 : n - k + 2
%u = 4.0001;
    x1 = 0;
    y1 = 0;
    % for K = 1 first column.
    for o = 1 : n+k
        if u <= kv(o+1) && u >= kv(o)
            N(o,1) = 1;
        else
            N(o,1) = 0;
        end
    end
    % all other values
    for j = 2 : k
    %j = 2;
        for i = 1 : n+1
            if i+j-1 <= n + k
                if (kv(i+j-1)-kv(i))~=0
                    l1 = ((u-kv(i))*(N(i,j-1)))/(kv(i+j-1)-kv(i));
                end
                if (kv(i+j)-kv(i+1))~=0
                    l2 = ((kv(i+j)-u)*(N(i+1,j-1))/(kv(i+j)-kv(i+1)));
                end
                N(i,j) = l1 + l2;
                l1 = 0;
                l2 = 0;
            end
        end
    end
    for p = 0 : n
        x1 = x1 + x(1,p+1)*N(p+1,k);
        y1 = y1 + y(1,p+1)*N(p+1,k);
    end
    plot (x1,y1,'.b');
end