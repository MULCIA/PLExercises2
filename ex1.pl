/*

?-  escribe_arbol([[[[[],1,[]],5,[]],7,[[],3,[[],4,[]]]],6,[[[],10,[]],8,[[[],9,[]],11,[[],2,[]]]]],NS).
NS = [6, 8, 7, 11, 10, 3, 5, 2, 9|...] .

*/

% Recibe un ABN y una lista de Nodos ordenados vacia. Consigue la lista de nodos por busqueda en profundidad junto a sus niveles, para ser ordenados despues.
escribe_arbol(ABN,NS) :- explora_hijos(ABN,N,L,0), insert_sort(L,N,LS,NS). %insert_sort(L,N,NS).

explora_hijos([],[],_,_).
explora_hijos([[],R,[]],[R|Rs],[N|Ps],N).
explora_hijos([HI,R,HD],[R|Rs],[N|Ps],N) :-
    N2 is N + 1,
    explora_hijos(HI,HIs,PIs,N2),
    explora_hijos(HD,HDs,PDs,N2),
    append(HIs,HDs,Rs),
    append(PIs,PDs,Ps).

insert_sort(List,List2,Sorted,Sorted2):-i_sort(List,List2,[],[],Sorted,Sorted2).

i_sort([],[],Acc,AccO,Acc,AccO).
i_sort([H|T],[HO|TO],Acc,AccO,Sorted,SortedO):-insert(H,HO,Acc,AccO,NAcc,NAccO),i_sort(T,TO,NAcc,NAccO,Sorted,SortedO).

insert(X,XO,[Y|T],[YO|TO],[Y|NT],[YO|NTO]):-X>Y,insert(X,XO,T,TO,NT,NTO).
insert(X,XO,[Y|T],[YO|TO],[X,Y|T],[XO,YO|TO]):-X=<Y.
insert(X,XO,[],[],[X],[XO]).

/*insert_sort(List,P,Sorted,S):-i_sort(List,P,[],Sorted,S).

i_sort([],[],Acc,Acc,Acc).
i_sort([H|T],[P|Ps],Acc,Sorted,S):-insert(H,P,Acc,NAcc,NSAcc),i_sort(T,Ps,NAcc,Sorted,NSAcc).

insert(X,A,[Y|T],[Y|NT],[S|Ss]):-X>Y,insert(X,A,T,NT,Ss).
insert(X,A,[Y|T],[X,Y|T],S):-X=<Y.
insert(X,A,[],[X],[A]).*/




/*insert_sort(List,L,Sorted,S):-i_sort(List,L,[],Sorted,S).

i_sort([],[],Acc,Acc,Acc).
i_sort([H|T],[L|Ls],Acc,Sorted,S):-insert(H,L,Acc,NAcc,NSAcc),i_sort(T,Ls,NAcc,Sorted,NSAcc).

insert(X,A,[Y|T],[Y|NT],[S|Ss]):-X>Y,insert(X,A,T,NT,Ns).
insert(X,A,[Y|T],[X,Y|T],S):-X=<Y.
insert(X,A,[],[X],[A]).*/

/*ordena_lista([],[]).
ordena_lista([HI,R,HD],[R|Rs]) :-
    ordena_lista(HI,HIs),
    ordena_lista(HD,HDs),
    append(HIs,HDs,Rs).*/
