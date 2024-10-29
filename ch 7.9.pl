go(X, X, T). 
go(X, Y, T) :- a(X, Z), legal(Z, T), go(Z, Y, [Z|T]). 

legal(X, []). 
legal(X, [H|T]) :- \+ X = H, legal(X, T)