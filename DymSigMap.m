%% Script file: DymSigMap.m
%two robot case, while two robot(source) is moving
%
%
%

function [sigMap, figHandle] = DymSigMap(sigMap, MapSize, rbLocs, RobotNum, figHandle)
   
    
   
    
        
end

%% ADD NODE FUNCTION
function Tree1 = AddNode(Tree1, parentNodeID)
    % Get the length of the tree
    tlength = length(Tree1);
    
    % Add new element to the tree
    Tree1(tlength+1).x = Tree1(tlength).x + 1;
    Tree1(tlength+1).y = Tree1(tlength).y + 1;
    Tree1(tlength+1).parent = parentNodeID;
    
end

%% EXTEND FUNCTION
function extended = Extend(sigMap, stepSize)
    extended
end