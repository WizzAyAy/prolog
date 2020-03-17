mg2( graphe([a,b,c,d,e],
[a(a,b),
a(b,d),
a(a,c),
a(b,e),
a(c,d),
a(c,e),
a(e,a),
a(e,e)])).

mgv( graphe([],[]) ).
%graphevide

graphe_vide( graphe([],_) ).

%sommet

sommets([],_,[]).
sommets(graphe(LS,_),LS).

%successeurs(S,G,Succ_S)
successeurs(ID,graphe(_,LA),SUCC):-
	successeurs_rec(ID,_,LA,SUCC).

successeurs_rec(ID,_,[(ID,TO)|LA],[TO|SUCC]):-
	successeurs_rec(ID,_,LA,SUCC).
successeurs_rec(ID,_,[(P,_)|LA],SUCC):-
	P\=ID,successeurs_rec(ID,_,LA,SUCC).





