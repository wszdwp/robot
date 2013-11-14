%% single robots RSSI dynamic sigMap test
% test1.m
%
%
%
MapSize = 40;
[sigMap, MapSize, rb1Loc, rb2Loc, Pr, x, y, figHandle] = SigMapInit(MapSize);
[sigMap] = DymSigMap1(sigMap, MapSize, rb1Loc, rb2Loc, figHandle);


%% Multi robots static RSSI sigMap test
%
%
MapSize = 40;
RobotNum = 5;
[sigMap, MapSize, rbLocs, RobotNum, figHandle] = SigMapInitMulti(MapSize, RobotNum);
