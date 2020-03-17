%pour include :-['nomfichier'].
liste([]).
liste([_|L]):-
	liste(L).

%1
rang_paire([],[]).
rang_paire([_],[]).

rang_paire([_X,Y|L1],[Y|L2]):-
	rang_paire(L1,L2).
	
rang_impaire([],[]).
rang_impaire([X],[X]).
rang_impaire([X,_Y|L1], [X|L2]):-
	rang_impaire(L1,L2).

rang_pi([],[],[]).
rang_pi([X],[],[X]).
rang_pi([X,Y|L], [Y|LP], [X|LI]):-
	rang_pi(L,LP,LI).

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
prefixe([],_SUITE).
prefixe([Y|L],[Y|Lr]):-
	prefixe(L,Lr).

%5
suffixe(L,L).
suffixe(L_,[_|LL_]):-
	suffixe(L_,LL_).

%6
permute([],[]).
permute([X|L],P):-
	permute(L,P),insertion([X|L],X,P).

%td2
%conc
conc([],L_,L_).
conc([X|L], L_, [X|LL_]):-
	conc(L,L_,LL_).
	
%partage
partage([],[],[]).
partage([X],[X],[]).
partage([X,Y|LL_], [X|L], [Y|L_]):-
	partage(LL_,L,L_).
	
%inf-st
inf_st(X,Y):-X<Y.
%place

place(X,[],[X]).
place(X,[Y|L],[X,Y|L]):-
	place(X,L,_LX),inf_st(X,Y).
place(X,[Y|L],[Y|LX]):-
	place(X,L,LX),\+inf_st(X,Y).

%de part et d'autre
%ppp = plus petit que p
%ep = egale a p
%pgp = plus grand que p
dpeda(_P,[],[],[],[]).
% P<X
dpeda(P,[X|L],[X|PPP],EP,PGP):-
	dpeda(P,L,PPP,EP,PGP),inf_st(X,P).
% = 
dpeda(P,[P|L],PPP,[P|EP],PGP):-
	dpeda(P,L,PPP,EP,PGP).
% P>X
dpeda(P,[X|L],PPP,EP,[X|PGP]):-
	dpeda(P,L,PPP,EP,PGP),inf_st(P,X).

	
	
%fusion
fusion([],[],[]).
fusion([],T_,T_).
fusion(T,[],T).
% =
fusion([X|T],[X|T_],[X,X|TT_]):-	
	fusion(T,T_,TT_).
% X < Y
fusion([X|T],[Y|T_],[X|TT_]):-	
	inf_st(X,Y),fusion(T,[Y|T_],TT_).
% Y < X
fusion([X|T],[Y|T_],[Y|TT_]):-	
	\+inf_st(X,Y),fusion([X|T],T_,TT_).


	
	
%tri par insertion avec place
sort_ins([],[]).
sort_ins([X|L], T):-
	sort_ins(L,R),place(X,R,T).

%quick sort avec dpeda
sort_quick([],[]).
sort_quick([X],[X]).

sort_quick([P|L],[A,B,C]):-
	dpeda(P,L,PPP,EP,PGP),sort_quick([_X|PPP],A),
	sort_quick([_Y|EP],B),sort_quick([_Z|PGP],C).

	
%tri par fusion avec fusion
sort_fus([],[]).
sort_fus([X],[X]).
sort_fus([X|L],T):-
	sort_fus(L,T),fusion(X,L,T).






%test perso ...
taille([],0).
taille([_|L], N):- 
	taille(L, ACC), N is ACC + 1.


memberchk(X,[X|_]) :- !.
memberchk(X,[_|T]):- memberchk(X,T).
	
	
	
	
