applicabile(su, Pedone, pos(Riga, Colonna)) :-
    Riga < 8,
    bianco(Pedone),
    RigaSopra is Riga + 1,
    occupata(pos(Riga, Colonna), Pedone),
    \+ occupata(pos(RigaSopra, Colonna), _).

trasforma(su, Pedone, pos(Riga, Colonna)) :-
    RigaSopra is Riga + 1,
    assert(occupata(pos(RigaSopra, Colonna), Pedone)),
    retract(occupata(pos(Riga, Colonna), Pedone)).
