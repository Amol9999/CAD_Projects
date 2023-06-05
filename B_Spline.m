function[b]= B_Spline(t,k,u,i)
if(k==1)
    if((u>=t(i)) && (u<=t(i+1)))
        b=1;
    else
        b=0;
    end;
else
    a=t(i+k-1)-t(i);
    l1=0;
    if(a~=0)
        b1=B_Spline(t,k-1,u,i);
        l1=((u-t(i))*b1)/a;
    end;
    a=t(i+k)-t(i+1);
    l2=0;
    if(a~=0)
        b1=B_Spline(t,k-1,u,i+1);
        l2=((t(i+k)-u)*b1)/a;
    end;
    b=l1+l2; 
end