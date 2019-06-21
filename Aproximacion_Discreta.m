function respuesta = Aproximacion_Discreta(f, xs, y)
syms x;
A = subs(f,transpose(xs));
AtA = transpose(A)*A;

aux=((inv(AtA))*(transpose(A)*transpose(y)))
f = aux(1) + aux(2)*x + aux(3)*x^2;
respuesta = f;