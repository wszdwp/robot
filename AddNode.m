%% ADD NODE FUNCTION
%
function pathList = AddNode(pathList, newCell,newPos, count)
    % Get the length of the tree
    len = length(pathList);
    
    % Add new element to the tree
    pathList(len+1).x = newPos(1);
    pathList(len+1).y = newPos(2);
    pathList(len+1).sig = newCell(3);
    pathList(len+1).parent = count; 
end