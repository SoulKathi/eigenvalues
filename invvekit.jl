using SparseArrays
using LinearAlgebra
using Plots

function invvekit(A, y, m, e)
    l=[0];
    Q,R,p = lu(A-m*Diagonal(ones(size(A))))
    while true
        # do stuff
        y_h=R\(Q' * y)
        l_h = 1/(dot(y_h,y)) + m
        l=[l;l_h]
        y=y_h/norm(y_h)
        print(norm(A*y-l_h*y))
        if (norm(A*y-l_h*y)<e)
            return l,y;
        end
    end
end

print("rr")
A = [1 2; 3 4]
y = [1; 2]
m = 0
e = 1
print(invvekit(A,y,m,e))