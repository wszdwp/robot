%Script file: SigMapInit.m
%Input: MapSize
%Two robots, rb1 and rb2. Rb2 is the signal source
%return the sigMap of rb2
%


function [sigMap, rb1Loc, rb2Loc, Pr, x, y] = SigMapInit(MapSize)
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
    
    
    for x = 1 : MapSize;
       for y = 1 : MapSize;
               Pr = RSSI( [x,y], [rb2Loc(1),rb2Loc(2)] );
               sigMap(x, y) = Pr;
       end
    end
    x = [1:MapSize];
    y = [1:MapSize];
    surf(x, y, sigMap);
end

    
