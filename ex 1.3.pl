dad(papa, syn).
dad(ded, papa).
dad(papa, sis).
mother(mama, syn).
mother(mama, sis).
man(ded).
man(papa).
man(syn).
woman(mama).
woman(sis).
parent(papa, syn).
parent(mama, syn).
parent(ded, papa).
parent(papa, sis).
parent(mama, sis).
different(papa, syn).
different(papa, mama).
different(papa, ded).
different(papa, sis).
different(syn, mama).
different(syn, ded).
different(syn, sis).
different(mama, ded).
different(mama, sis).
different(ded, sis).
different(syn, papa).
different(mama, papa).
different(ded, papa).
different(sis, papa).
different(mama, syn).
different(ded, syn).
different(sis, syn).
different(ded, mama).
different(sis, mama).
different(sis, ded).

is_mother(X):-
    mother(X, _).

is_father(X):-
    dad(X, _).

is_son(X):-
    dad(_, X),
    man(X).

is_sister(X, Y):-
    woman(X),
    different(X, Y),
    parent(_par, X),
    parent(_par, Y).

is_ded(X, Y):-
    man(X),
    dad(X, _child),
    parent(_child, Y).

bro_or_sis(X, Y):-
    parent(_par, X),
    parent(_par, Y),
    different(X, Y).