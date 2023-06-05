% ************Program to Draw a Plane Surface *****************************
% ************Submitted by Amol Mathur*************************************

clc;
close all;
format short;
hold on;

%input parameters
x1 = 50;
y1 = 70;
x2 = 150;
y2 = 150;
x3 = 80;
y3 = 250;
for u=0:0.1:1
    for v = 0:0.1:1
        x = x1 + u*(x2-x1)+ v*(x3-x1);
        y = y1 + u*(y2-y1)+ v*(y3-y1);
        plot(x,y,'b*');
    end
end