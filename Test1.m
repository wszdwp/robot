%% single robots RSSI static sigMap test
% test1.m
%
%
%MapSize = 40 cm
MapSize = 40;
[sigMap, MapSize, rb1Loc, rb2Loc, Pr, x, y, figHandle] = SigMapInit(MapSize);
TH = 1;
    count = 0;
    while (sigMap(rb1Loc(1), rb1Loc(2)) < TH)&(count < 15)              
        %call func NextPos 
        [newCell newPos] = NextPos(rb1Loc, sigMap);
        rb1Loc = newPos;
        count = count + 1;
    end
%PathList
% Set the first element of a tree
function [pathList] = AddNode(pathList, newCell, newCellID)
    %initial the headNode
    pathList(1).x = rb1Loc(1);
    pathList(1).y = rb1Loc(2);
    pathList(1).sig = sigMap(rb1Loc(1), rb1Loc(2));
    pathList(1).parent = 1;
end

    
    %add new position to the pathList and move the robot to newPos
    rb1Loc = newPos;
    
   
    %pathList.AddNode()
 
[x0 y0] = find( sigMap == max(dirArray));
%% ADD NODE FUNCTION
%
function pathList = AddNode(pathList, extended, parentNodeID)
    % Get the length of the tree
    treeLen = length(pathList);
    
    % Add new element to the tree
    pathList(treeLen+1).x = extended(1);
    pathList(treeLen+1).y = extended(2);
    pathList(treeLen+1).parent = parentNodeID;
 
end







%% single robots RSSI dynamic sigMap test
% test1.m
%
%
MapSize = 60;
[sigMap, MapSize, rb1Loc, rb2Loc, Pr, x, y, figHandle] = SigMapInit(MapSize);
[sigMap] = DymSigMap1(sigMap, MapSize, rb1Loc, rb2Loc, figHandle);


%% Multi robots static RSSI sigMap test
%
%
MapSize = 40;
RobotNum = 5;
[sigMap, MapSize, rbLocs, RobotNum, figHandle] = SigMapInitMulti(MapSize, RobotNum);
