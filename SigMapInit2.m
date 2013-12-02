%Script file: SigMapInit2.m
%Input: MapSize
%Two robots, rb1 and rb2 are both signal sources
%return the summed sigMap of rb1 and rb2
%


function [sigMap, rb1Loc, rb2Loc, Pr, x, y] = SigMapInit2(MapSize)
    %Robot1, Robot2 randomly assigned in the map 
    rb1Loc = round(rand(1, 2) * MapSize);
    rb2Loc = round(rand(1, 2) * MapSize);
    while(rb2Loc == rb1Loc)
        rb2Loc = round(rand(1, 2) * MapSize);
    end
    
    %Initial sigmap and Pass_loss params
    sigMap = zeros(MapSize,MapSize);
      
    %Calculate the RSSI value for the whole map
    
    
<<<<<<< HEAD
    for x = 1 : MapSize
       for y = 1 : MapSize
=======
    for x = 1 : MapSize;
       for y = 1 : MapSize;
>>>>>>> 39c195aefb5636a2915c97c4793aa84744a75117
               Pr1 = RSSI( [x,y], [rb1Loc(1),rb1Loc(2)] );
               Pr2 = RSSI( [x,y], [rb2Loc(1),rb2Loc(2)] );
               Pr = (Pr1 + Pr2)./ 2;
               sigMap(x, y) = Pr;
       end
    end
    x = [1:MapSize];
    y = [1:MapSize];
    surf(x, y, sigMap);
end

    
