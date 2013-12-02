%% Script file: DymSigMap.m
%two robot case, while two robot(source) is moving
%rb2Loc is a signal source
%
%

function [sigMap] = DymSigMap1(sigMap, MapSize, rb1Loc, rb2Loc, figHandle)
    moverange = MapSize./2;
    for i = 1 : moverange
        rb2Loc(1) = rb2Loc(1) + 1;
        rb2Loc(2) = rb2Loc(2) + 1;
    
        %Calculate the RSSI 
        for x = 1 : MapSize
           for y = 1 : MapSize
                   Pr = RSSI( [x,y], [rb2Loc(1),rb2Loc(2)] );
                   sigMap(x, y) = Pr;
           end
        end
               
        figure(figHandle);
        x = [1:MapSize];
        y = [1:MapSize];
        surf(x, y, sigMap);
        %hold on;
     end   
end
