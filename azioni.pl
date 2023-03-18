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

applicabile(su, Torre, pos(Riga, Colonna)) :-
    Riga < 8,
    torre(Torre),
    RigaSopra is Riga + 1,
    occupata(pos(Riga, Colonna), Torre),
    \+ occupata(pos(RigaSopra, Colonna), _).

applicabile(continua, Torre, pos(Riga, Colonna), N) :-
    N > 0, % posso muovermi al massimo di N volte
    Riga < 8,
    RigaSopra is Riga + 1,
    \+ occupata(pos(RigaSopra, Colonna), Torre),
    NNuovo is N-1,
    write('Posizione Controllata Attuale '), write(Riga), write('-'), write(Colonna), write('\n'),
    applicabile(continua, Torre, pos(RigaSopra, Colonna), NNuovo).

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