%% Simulate multi robots signal source
% 1 robot locator
% MapSize = 1000;
% RobotNum =  5? Five signal source
function [sigMap, MapSize, rb1Loc, rbLocs, RobotNum, a, pathList, figHandle]= MutiLoc_test()
clear;
MapSize = 100;
RobotNum = 5;
[sigMap, MapSize, rbLocs, RobotNum, figHandle] = SigMapInitMulti(MapSize, RobotNum)

rb1Loc(1) = MapSize./2;
rb1Loc(2) = MapSize./2;

%initialize pathList
pathList(1).x = rb1Loc(1);
pathList(1).y = rb1Loc(2);
pathList(1).sig = sigMap(rb1Loc(1), rb1Loc(2));
pathList(1).parent = 1;
     
%%%%%%%%%%%%%%%%%%%%%%

TH = sigMap(rbLocs(1,1) + 1, rbLocs(1,2) + 1);
iter = MapSize/2;
    count = 1;
    while (sigMap(rb1Loc(1), rb1Loc(2)) < TH)&&(count < iter)              
        %call func NextPos 
        [newCell newPos] = NextPos(rb1Loc, sigMap);
        count = count + 1;
        pathList = AddNode(pathList, newCell,newPos, count);
        rb1Loc = newPos;    
    end
%%%%%%%%%%%%%%%%%%%%%%

%draw map
    figHandle = figure('Visible', 'on');
    x = 1:MapSize;
    y = 1:MapSize;
    surf(x, y, sigMap);
    hold on;
 % Plot line
 figure(figHandle);
 currNodeID = count;
 while (currNodeID > 1)
     btX = pathList(currNodeID).x;
     btY = pathList(currNodeID).y;
     currNodeID = currNodeID - 1;
     % Plot backtrack in red line
     plot([btX pathList(currNodeID).x], [btY pathList(currNodeID).y], 'm', 'LineWidth', 2);
     hold on;
 end
 
 a = zeros(20, 3);
 for i = 1 : 20;
     a(i, :) = [pathList(i).x pathList(i).y pathList(i).sig];
 end
 
 %%%%%%%%%%%%%%%%%%%%%physical map
 Handle2 = figure('Visible', 'on');
 phyMap = zeros(MapSize, MapSize);
 %plot signal sources 
 for i = 1 : RobotNum
    scatter(rbLocs(i, 1),rbLocs(i, 2), 10, 'fill');
    hold on;
 end
 %plot the rb1 intial location
 figure(Handle2);
 scatter(rb1Loc(1), rb1Loc(2), 20, 'k','fill', 'd');
 hold on;
 
 figure(Handle2);
 currNodeID = count;
 while (currNodeID > 1)
     btX = pathList(currNodeID).x;
     btY = pathList(currNodeID).y;
     currNodeID = currNodeID - 1;
     % Plot backtrack in red line
     plot([btX pathList(currNodeID).x], [btY pathList(currNodeID).y], 'm', 'LineWidth', 2);
     xlim([ 0 MapSize]);
     ylim([ 0 MapSize]);
     hold on;
     grid on;
 end
 
end
