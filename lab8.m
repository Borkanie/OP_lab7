clear
clc
syms x1 x2
%fun=2*x1^2*x2+31*x1^4+18*x2^2+3;
V1=[1;1];
V2=[0;-5];
V3=[0;5];
[X1,X2]=meshgrid([-10:0.1:10],[-10:0.1:10]);
Y=2*X1.^2*X2+31*X1.^4+18*X2.^2+3;
contour(X1,X2,Y)
figure
surf(X1,X2,Y)
%%
iter=100;
tol=0.01;
k=0;
figure
contour(X1,X2,Y)
while ((perimetru(V1,V2,V3)>tol)&&(k<iter))
    [B,G,W]=BGW(V1,V2,V3);
    M=(B+G)/2;
    R=2*M-W;
    if f(R(1),R(2)) < f(W(1),W(2)) 
       E = 2*R - M;
         if f(E(1),E(2)) < f(R(1),R(2)) 
            W=E;
        else
            W=R;
        end 
    else
        C1 = (M + W)/2;
        C2 = (M + R)/2;
        [S,Indexes] = sort([f(C1(1),C1(2)), f(C2(1),C2(2))]);
        C12=[C1,C2];
        C=C12(:,Indexes(1));
            if f(C(1),C(2)) < f(W(1),W(2)) 
                W=C;
            else
                S = (B + W)/2;
                W=S;
                G=M;
            end
    end
    V1=B;
    V2=G;
    V3=W;
    hold on
vals=[V1.';V2.';V3.'];
DT = delaunayTriangulation(vals)
triplot(DT)
end
%%
[X1,X2]=meshgrid([-0.005:0.00001:0.005],[-0.005:0.00001:0.005]);
Y=2*X1.^2*X2+31*X1.^4+18*X2.^2+3;
contour(X1,X2,Y)
hold on
vals=[V1.';V2.';V3.'];
DT = delaunayTriangulation(vals)
triplot(DT)