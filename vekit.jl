using SparseArrays
using LinearAlgebra
using Plots

function vekit(A, y, e)
    l=[0];
    while true
        # Berechnung gemäß Algorithmus (Arbeitsblatt)
        y_h = A*y
        l_h = dot(y_h,y)
        # neue Nährung Eigenwert zu Liste Nährungen Eigenwert hinzufügen
        l=[l;l_h]
        y=y_h/norm(y_h)
        # Abbruchkriterium
        if (norm(A*y-l_h*y)<e)
            # Liste Nährungen Eigenwert und Eigenvektor zurückgeben
            return l,y;
        end
    end
end