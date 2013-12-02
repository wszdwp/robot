function [PhyMap, rb1Loc, rb2Loc] = MotionCtrl(rb1Loc, rb2Loc, MapSize, sigMap)
    %Initial sigmap and Pass_loss params
    PhyMap = zeros(MapSize,MapSize);
    
    %Robot1 location
    x1 = rb1Loc(1);
    y1 = rb1Loc(2);
    %Robot2 location
    x2 = rb2Loc(1);
    y2 = rb2Loc(2);
    
    %Robot1 check the four direction sig values in the sigMap
    attennaDist = 1;
    up = [x1-attennaDist, y1];
    down = [x1+attennaDist, y1];
    right = [x1, y1+attennaDist];
    left = [x1, y1-attennaDist];
    dirArray2 = [up, sigMap(up(1), up(2));
                down, sigMap(down(1), down(2))];
    dirArray = [sigMap(up), sigMap(down), sigMap(left), sigMap(right)];
    
    
    [x0 y0] = find( sigMap = max(dirArray));
end
