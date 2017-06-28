/*

Realizado por: Sergio Rodriguez Calvo

?-  espejo_arbol([[[[[],1,[]],5,[]],7,[[],3,[[],4,[]]]],6,[[[],10,[]],8,[[[],9,[]],11,[[],2,[]]]]],NS).
6
8    7
11    10    3    5
2    9    4    1
NS = [6, 8, 7, 11, 10, 3, 5, 2, 9|...] .

*/

/*
    Predicado principal que recibe un Arbol binario numerico y devuelve NS como lista de nodos ordenados por niveles.
*/
espejo_arbol(ABN,NS) :- explora_hijos(ABN,N,L,0), ordena_por_niveles(L,N,LS,NS), dibuja_arbol(LS,NS,0).

/*
    Predicado que realiza la exploracion en profundidad por preorden y manteniendo el nivel en cada momento.
    Devuelve por un lado la lista de nodos y por otro los niveles. Ambas listas tienen la misma longitud, y la segunda indica el nivel
    del arbol en el que se encuentra el nodo de su misma posicion en la primera lista.
*/
explora_hijos([],[],_,_).
explora_hijos([[],R,[]],[R|Rs],[N|Ps],N).
explora_hijos([HI,R,HD],[R|Rs],[N|Ps],N) :-
    N2 is N + 1,
    explora_hijos(HI,HIs,PIs,N2),
    explora_hijos(HD,HDs,PDs,N2),
    append(HIs,HDs,Rs), % Adjunta nodo a la lista
    append(PIs,PDs,Ps). % Adjunta nivel a la lista

/*
    Algoritmo de ordenacion por inserccion adaptado para ordenar ambas listas en funcion del orden de la lista de niveles.
*/
ordena_por_niveles(List,List2,Sorted,Sorted2):-i_sort(List,List2,[],[],Sorted,Sorted2).

i_sort([],[],Acc,AccO,Acc,AccO).
i_sort([H|T],[HO|TO],Acc,AccO,Sorted,SortedO):-insert(H,HO,Acc,AccO,NAcc,NAccO),i_sort(T,TO,NAcc,NAccO,Sorted,SortedO).

% Predicado auxiliar del algoritmo de ordenacion por inserccion para insertar en el lugar adecuado de la lista.
insert(X,XO,[Y|T],[YO|TO],[Y|NT],[YO|NTO]):-X>Y,insert(X,XO,T,TO,NT,NTO).
insert(X,XO,[Y|T],[YO|TO],[X,Y|T],[XO,YO|TO]):-X=<Y.
insert(X,XO,[],[],[X],[XO]).

% Predicado que hace print del arbol por niveles.
dibuja_arbol([],[],_).
dibuja_arbol([L|Ls],[N|Ns],Actual) :- Actual == L, format("~d    ",[N]), dibuja_arbol(Ls,Ns,L).
dibuja_arbol([L|Ls],[N|Ns],Actual) :- Actual < L, format("~n",[]), format("~d    ",[N]), dibuja_arbol(Ls,Ns,L).
