significantly_better([Con1|_], [Con2|_]) :-
	UpperLimit is 0.85 * Con2,
	Con1 < UpperLimit.
significantly_better([_|Con1], [_|Con2]) :-
	significantly_better(Con1, Con2).
