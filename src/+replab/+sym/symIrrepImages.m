function [SA SB NA NB OA OB] = symIrrepImages(partition)
% Return matrices for an irreducible representation of S(n)
%
% Representations of S(n) are indexed by Young diagrams. Here,
% we represent Young diagrams as a partition [n1 ... nk] where
% n = n1 + ... + nk, and n1...nk represent the number of blocks
% on each row of the Young diagram.
%
% We consider the symmetric group S(n) as generated by two
% generators:
%
% - 'a' is a cyclic permutation i -> i + 1
% - 'b' is the transposition of 1 and 2
%
% Returns
% -------
%   SA: double
%     Specht representation image of 'a'
%   SB: double
%     Specht representation image of 'b'
%   NA: double
%     Young seminormal representation image of 'a'
%   NB: double
%     Young seminormal representation image of 'a'
%   OA: double
%     Young orthogonal representation image of 'a'
%   OB: double
%     Young orthogonal representation image of 'b'
%
% Author: Serene Shum

SB = []; %Specht rep of (1 2)
SA = []; %Specht rep of (1 2 ... n)
NB = []; %semi-normal rep of (1 2)
NA = []; %semi-normal rep of (1 2 ... n)
OB = []; %orthogonal rep of (1 2)
OA = []; %orthogonal rep of (1 2 ... n)

if isequal(partition,[1]) %trivial
    
    SB = [1];
    SA = [1];
    NB = [1];
    NA = [1];
    OB = [1];
    OA = [1];
    
%S2
    
elseif isequal(partition,[2]) %trivial
    SB = [1];
    SA = [1];
    NB = [1];
    NA = [1];
    OB = [1];
    OA = [1];
    
elseif isequal(partition,[1 1]) %sign
    SB = [-1];
    SA = [-1];
    NB = [-1];
    NA = [-1];
    OB = [-1];
    OA = [-1];
    
%S3
    
elseif isequal(partition,[3]) %trivial
    SB = [1];
    SA = [1];
    NB = [1];
    NA = [1];
    OB = [1];
    OA = [1];
    
elseif isequal(partition,[2 1]) %standard
    SB = [0 -1; -1 0];
    SA = [-1 1; -1 0];
    NB = [1 0; 0 -1];
    NA = [-1/2 3/2; -1/2 -1/2];
    OB = [1 0; 0 -1];
    OA = [-1/2 sqrt(3)/2; -sqrt(3)/2 -1/2];
    
elseif isequal(partition,[1 1 1]) %sign
    SB = [-1];
    SA = [1];
    NB = [-1];
    NA = [1];
    OB = [-1];
    OA = [1];

%S4
    
elseif isequal(partition,[4]) %trivial
    SB = [1];
    SA = [1];
    NB = [1];
    NA = [1];
    OB = [1];
    OA = [1];
    
elseif isequal(partition,[3 1])%standard
    SB = [0 -1 0; -1 0 0; 0 0 1];
    SA = [-1 1 -1; -1 0 0; 0 -1 0];
    NB = [1 0 0; 0 1 0; 0 0 -1];
    NA = [-1/3 4/3 0; -1/3 -1/6 3/2; -1/3 -1/6 -1/2];
    OB = [1 0 0; 0 1 0; 0 0 -1];
    OA = [-1/3 2*sqrt(2)/3 0; -sqrt(2)/3 -1/6 sqrt(3)/2; -sqrt(6)/3 -sqrt(3)/6 -1/2];
    
elseif isequal(partition,[2 1 1]) %product of standard & sign
    SB = [-1 0 0; 0 0 -1; 0 -1 0];
    SA = [1 -1 0; 1 0 -1; 1 0 0];
    NB = [1 0 0; 0 -1 0; 0 0 -1];
    NA = [1/2 -1/2 2; 1/2 1/6 -2/3; 0 2/3 1/3];
    OB = [1 0 0; 0 -1 0; 0 0 -1];
    OA = [1/2 -sqrt(3)/6 sqrt(6)/3; sqrt(3)/2 1/6 -sqrt(2)/3; 0 2*sqrt(2)/3 1/3];
    
elseif isequal(partition,[2 2]) %2D irrep of S4
    SB = [1 0; 1 -1];
    SA = [-1 1; 0 1];
    NB = [1 0; 0 -1];
    NA = [-1/2 -3/2; -1/2 1/2];
    OB = [1 0; 0 -1];
    OA = [-1/2 -sqrt(3)/2; -sqrt(3)/2 1/2];
    
elseif isequal(partition,[1 1 1 1])%sign
    SB = [-1];
    SA = [-1];
    NB = [-1];
    NA = [-1];
    OB = [-1];
    OA = [-1];
    
%S5

elseif isequal(partition,[5]) %trivial
    SB = [1];
    SA = [1];
    NB = [1];
    NA = [1];
    OB = [1];
    OA = [1];
    
elseif isequal(partition,[1 1 1 1 1]) %sign
    SB = [-1];
    SA = [1];
    NB = [-1];
    NA = [1];
    OB = [-1];
    OA = [1];
    
elseif isequal(partition,[4 1]) %standard
    SB = [0 -1 0 0; -1 0 0 0; 0 0 1 0; 0 0 0 1];
    SA = [-1 1 -1 1; -1 0 0 0; 0 -1 0 0; 0 0 -1 0];
    NB = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 -1];
    NA = [-1/4 5/4 0 0; -1/4 -1/12 4/3 0; -1/4 -1/12 -1/6 3/2; -1/4 -1/12 -1/6 -1/2];
    OB = [1 0 0 0; 0 1 0 0; 0 0 1 0; 0 0 0 -1];
    OA = [-1/4 sqrt(15)/4 0 0; -sqrt(15)/12 -1/12 2*sqrt(2)/3 0; -sqrt(30)/12 -sqrt(2)/12 -1/6 sqrt(3)/2; -sqrt(90)/12 -sqrt(6)/12 -sqrt(3)/6 -1/2];
    
elseif isequal(partition,[3 2]) %5D irrep
    SB = [1 0 0 0 0; 0 0 0 -1 0; -1 0 0 0 -1; 0 -1 0 0 0; -1 0 -1 0 0];
    SA = [-1 1 -1 0 0; 0 0 0 1 -1; 0 0 1 0 -1; 1 0 0 0 0; 1 0 1 0 0];
    NB = [1 0 0 0 0; 0 1 0 0 0; 0 0 -1 0 0; 0 0 0 1 0; 0 0 0 0 -1];
    NA = [-1/3 -2/3 0 2 0; -1/3 1/12 -3/4 -1/4 9/4; -1/3 1/12 1/4 -1/4 -3/4; 0 -1/4 -3/4 -1/4 -3/4; 0 -1/4 1/4 -1/4 1/4];
    OB = [1 0 0 0 0; 0 1 0 0 0; 0 0 -1 0 0; 0 0 0 1 0; 0 0 0 0 -1];
    OA = [-1/3 -sqrt(2)/3 0 sqrt(6)/3 0; -sqrt(2)/3 1/12 -sqrt(3)/4 -sqrt(3)/12 3/4; -sqrt(6)/3 sqrt(3)/12 1/4 -1/4 -sqrt(3)/4; 0 -sqrt(3)/4 -3/4 -1/4 -sqrt(3)/4; 0 -3/4 sqrt(3)/4 -sqrt(3)/4 1/4];
    
elseif isequal(partition,[2 2 1]) %5D irrep
    SB = [0 0 -1 0 0; 0 0 0 -1 0; -1 0 0 0 0; 0 -1 0 0 0; 0 0 0 0 -1];
    SA = [1 -1 -1 1 0; 0 -1 -1 0 1; 1 -1 0 0 0; 0 -1 0 0 0; 1 -1 -1 0 0];
    NB = [1 0 0 0 0; 0 -1 0 0 0; 0 0 1 0 0; 0 0 0 -1 0; 0 0 0 0 1];
    NA = [1/4 3/4 -3/4 -9/4 0; 1/4 -1/4 -3/4 3/4 0; 1/4 -1/4 1/4 -1/4 -2; 1/4 1/12 1/4 1/12 2/3; 0 1/3 0 1/3 -1/3];
    OB = [1 0 0 0 0; 0 -1 0 0 0; 0 0 1 0 0; 0 0 0 -1 0; 0 0 0 0 1];
    OA = [1/4 sqrt(3)/4 -sqrt(3)/4 -3/4 0; sqrt(3)/4 -1/4 -3/4 sqrt(3)/4 0; sqrt(3)/4 -1/4 1/4 -sqrt(3)/12 -sqrt(6)/3; 3/4 sqrt(3)/12 sqrt(3)/4 1/12 sqrt(2)/3; 0 sqrt(6)/3 0 sqrt(2)/3 -1/3];
    
elseif isequal(partition, [3 1 1]) %exterior square of standard rep
    SB = [-1 0 0 0 0 0; 0 0 0 -1 0 0; 0 0 0 0 -1 0; 0 -1 0 0 0 0; 0 0 -1 0 0 0; 0 0 0 0 0 1];
    SA = [1 -1 1 0 0 0; 1 0 0 -1 1 0; 0 1 0 -1 0 1; 1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 0 1 0 0];
    NB = [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 -1 0; 0 0 0 0 0 -1];
    NA = [1/3 -1/3 0 5/3 0 0; 1/3 1/24 -3/8 -5/24 15/8 0; 1/3 1/24 1/8 -5/24 -5/8 0; 0 3/8 -3/8 1/8 -1/8 2; 0 3/8 1/8 1/8 1/24 -2/3; 0 0 1/2 0 1/6 1/3];
    OB = [1 0 0 0 0 0; 0 1 0 0 0 0; 0 0 -1 0 0 0; 0 0 0 1 0 0; 0 0 0 0 -1 0; 0 0 0 0 0 -1];
    OA = [1/3 -sqrt(2)/6 0 sqrt(30)/6 0 0; sqrt(2)/3 1/24 -sqrt(3)/8 -sqrt(15)/24 sqrt(45)/8 0; sqrt(6)/3 sqrt(3)/24 1/8 -sqrt(45)/24 -sqrt(15)/8 0; 0 sqrt(15)/8 -sqrt(45)/24 1/8 -sqrt(3)/24 sqrt(6)/3; 0 sqrt(45)/8 sqrt(15)/24 sqrt(3)/8 1/24 -sqrt(2)/3; 0 0 sqrt(30)/6 0 sqrt(2)/6 1/3];
end