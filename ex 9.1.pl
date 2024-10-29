?- op(1199,xfx,-->).

translate((Pl-->P2),(G1:-G2)) :-
	left_hand_side(Pl,SO,S,Gl),
	right_hand_side(P2,S0,S,G2).

left_hand_side(P0,S0,S,G) :-
	nonvar(PO), tag(P0,S0,S,G).

right_hand_side((Pl,P2),S0,S,G) :-
	!,
	right_hand_side(Pl,SO,Sl,Gl),
	right_hand_side(P2,Sl,S,G2),
	and(Gl,G2,G).
right_hand_side(P,SO,S,true) :-
	islist(P),
	!,
	append(P,S,SO).
right_hand_side(P,SO,S,G) :- tag(P,S0,S,G).

tag(P,S0,S,G) :- atom(P), G =..[P,S0,S].

and(true,G,G) :-!.
and(G,true,G) :- !. and(Gl,G2,(Gl,G2)).

islist([]) :- !. islist(LU).

append([A|B],C,[A|D]) :- append(B,C,D).
append([],X,X).