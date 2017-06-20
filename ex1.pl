/*

?- escribe_arbol(6,[[[[[],1,[]],5,[]],7,[[],3,[[],4,[]]]],6,[[[],10,[]],8,[[[],9,[]],11,[[],2,[]]]]],L).
L = [6, 7, 5, 1, 3, 4, 8, 10, 11|...].

*/

escribe_arbol(N,ABN,L):- explora_hijos(N,ABN,HS), construye_lista(HS,L).

explora_hijos(R,[],[]).
explora_hijos(R,[HI,R,HD],[HI,R,HD]).
explora_hijos(R,[HI,_,HD],HS) :-
    explora_hijos(R,HI,HS),
    explora_hijos(R,HD,HS).

construye_lista([],[]).
construye_lista([HI,R,HD],[R|Rs]) :-
    construye_lista(HI,HIs),
    construye_lista(HD,HDs),
    append(HIs,HDs,Rs).
