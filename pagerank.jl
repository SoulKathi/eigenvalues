using SparseArrays
using LinearAlgebra
using Plots

include("vekit.jl")

let
    # A bestimmen
    A=sparse([1,1,1,1,2,2,3,3,4,4,4,5,5,5,6,6,6,6,7,7,7,8,8,9,9,9,10,10,10,10,11,11,12,12,12,13,13,14,14,15,15],[2,3,4,6,4,6,4,5,6,7,8,3,4,10,4,8,10,11,4,8,9,7,11,5,7,10,7,8,9,13,10,13,10,13,15,10,14,11,15,13,14],[1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0,1.0])
    # L bestimmen
    L=A'
    for j in 1:15  
        for i in 1:15
            if(L[i,j]!=0)
                L[i,j]=L[i,j]/sum(A[j,1:15])
            end
        end
    end
    # Eigenwert und Eigenvektor bestimmen
    print(vekit(L,[1 0 0 0 0 0 0 0 0 0 0 0 0 0 0]',10^-10))
    # Ich habe keine Ahnung, was das Ergebnis bedeuten soll, von daher bin ich auch nicht sicher, wie ich es am Besten dastellen soll.
end