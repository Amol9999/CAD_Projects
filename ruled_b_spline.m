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
        %Program for B-Spline Curve1
        n1 = 4;                       %control points = n+1
        d1 = n1+1;                     %variable representing control points
        k = 4;                       %degree = k-1
        X1 = [50,150,200,220];     %x Coordinates of control polygon
        Y1 = [50,80,100,90];    %y coordiantes of control polygon
        line(X1,Y1);                   %plotting the control polygon
        umax1=n1-k+2;                  %maximum value of 'u'
        %Loop for calculating KNOT Vectors
        for j1=0:1:(n1+k)
            if j1<k
                t = 0;
            elseif (k<=j1) && (j1<=n1)
                t = j1-k+1;
            elseif j1>n1
                t = (n1-k)+2;
            end
            disp(t);
        end
        x1 = 0;y1 =0;                 %starting point
        for i =0:1:d1                %for loop for calculating all 'N' functions
            N=blend_1(1,u,t,k);     %calling N function
            x1 = x1+N*X1(i+1);         %x coordiante of b-spline func
            y1 = y1+N*Y1(i+1);         %y coordiante of b-spline func
        end
        plot(x1,y1,'r*');             %plotting of the b-spline curve
        
        %Program for B-Spline Curve2
        n2 = 4;                       %control points = n+1
        d2 = n2+1;                     %variable representing control points
        k = 4;                       %degree = k-1
        X2 = [50,150,200,220];     %x Coordinates of control polygon
        Y2 = [50,80,100,90];    %y coordiantes of control polygon
        line(X2,Y2);                   %plotting the control polygon
        umax2=n2-k+2;                  %maximum value of 'u'
        %Loop for calculating KNOT Vectors
        for j2=0:1:(n2+k)
            if j2<k
                t = 0;
            elseif (k<=j2) && (j2<=n2)
                t = j2-k+1;
            elseif j2>n2
                t = (n2-k)+2;
            end
            disp(t);
        end
        x2 = 0;y2 =0;                 %starting point
        for i =0:1:d2                %for loop for calculating all 'N' functions
            N=blend_1(i,u,t,k);     %calling N function
            x2 = x2+N*X2(i+1);         %x coordiante of b-spline func
            y2 = y2+N*Y2(i+1);         %y coordiante of b-spline func
        end
        plot(x2,y2,'r*');             %plotting of the b-spline curve
        
        %surface
        x = x1 + v*(x2-x1);
        y = y1 + v*(y2-y1);
        plot(x,y,'b*');
    end
end
