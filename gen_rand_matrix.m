function phi = gen_rand_matrix(phi_type,N,M)
% Generates and returns a random matrix for compressed sensing
% Options: 'gauss', 'sbhe', 'bern'

switch phi_type
    case 'gauss'
        % generate new gauss matrix
        phi = randn(M,N);
        phi = orth(phi');
        phi = phi';
    case 'sbhe'        
        row_perm = randperm(N,M);
        col_perm = randperm(N);
        B = 32;
        phi = gen_sbhe_matrix(row_perm,col_perm,B);        
    case 'bern'
        phi = rand(M,N);
        phi = 2 * double(phi > 0.5) - 1;
        phi = phi / sqrt(M);
end
