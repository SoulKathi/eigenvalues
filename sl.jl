using SparseArrays
using LinearAlgebra
using Plots

include("vekit.jl")
include("invvekit.jl")

let
    n=100
    # Matrix definieren
    B=Matrix(n*n*spdiagm(-1 => -ones(n-2),0 => 2*ones(n-1), 1 => -ones(n-2)))
    # y erstellen
    y=[]
    for k in 1:n-1
        y=[y;k]
    end
    m=0
    e=10^-3
    # größter Eigenvektor
    l_1,y_1=vekit(B,y,e)
    # kleinster Eigenvektor
    l_n1,y_n1=invvekit(B,y,m,e) #TODO: Tut nicht, wegen Fehler in invvekit
    
    #TODO: Plot
end