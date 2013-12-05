%Script file: SigMapInitMulti.m
%Input: MapSize
%Two robots, rb1 and rb2 are both signal sources
%return the summed sigMap of rb1 and rb2
%


function [sigMap, MapSize, rbLocs, RobotNum, figHandle] = SigMapInitSyme(MapSize, RobotNum)
    %RobotsNum of Robots randomly assigned in the map
    rbLocs = [RobotNum, 2];
    
    rbLocs(1,:) = [1 1];
    rbLocs(2,:) = [1000 1 ];
    rbLocs(3,:) = [1 1000 ];
    rbLocs(4,:) = [1000 1000];
    
    
    %while(rb2Loc == rb1Loc)
    %    rb2Loc = round(rand(1, 2) * MapSize);
    %end
   
    %Initial sigmap and Pass_loss params
    sigMap = zeros(MapSize,MapSize);
      
    %Calculate the RSSI value for the whole map
    Prtemp = zeros(1, RobotNum);
    Prtotal = 0;
    for x = 1 : MapSize
       for y = 1 : MapSize
           for num = 1 : RobotNum
               Prtemp(num) = RSSI( [x,y], [rbLocs(num, 1),rbLocs(num, 2)]);
               Prtotal = Prtotal + Prtemp(num);
           end
           Pr = Prtotal./ RobotNum;
           sigMap(x, y) = Pr;
           Prtotal = 0;
       end
    end
    figHandle = figure('Visible', 'on');
    %figure(figHandle);
    x = 1:MapSize;
    y = 1:MapSize;
    surf(x, y, sigMap);
end

    
