function F = EigenfaceF(vT,X,r)
F = X * vT(1:r,:)';
end