liste([]).
liste([_|L]):-
	liste(L).

%1
rang_paire([],[]).
rang_paire([_],[]).

rang_paire([_X,Y|L1],[Y|L2]):-
	rang_paire(L1,L2).

%2
membre(X,[X|_]).
membre(X,[_|L]):-
	membre(X,L).

%3
% insertion([],X,[X]). pas utile
insertion(L1,X,[X|L1]).
insertion([Y|L1],X,[Y|L2]):-
	insertion(L1,X,L2).

%4
prefixe([],_).
prefixe([Y|L],[Y|LL_]):-
	prefixe(L,LL_).

%5
suffixe(L,L).
suffixe(L_,[_|LL_]):-
	suffixe(L_,LL_).

%6
permute([],[]).
permute([X|L],P):-
	permute(L,P),insertion([X|L],X,P).
