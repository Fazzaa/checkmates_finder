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

applicabile(su, Torre, pos(Riga, Colonna), N) :-
    Riga < 8,
    torre(Torre),
    occupata(pos(Riga, Colonna), Torre),
    continua(Torre, pos(Riga, Colonna), N).

continua(_, pos(_, _), N) :-
    N = 0, !. % cut per bloccare esecuzione di applicabile successivo quando questo restituisce true.

continua(Torre, pos(Riga, Colonna), N) :-
    % N > 0, % posso muovermi al massimo di N volte
    Riga < 8,
    RigaSopra is Riga + 1,
    \+ occupata(pos(RigaSopra, Colonna), _),
    NNuovo is N-1,
    write('Posizione Controllata Attuale '), write(Riga), write('-'), write(Colonna), write('\n'),
    continua(Torre, pos(RigaSopra, Colonna), NNuovo).

trasforma(mangiadx, Pedone, pos(Riga, Colonna)) :-
    RigaSopra is Riga + 1,
    ColonnaDx is Colonna + 1,
    retract(occupata(pos(RigaSopra, ColonnaDx), _)),
    assert(occupata(pos(RigaSopra, ColonnaDx), Pedone)),
    retract(occupata(pos(Riga, Colonna), Pedone)).

trasforma(mangiasx, Pedone, pos(Riga, Colonna)) :-
    RigaSopra is Riga + 1,
    ColonnaSx is Colonna - 1,
    retract(occupata(pos(RigaSopra, ColonnaSx), _)),
    assert(occupata(pos(RigaSopra, ColonnaSx), Pedone)),
    retract(occupata(pos(Riga, Colonna), Pedone)).

trasforma(su, _, pos(_, _), N) :-
    N = 0, !.

trasforma(su ,Torre, pos(Riga, Colonna), N) :-
    RigaSopra is Riga+1,
    assert(occupata(pos(RigaSopra, Colonna), Torre)),
    retract(occupata(pos(Riga, Colonna), Torre)),
    NNuovo is N - 1,
    trasforma(su, Torre, pos(RigaSopra, Colonna), NNuovo).
