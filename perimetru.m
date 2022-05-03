function [p] = perimetru(V1,V2,V3)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here
p=(norm(V1-V2) + norm(V2-V3) + norm(V1-V3)) / 2;
end