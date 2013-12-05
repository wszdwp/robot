%%RSSI path loss model
%   Path loss in free space transimission
% PL(d) = PL(d_0) + 10 * n * log( d / d_0) + X_sigma
%Wi-Fi: Pt(dBm) = 7; P_d0(dB) = 40; d_0(m) = 1; n = 2.9;
% P_d0(dBm) = 30 + 40 = 70 dBm
%Define variables:
%d0:        --The reference distance, 1m
%d:         --The actual distance, 
%PL:        --Path loss (Watts)
%n = 3.5    --Experience value
function Pr = RSSI(loc1, loc2)
    %Parameters
    d_0 = 1;
    n = 3.5;
    %X_sigma = 0;    %version 1 = 0
    X_sigma = normrnd(0,37.16);     %sigma = 5.2dB = 37.16dBm
    P_d0 = 70;
    Pt = 7;
    %version1 ---Map size is cm, convert it to m 
    location1 = loc1./100;
    location2 = loc2./100;
    
    %version 2 ---Map size is 1m,
    %location1 = loc1;
    %location2 = loc2;
    %RSSI Calculation
    Pl = P_d0 + 10.* n * log(sqrt( (location1(1) - location2(1)).^2 +(location1(2) - location2(2)).^2 )./d_0) + X_sigma;
    Pr = Pt - Pl;
end