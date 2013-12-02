%% RSSI sigMap - 1 robot
% x = 50 m       resolution: 0.1m = 10cm
% y = 50 m 
% z = RSSI (dBm)
%
MapSize = 50;
[sigMap, MapSize, rb1Loc, rb2Loc, Pr, x, y, figHandle] = SigMapInit(MapSize)
xlabel('Distance (m)');
ylabel('Distance (m)');
zlabel('RSSI (dBm)');

%% RSSI sigMap - 5 robot
%
%
MapSize = 50;
RobotNum = 5;
[sigMap, MapSize, rbLocs, RobotNum, figHandle] = SigMapInitMulti(MapSize, RobotNum);
xlabel('Distance (m)');
ylabel('Distance (m)');
zlabel('RSSI (dBm)');