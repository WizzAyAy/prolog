liste([]).
liste([_|L]):-
liste(L).


dernier(X, [X], []).
dernier(X, [Y|L], [Y|L_]):-
dernier(X, L, _L).

rang_paire(L,_L).
rang_paire([],[]).
rang_paire([A],[]). 


	
	
	
