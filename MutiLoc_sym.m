%% Simulate multi robots signal source
% 1 robot locator
% MapSize = 1000;
% RobotNum =  5? Five signal source
function [sigMap, MapSize, rb1Loc, rbLocs, RobotNum, pathList, figHandle]= MutiLoc_sym()
clear;
clc;
MapSize = 1000;
RobotNum = 4;
[sigMap, MapSize, rbLocs, RobotNum, figHandle] = SigMapInitSyme(MapSize, RobotNum)

rb1Loc(1) = 500;
rb1Loc(2) = 500;

%initialize pathList
pathList(1).x = rb1Loc(1);
pathList(1).y = rb1Loc(2);
pathList(1).sig = sigMap(rb1Loc(1), rb1Loc(2));
pathList(1).parent = 1;
     
%%%%%%%%%%%%%%%%%%%%%%
%Add nextpos into pathlist until it reaches the threshold RSSI cell
%TH = sigMap(rbLocs(1,1) + 1, rbLocs(1,2) + 1);
TH = -100;
iter = MapSize/2;
    count = 1;
    while (sigMap(rb1Loc(1), rb1Loc(2)) < TH)&&(count < iter)              
        %call func NextPos 
        [newCell newPos] = NextPos(rb1Loc, sigMap);          
        %random assign a step if the newPos is a repeated point in the pathList
        temNodeID = count;
        while temNodeID > 1
            tmpx = pathList(temNodeID).x;
            tmpy = pathList(temNodeID).y;
            if tmpx == newPos(1) && tmpy == newPos(2)
                newPos = newPos + rand(1, 2) * 4;
            end
            temNodeID = temNodeID - 1;
        end
        count = count + 1;
        pathList = AddNode(pathList, newCell,newPos, count);
        rb1Loc = newPos;    
    end
%%%%%%%%%%%%%%%%%%%%%%
%draw RSSI signal map
    figHandle = figure('Visible', 'on');
    x = 1:MapSize;
    y = 1:MapSize;
    surf(x, y, sigMap);
    hold on;

%Plot path list in signal Map
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
 
% a = zeros(20, 3);
% for i = 1 : 20;
%     a(i, :) = [pathList(i).x pathList(i).y pathList(i).sig];
 %end
 
 %%%%%%%%%%%%%%%%%%%%%
 %Draw robots in a physical map without ploting the signal map
 Handle2 = figure('Visible', 'on');
 phyMap = zeros(MapSize, MapSize);
 
 %plot signal sources
 for i = 1 : RobotNum
    scatter(rbLocs(i, 1),rbLocs(i, 2), 50, 'fill', 'o');
    hold on;
 end
 
 %plot the rb1(locator) intial location
 %figure(Handle2);
 scatter(pathList(1).x, pathList(1).y, 50, 'k','fill', 's');
 hold on;
 
 %Plot the pathlist in the physical map
 figure(Handle2);
 currNodeID = count;
 while (currNodeID > 1)
     btX = pathList(currNodeID).x;
     btY = pathList(currNodeID).y;
     currNodeID = currNodeID - 1;
     % Plot backtrack in red line
     plot([btX pathList(currNodeID).x], [btY pathList(currNodeID).y], 'r', 'LineWidth', 2);
     xlim([0 MapSize]);
     ylim([0 MapSize]);
     hold on;
     grid on;
 end
 
end
