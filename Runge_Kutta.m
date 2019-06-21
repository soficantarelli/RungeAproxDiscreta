function [X Y] = Runge_Kutta(f, a, b,condicion, h)

syms y(x)
V = odeToVectorField(f)
M = matlabFunction(V,'vars',{'x','Y'})

xs = a : h : b;
n = ( b - a ) / h;

for i = 1 : n 
    xi = xs(i);
    yi = condicion(:,i);
    k1 = h*M(xi,yi);
    k2 = h*M(xi+h/2,yi+k1/2);
    k3 = h*M(xi+h/2,yi+k2/2);
    k4 = h*M(xi+h,yi+k3);
    
    nextCondicion=yi+(k1+2*k2+2*k3+k4)/6;
    condicion=[condicion nextCondicion];
end
X = xs
Y = condicion(1,:)