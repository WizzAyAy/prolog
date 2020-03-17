%question 1
vin1(100,'chablis',1974,12).
vin1(110,'mercurey',1978,13).
vin1(120,'macon',1977,12).

vin2(100,'chablis',1974,12).
vin2(200,'sancerre',1979,11).
vin2(210,'pouilly',1980,12).
vin2(230,'pouilly',1981,12).

viticulteur('nicolas','pouilly','bourgogne').
viticulteur('martin','bordeaux','bordelais').

%question 2
%vin2(NUM,'pouilly',MILLESIME,DEGRE).
%vin2(NUM,CRU,MILLESIME,12).

%question3
vin3(N,C,M,D):-
	vin1(N,C,M,D),
	vin2(N,C,M,D).

%question4
vin4(N,C,M,D):-vin1(N,C,M,D).
vin4(N,C,M,D):-vin2(N,C,M,D).
vin4(N,C,M,D):-not(vin3(N,C,M,D)).

%question5
%\+(vin2(_,_,1978,_)).

%question6
vin5(N,C,M,D):-
	vin1(N,C,M,D),
	\+vin2(N,C,M,D).
	
%question7
vignoble(N,C,M,D,P,V,R):-
	vin5(N,C,M,D),
	viticulteur(P,V,R).
	
%question8
vin6(C,M):-
	vin5(_N,C,M,_D).

%question9
vin7(N,C,M,D):-
	vin4(N,C,M,D),
	M >= 1975,M < 1980.

%question10
vin8(N,C,M,D,P,V,R):-
	vin4(N,C,M,D),
	viticulteur(P,V,R),
	C=V.

%question11
vin9(macon, 1977, 12).
vin9(macon, 1979, 14).
vin9(macon, 1980, 12).
vin9(saumur, 1977,  12).
vin9(saumur, 1979,  14).
vin9(chablis, 1977,  12).

type(1977,12).
type(1979,14).

pv9(C):-vin9(C,_,_).
cru(C):-pv9(C),\+reste(C,_,_).
reste(C,M,D):-
	pv9xtype(C,M,D),
	\+vin9(C,M,D).
pv9xtype(C,M,D):-
	pv9(C),type(M,D).
	
	








	







