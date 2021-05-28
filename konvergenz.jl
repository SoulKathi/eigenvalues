using SparseArrays
using LinearAlgebra
using Plots

include("vekit.jl")

let
    # Metrizen definieren
    A=[23 4 3; 5 4 5; -30 -10 -10]
    B=[-1 0 1; 0 1 0; 1 0 -1]
    C=[2 -3 1; 3 1 3; -5 2 -4]
    # y_0 definieren
    y=[8; 3; 5]/norm([8; 3; 5])
    # epsilon definieren
    e=10^-10
    # Eigenwert und eigenvektor berechnen, Fehler auf Eigenwert berechnen
    l_A,y_A=vekit(A,y,e)
    f_A=map(x -> abs((x-maximum(eigen(A).values))/maximum(eigen(A).values)), l_A)
    l_B,y_B=vekit(B,y,e)
    f_B=map(x -> abs((x-maximum(eigen(B).values))/maximum(eigen(B).values)), l_B)
    l_C,y_C=vekit(C,y,e)
    f_C=map(x -> abs((x-maximum(eigen(C).values))/maximum(eigen(C).values)), l_C)

    #TODO: Plot
end