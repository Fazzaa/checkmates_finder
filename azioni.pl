applicabile(su, Pedone, pos(Riga, Colonna)) :-
    Riga < 8,
    bianco(Pedone),
    RigaSopra is Riga + 1,
    \+ occupata(pos(RigaSopra, Colonna), _).

trasforma(su, Pedone, pos(Riga, Colonna), pos(RigaSopra, Colonna)):-
    RigaSopra is Riga + 1.