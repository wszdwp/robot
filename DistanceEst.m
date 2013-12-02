%%Estimate distance based on RSSI path loss model
%   Path loss in free space transimission
% PL(d) = PL(d_0) + 10 * n * log( d / d_0) + X_sigma
%Wi-Fi: Pt(dBm) = 7; P_d0(dB) = 40; d_0(m) = 1; n = 2.9;
% P_d0(dBm) = 30 + 40 = 70 dBm
%Define variables:
%d0:        --The reference distance
%d:         --The actual distance
%PL:        --Path loss (Watts)
function target = DistanceEst(loc1,sigMap)
    %Parameters
    [x, y] = [loc1(1), loc1(2)];
    %d_0 = 1;
    %n = 2.9;
    %X_sigma = 0;
    P_d0 = 70;
    Pt = 7;
    %Distance Calculation
    Pr = sigMap(x, y);
    distance = 10.^( (Pt - Pr -P_d0)./29 );
    %Four RSSI value at different direction
    upcell = [x, y+1];
    downcell = [x, y-1];
    leftcell = [x-1, y];
    rightcell = [x+1, y];
    
    %get the lowest RSSI value direction
    direction = max(upcell, downcell, leftcell, rightcell);
    
    direction = 
end