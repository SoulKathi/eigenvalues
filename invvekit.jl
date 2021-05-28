using SparseArrays
using LinearAlgebra
using Plots

function invvekit(A, y, m, e)
    l=[0];
    # Berechnung gemäß Algorithmus (Arbeitsblatt)
    Q,R,p = lu(A-m*Diagonal(ones(size(A))))
    while true
        y_h=R\(Q' * y) #TODO: geht nicht immer, warum
        l_h = 1/(dot(y_h,y)) + m
        # Närung Eigenwert zu Liste Eigenwert hinzufügen
        l=[l;l_h]
        # neuen Wert Eigenvektor setzen
        y=y_h/norm(y_h)
        # Abbruchkriterium prüfen
        if (norm(A*y-l_h*y)<e)
            # Liste Eigenwert und Eigenvektor zurückgeben
            return l,y;
        end
    end
end