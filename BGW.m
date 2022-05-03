function [B,G,W] = BGW(V1,V2,V3)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
P1=f(V1(1),V1(2));
P2=f(V2(1),V2(2));
P3=f(V3(1),V3(2));
Vunsorted=[V1,V2,V3];
[P,Index]=sort([P1,P2,P3]);
B=Vunsorted(:,Index(1));
G=Vunsorted(:,Index(2));
W=Vunsorted(:,Index(3));
end