%%RSSI path loss model plot
%   Path loss in free space transimission
% PL(d) = PL(d_0) + 10 * n * log( d / d_0) + X_sigma
%Wi-Fi: Pt(dBm) = 7; P_d0(dB) = 40; d_0(m) = 1; n = 2.9;
% P_d0(dBm) = 30 + 40 = 70 dBm
%Define variables:
%d0:        --The reference distance, 1m
%d:         --The actual distance, 
%PL:        --Path loss (Watts)
%n = 3.5    --Experience value
function Pr = RSSIplot(d)
    %Parameters
    d_0 = 1;
    n = 3.5;
    X_sigma = 0;
    P_d0 = 70;
    Pt = 7;
    d = d./100;  % d is in unit cm needed to be convert to m
    %RSSI Calculation
    Pl = P_d0 + 10.* n * log(d./d_0) + X_sigma;
    Pr = Pt - Pl;
end