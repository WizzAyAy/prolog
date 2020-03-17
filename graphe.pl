%s(_S, []).
%s(_S, [_F| _SUCC]).
%       sommet       | reste
%graphe( [s(_S,[_|_]) | _] ).


mg(graphe([s(a,[b,c]), s(b,[d,e]), s(c,[d,e]), s(d,[]), s(e,[])])).
mgsc(graphe( 
[ 
s(a,[b,c]),
s(b,[d,e]),
s(c,[d,e]),
s(d,[f]),
s(e,[f]),
s(f,[])
] )).
gv([]).

%graphe_vide(G)
graphe_vide(graphe([])).

%sommets(+G,-S)
sommets(graphe(G),L):-
sommets_rec(G,L).

sommets_rec([], []).
sommets_rec( [s(S,_)|G], [S|L]):-
	sommets_rec(G, L).

%successeurs(S,G,Succ_S)
successeurs(ID,graphe(G),L):-
	successeurs_rec(ID,G,L).

successeurs_rec(_, [], []).
successeurs_rec(ID, [s(ID,LISTE) | _] ,LISTE):-!.
successeurs_rec(ID, [s(_,_) | G], L):-
	successeurs_rec(ID, G, L).
	
%pred(S,G,Pred_S)
appartient(X, [X|_]):-!.
appartient(X, [_|L]):- appartient(X,L).

pred(ID,graphe(G),L):-
	sommets(graphe(G),Lis),appartient(ID,Lis),pred_rec(ID,G,L).

pred_rec(_,[],[]).

pred_rec(ID, [ s(E,LI) | G], [E|L]):-
	pred_rec(ID,G,L), appartient(ID,LI).
	
pred_rec(ID, [ s(_,LI) | G], L):-
	pred_rec(ID,G,L), \+appartient(ID,LI).
	

%ote_sommet(S,G,G_)
ote_sommet(ID,graphe(G),graphe(G2)):-
	ote_sommet_rec(ID,G,G2).

ote_sommet_rec(_,[],[]).
%supprime le sommet
ote_sommet_rec(ID, [s(ID,_) | G1], G2):-
	ote_sommet_rec(ID,G1,G2).
ote_sommet_rec(ID, [s(P,L) | G1], [s(P,L2) | G2]):-
	ID\=P,ote_sommet_rec(ID,G1,G2), enleve(ID,L,L2).


%enleve X dans L
enleve(_,[],[]).
enleve(X,[X|L],L2):-
	enleve(X,L,L2).
enleve(X,[P|L],[P|L2]):-
	X\=P,enleve(X,L,L2).




%tri topologique
tri_topo(G,[]):-graphe_vide(G).

tri_topo(G, [X|L]):-
	pred(X,G,[]),
	ote_sommet(X,G,G2),
	tri_topo(G2,L).

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
