%%NextPos.m
%Choose the Maxium RSSI direction as the next Postion
%param
%   input:  rb1Loc, sigMap 
%   output: newPos
%

% Choose the next direction
    function [newCell newPos] = NextPos(rb1Loc, sigMap)
        x1 = rb1Loc(1);
        y1 = rb1Loc(2);
        attennaDist = 1;   %attenna's distance
        xmin = 1;
        xmax = length(sigMap);
        ymin = 1;
        ymax = length(sigMap);
        if (x1<xmax) && (x1>xmin)&&(y1<ymax)&&(y1>ymin)
            up = [x1-attennaDist, y1];
            down = [x1+attennaDist, y1];
            right = [x1, y1+attennaDist];
            left = [x1, y1-attennaDist];
        end
        
        %leftdownmost cell
        if (x1==xmax)&(y1==ymin)
            up = [x1-attennaDist, y1];
            down = [x1, y1];
            right = [x1, y1+attennaDist];
            left = [x1, y1];
        end
        %rightdownmost cell
        if (x1==xmax)&(y1==ymax)
            up = [x1-attennaDist, y1];
            down = [x1, y1];
            right = [x1, y1];
            left = [x1, y1-attennaDist];
        end
        %leftupmost cell
        if (x1==xmin)&(y1==ymin)
            up = [x1, y1];
            down = [x1+attennaDist, y1];
            right = [x1, y1+attennaDist];
            left = [x1, y1];
        end
        %rightupmost cell
        if (x1==xmin)&(y1==ymax)
            up = [x1, y1];
            down = [x1+attennaDist, y1];
            right = [x1, y1];
            left = [x1, y1-attennaDist];
        end
        %bottom row
        if (x1 == xmax)
            up = [x1-attennaDist, y1];
            down = [x1, y1];
            right = [x1, y1+attennaDist];
            left = [x1, y1-attennaDist];
        end
        %upper row
        if (x1 == xmin)
            up = [x1, y1];
            down = [x1+attennaDist, y1];
            right = [x1, y1+attennaDist];
            left = [x1, y1-attennaDist];
        end
        %leftmost colume
        if (y1 == ymax)
            up = [x1-attennaDist, y1];
            down = [x1+attennaDist, y1];
            right = [x1, y1];
            left = [x1, y1-attennaDist];
        end 
        %rightmost colume
        if (y1 == ymin)
            up = [x1-attennaDist, y1];
            down = [x1+attennaDist, y1];
            right = [x1, y1+attennaDist];
            left = [x1, y1];
        end
        
        %check if out of boundary(up down left right)
        if (min(up(1), up(2)) <= 0)|| ...
           (min(down(1), down(2)) <= 0)|| ...
           (min(left(1), left(2)) <= 0)|| ...
           (min(right(1), right(2)) <= 0)
                up = max(up, 1);
                down = max(down, 1);
                left = max(left, 1);
                right = max(right, 1);
        end
        if  max(up(1), up(2)) > length(sigMap)|| ... 
            max(down(1), down(2)) > length(sigMap)|| ...
            max(left(1), left(2)) > length(sigMap)|| ...
            max(right(1), right(2)) > length(sigMap)
                up = min(up, 1);
                down = min(down, 1);
                left = min(left, 1);
                right = min(right, 1);
        end  
        
        dirArray = [up, sigMap(up(1), up(2));
                    down, sigMap(down(1), down(2));
                    left, sigMap(left(1), left(2));
                    right, sigMap(right(1), right(2));
                    ];
        [r, c] = find(dirArray==max(dirArray(:,3)));
        newCell = dirArray(r,:);
        newPos = newCell([1 2]);  
    end
    