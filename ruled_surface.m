% *********************PROGRAM TO DRAW RULED SURFACE **********************
% INPUT ARGUMENTS : BEZIER CURVE 1 AND 2
% OUTPUT : GRAPH OF SURFACE
% *************************************************************************

clc;
clear;
close all;
format short;
hold on;
grid on;

for v = 0:0.1:1
    for u = 0:0.1:1
        %Program for Bezeir Curve 1
        n1 = 4;                         %number of control points
        d1 = n1-1;                      %degree of  the curve
        X1 = [50,150,200,220];          %x Coordinates of control polygon
        Y1 = [50,80,100,90];            %y coordiantes of control polygon
        line(X1,Y1);                    %plotting the control polygon
        x1=0; y1=0;                     %starting point
        for i1=0:1:d1                   %for loop for calculating all 'B' functions
            c=nchoosek(d1,i1);          %dCi ,'i' combinations from 'd' items
            B=c*((u^i1)*(1-u)^(d1-i1)); %bernstein function
            x1=x1+B*X1(i1+1);           %x coordiante of bezeir func
            y1=y1+B*Y1(i1+1);           %y coordinate of bezeir func
        end;                            %ending of the for loop
        plot(x1,y1,'*b');               %plotting of the bezeir curve
        
        %Program for Bezeir Curve 2
        n2 = 5;                         %number of control points
        d2 = n2-1;                      %degree of  the curve
        X2 = [40,100,160,220,250];      %x Coordinates of control 
        polygon
        Y2 = [250,270,300,310,250];     %y coordiantes of control polygon
        line(X2,Y2);                    %plotting the control polygon
        x2=0; y2=0;                     %starting point
        for i2=0:1:d2                   %for loop for calculating all 'B' functions
            c=nchoosek(d2,i2);          %dCi ,'i' combinations from 'd' items
            B=c*((u^i2)*(1-u)^(d2-i2)); %bernstein function
            x2=x2+B*X2(i2+1);           %x coordiante of bezeir func
            y2=y2+B*Y2(i2+1);           %y coordinate of bezeir func
        end;                            %ending of the for loop
        plot(x2,y2,'*b');               %plotting of the bezeir curve
        
        %surface
        x = x1 + v*(x2-x1);
        y = y1 + v*(y2-y1);
        plot(x,y,'b*');
    end
end
