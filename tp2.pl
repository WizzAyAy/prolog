parent('Francois I','Henri II').
parent('Francois I','Marguerite').
parent('Francois I','Madeleine').

parent('Henri II','Francois II').
parent('Henri II','Charles IX').
parent('Henri II','Henri III').
parent('Henri II','Margot').

parent('Marguerite','Charles Emmanuel').

parent('Charles IX','Elisabeth').

parent('Charles Emmanuel','Victor-Amedee').

homme('Francois I').
homme('Henri II').
homme('Francois II').
homme('Charles IX').
homme('Henri III').
homme('Charles Emmanuel').
homme('Victor-Amedee').

femme('Madeleine').
femme('Marguerite').
femme('Margot').
femme('Elisabeth').

pere(X,Y):-
	homme(X),
	parent(X,Y).
	
mere(X,Y):-
	femme(X),
	parent(X,Y).
	
fille(X,Y):-
	femme(X),
	parent(Y,X).
	
gdparent(X,Y):-
	parent(X,T),
	parent(T,Y).
	
gdpere(X,Y):-
	gdparent(X,Y),
	pere(X).

gdmere(X,Y):-
	gdparent(X,Y),
	mere(X).
	

ancetre(X,Y):- parent(X,Y).
ancetre(X,Y):-	
	parent(X,Z), 
	ancetre(Z,Y).
		
frere(X,Y):-
	parent(Z,Y),
	parent(Z,X),
	homme(X),
	Y\=X.	
	
soeur(X,Y):-
	parent(Z,Y),
	parent(Z,X),
	femme(X),
	Y\=X.

oncle(X,Y):-
	homme(X),
	parent(Z,Y),
	frere(Z,X).

	
	
