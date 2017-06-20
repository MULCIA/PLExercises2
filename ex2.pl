/*

?- espejo_arbol(6,[[[[[],1,[]],5,[]],7,[[],3,[[],4,[]]]],6,[[[],10,[]],8,[[[],9,[]],11,[[],2,[]]]]],L).

*/

espejo_arbol(N,ABN,L):- explora_hijos(N,ABN,HS), construye_lista(HS,L).

explora_hijos(R,[],[]).
explora_hijos(R,[HI,R,HD],[HD,R,HI]).
explora_hijos(R,[HI,_,HD],HS) :-
    explora_hijos(R,HD,HS),
    explora_hijos(R,HI,HS).

construye_lista([],[]).
construye_lista([HI,R,HD],[R|Rs]) :-
    construye_lista(HI,HIs),
    construye_lista(HD,HDs),
    append(HIs,HDs,Rs).
