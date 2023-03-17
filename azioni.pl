applicabile(su, Pedone, pos(Riga, Colonna)) :-
    Riga < 8,
    bianco(Pedone),
    RigaSopra is Riga + 1,
    \+ occupata(_, pos(RigaSopra, Colonna)).

trasforma(su, Pedone, pos(Riga, Colonna), pos(RigaSopra, Colonna)):-
    RigaSopra is Riga + 1.