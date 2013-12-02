%%Test1.m
%
%
%
%
%Robot1, Robot2 randomly assigned in the map
%%
function [sigMap, MapSize, rb1Loc, rb2Loc, newCell, pathList, figHandle] = Test11()
    
    clear;
    MapSize = 100;
    %rb1 location, rb2(sig source) location 
    rb1Loc(1) = round(rand() * 10 + 1);
    rb1Loc(2) = round(rand() * 10)+ 1;
    rb2Loc(1) = (MapSize/2);
    rb2Loc(2) = (MapSize/2);
    
    %Initial sigmap and Pass_loss params
    sigMap = zeros(MapSize,MapSize);
    
    %Calculate the RSSI value for the whole map
    %MapSize unit 1 cm
    for x = 1 : MapSize
       for y = 1 :MapSize
               Pr = RSSI( [x,y], [rb2Loc(1),rb2Loc(2)] );
               sigMap(x, y) = Pr;
       end
    end
    
    %initialize pathList
    pathList(1).x = rb1Loc(1);
    pathList(1).y = rb1Loc(2);
    pathList(1).sig = sigMap(rb1Loc(1), rb1Loc(2));
    pathList(1).parent = 1;
    
%%%%%%%%%%%%%%%%%%%%%%
TH = 12;
    count = 1;
    while (sigMap(rb1Loc(1), rb1Loc(2)) < TH)&&(count < 1500)              
        %call func NextPos 
        [newCell newPos] = NextPos(rb1Loc, sigMap);
        count = count + 1;
        pathList = AddNode(pathList, newCell,newPos, count);
        rb1Loc = newPos;    
    end
%%%%%%%%%%%%%%%%%%%%%%
%draw map
    figHandle = figure('Visible', 'on');
    x = [1:MapSize];
    y = [1:MapSize];
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
     % Change current node to its parent
end
    
end




