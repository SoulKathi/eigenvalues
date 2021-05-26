using SparseArrays
using LinearAlgebra
using Plots

function vekit(A, y, e)
    l=0;
    while true
        # do stuff
        y_h = A*y
        l = dot(y_h,y)
        y=y_h/norm(y_h)
        if (norm(A*y-l*y)<e)
            return l,y,eigen(A).values;
        end
    end
end

#print("rr")
A = [1 2; 3 4]
y = [1; 2]
e = 0.1
print(vekit(A,y,e))