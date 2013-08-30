% Scrambled Block Hadamard Ensemble
%
% Creates \Phi function to a signal based on this paper 
% FAST COMPRESSIVE IMAGING USING SCRAMBLED BLOCK HADAMARD ENSEMBLE
% Gan et al 2008
%
% rowperm  : unif randomly selected M numbers(rows) from 1 to N 
% colperm  : randomly permuted N numbers(columns)
% B        : block size of Hadamard matrix
%
% Example parameter values:
% rowperm = randperm(N,M);
% colperm = randperm(N);
% B = 32;

function Phi = gen_sbhe_matrix(rowperm, colperm, B)

M = numel(rowperm);
N = numel(colperm);

% BxB Hadamard matrix
WB = hadamard(B);

Phi = zeros(M,N);

parfor i = 1:M
    % choose row
    rownum = rowperm(i);
    
    % form the row in the W matrix, permute and inner product with x
    zfront = B * floor((rownum-1)/B);
    phi = [zeros(1,zfront) WB(rem(rownum-1,B)+1,:) zeros(1,N-B-zfront)];
    phi = phi(colperm);
        
    Phi(i,:) = phi / sqrt(B);
end
