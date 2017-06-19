vacio([]).
raiz([_,N,_], N).
hi([HI,_,_],HI).
hd([_,_,HD],HD).
hazarbol(R,HI,HD,[HI,R,HD]).

escribe_arbol(_,ABN,_) :- vacio(ABN).
escribe_arbol(R,ABN,L) :- raiz(ABN,R).
escribe_arbol(R,ABN,L) :- hi(ABN,HI), hd(ABN,HD).
