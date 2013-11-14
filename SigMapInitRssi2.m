%Script file: SigMapInitRssi2.m
%Input: MapSize
%Two robots, rb1 and rb2. Rb2 is the signal source
%return the sigMap of rb2
%using round up version of RSSI
%


function [sigMap, MapSize, rb1Loc, rb2Loc, Pr, x, y, figHandle] = SigMapInitRssi2(MapSize)
    %Robot1, Robot2 randomly assigned in the map 
    rb1Loc(1) = (MapSize/2);
    rb1Loc(2) = (MapSize/2);
    rb2Loc = round(rand(1, 2) * MapSize);
    while(rb2Loc == rb1Loc)
        rb2Loc = round(rand(1, 2) * MapSize);
    end
    
    %Initial sigmap and Pass_loss params
    sigMap = zeros(MapSize,MapSize);
      
    %Calculate the RSSI value for the whole map
    
    
    for x = 1 :MapSize
       for y = 1 :MapSize
               Pr = RSSI2( [x,y], [rb2Loc(1),rb2Loc(2)] );
               sigMap(x, y) = Pr;
       end
    end
    
    %round up into three RSSI levels
    RSSI_1 = sigMap(rb2Loc(1)+1, rb2Loc(2)+1);
    RSSI_2 = 2.*RSSI_1;
    RSSI_3 = 3.*RSSI_1;
    for x = 1 :MapSize
       for y = 1 :MapSize
               if sigMap(x, y) <= RSSI_2 && RSSI_2 >= RSSI_3
                  sigMap(x, y) = RSSI_2;
               end
               if sigMap(x, y) <= RSSI_3 
                   sigMap(x, y) = RSSI_2;
               end
               
       end
    end
    
    figHandle = figure('Visible', 'on');
    x = [1:MapSize];
    y = [1:MapSize];
    surf(x, y, sigMap);
    
end

    
