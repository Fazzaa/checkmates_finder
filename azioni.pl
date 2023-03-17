applicabile(su, Pedone, pos(Riga, Colonna)) :-
    Riga < 8,
    bianco(Pedone),
    RigaSopra is Riga + 1,
    occupata(pos(Riga, Colonna), Pedone),
    \+ occupata(pos(RigaSopra, Colonna), _).

applicabile(mangiadx, Pedone, pos(Riga, Colonna)) :-
    Riga < 8,
    bianco(Pedone),
    occupata(pos(Riga, Colonna), Pedone),
    RigaSopra is Riga + 1,
    ColonnaDx is Colonna + 1,
    nero(X),
    occupata(pos(RigaSopra, ColonnaDx), X).

applicabile(mangiasx, Pedone, pos(Riga, Colonna)) :-
    Riga < 8,
    bianco(Pedone),
    occupata(pos(Riga, Colonna), Pedone),
    RigaSopra is Riga + 1,
    ColonnaSx is Colonna - 1,
    nero(X),
    occupata(pos(RigaSopra, ColonnaSx), X).

trasforma(su, Pedone, pos(Riga, Colonna)) :-
    RigaSopra is Riga + 1,
    assert(occupata(pos(RigaSopra, Colonna), Pedone)),
    retract(occupata(pos(Riga, Colonna), Pedone)).

trasforma(mangiadx, Pedone, pos(Riga, Colonna)) :-
    RigaSopra is Riga + 1,
    ColonnaDx is Colonna + 1,
    retract(occupata(pos(RigaSopra, ColonnaDx), X)),
    assert(occupata(pos(RigaSopra, ColonnaDx), Pedone)),
    retract(occupata(pos(Riga, Colonna), Pedone)).

trasforma(mangiasx, Pedone, pos(Riga, Colonna)) :-
    RigaSopra is Riga + 1,
    ColonnaSx is Colonna - 1,
    retract(occupata(pos(RigaSopra, ColonnaSx), X)),
    assert(occupata(pos(RigaSopra, ColonnaSx), Pedone)),
    retract(occupata(pos(Riga, Colonna), Pedone)).