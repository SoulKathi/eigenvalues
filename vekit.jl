using SparseArrays
using LinearAlgebra
using Plots

function vekit(A, y, e)
    l=[0];
    while true
        # do stuff
        y_h = A*y
        l_h = dot(y_h,y)
        l=[l;l_h]
        y=y_h/norm(y_h)
        if (norm(A*y-l_h*y)<e)
            return l,y;
        end
    end
end

#print("rr")
#A = [1 2; 3 4]
#y = [1; 2]
#e = 0.1
#print(vekit(A,y,e))