/*

?- escribe_arbol([[[[[],1,[]],5,[]],7,[[],3,[[],4,[]]]],6,[[[],10,[]],8,[[[],9,[]],11,[[],2,[]]]]],L,P).
L = [6, 7, 5, 1, 3, 4, 8, 10, 11|...],
P = [0, 1, 2, 3, 2, 3, 1, 2, 2|...] .

*/

escribe_arbol(ABN,L,P):- explora_hijos(ABN,L,P,0).%, ordena_lista().

explora_hijos([],[],_,_).
explora_hijos([[],R,[]],[R|Rs],[N|Ps],N).
explora_hijos([HI,R,HD],[R|Rs],[N|Ps],N) :-
    N2 is N + 1,
    explora_hijos(HI,HIs,PIs,N2),
    explora_hijos(HD,HDs,PDs,N2),
    append(HIs,HDs,Rs),
    append(PIs,PDs,Ps).

/*ordena_lista([],[]).
ordena_lista([HI,R,HD],[R|Rs]) :-
    ordena_lista(HI,HIs),
    ordena_lista(HD,HDs),
    append(HIs,HDs,Rs).*/
