applicabile(su, Pedone, pos(Riga, Colonna), N) :-
    N=1,
    Riga < 8,
    pedone(Pedone),
    bianco(Pedone),
    RigaSopra is Riga + 1,
    occupata(pos(Riga, Colonna), Pedone),
    \+ occupata(pos(RigaSopra, Colonna), _).

applicabile(mangiadx, Pedone, pos(Riga, Colonna),N) :-
    N=1,
    Riga < 8,
    pedone(Pedone),
    bianco(Pedone),
    occupata(pos(Riga, Colonna), Pedone),
    RigaSopra is Riga + 1,
    ColonnaDx is Colonna + 1,
    nero(X),
    occupata(pos(RigaSopra, ColonnaDx), X).

applicabile(mangiasx, Pedone, pos(Riga, Colonna), N) :-
    N=1,
    Riga < 8,
    pedone(Pedone),
    bianco(Pedone),
    occupata(pos(Riga, Colonna), Pedone),
    RigaSopra is Riga + 1,
    ColonnaSx is Colonna - 1,
    nero(X),
    occupata(pos(RigaSopra, ColonnaSx), X).

%Controllo se la torre può spostarsi a destra di N caselle, utilizzo 
%il metodo continua_riga per controllare ricorsivamente se le righe sono occupate
applicabile(su, Torre, pos(Riga, Colonna), N) :-
    Riga < 8,
    torre(Torre),
    occupata(pos(Riga, Colonna), Torre),
    continua_riga(Torre, pos(Riga, Colonna), N).

%Controllo se la torre può spostarsi a destra di N caselle, utilizzo 
%il metodo continua_colonna_dx per controllare ricorsivamente se le colonne sono occupate
applicabile(dx, Torre, pos(Riga, Colonna), N) :-
    Colonna < 8,
    torre(Torre),
    occupata(pos(Riga, Colonna), Torre),
    continua_colonna_dx(Torre, pos(Riga, Colonna), N).

%Esattamente come sopra, solo che controllo a sx. Mi disturba avere un metodo
%continua_colonna diverso, ma per ora mi è sembrato necessario%
applicabile(sx, Torre, pos(Riga, Colonna), N) :-
    Colonna > 1 ,
    torre(Torre),
    occupata(pos(Riga, Colonna), Torre),
    continua_colonna_sx(Torre, pos(Riga, Colonna), N).

continua_colonna_sx(_, pos(_, _), N) :-
    N = 0, !.

continua_colonna_sx(Torre, pos(Riga, Colonna), N) :-
    Colonna > 1,
    ColonnaSx is Colonna - 1,
    \+ occupata(pos(Riga, ColonnaSx), _),
    NNuovo is N-1,
    continua_colonna_sx(Torre, pos(Riga, ColonnaSx), NNuovo).

continua_colonna_dx(_, pos(_, _), N) :-
    N = 0, !.

continua_colonna_dx(Torre, pos(Riga, Colonna), N) :-
    Colonna < 8,
    ColonnaDx is Colonna + 1,
    \+ occupata(pos(Riga, ColonnaDx), _),
    NNuovo is N-1,
    continua_colonna_dx(Torre, pos(Riga, ColonnaDx), NNuovo).

continua_riga(_, pos(_, _), N) :-
    N = 0, !. % cut per bloccare esecuzione di applicabile successivo quando questo restituisce true.

continua_riga(Torre, pos(Riga, Colonna), N) :-
    Riga < 8,
    RigaSopra is Riga + 1,
    \+ occupata(pos(RigaSopra, Colonna), _),
    NNuovo is N-1,
    continua_riga(Torre, pos(RigaSopra, Colonna), NNuovo).

trasforma(mangiadx, Pedone, pos(Riga, Colonna),N) :-
    pedone(Pedone),
    RigaSopra is Riga + N,
    ColonnaDx is Colonna + N,
    retract(occupata(pos(RigaSopra, ColonnaDx), _)),
    assert(occupata(pos(RigaSopra, ColonnaDx), Pedone)),
    retract(occupata(pos(Riga, Colonna), Pedone)).

trasforma(mangiasx, Pedone, pos(Riga, Colonna),N) :-
    pedone(Pedone),
    RigaSopra is Riga + N,
    ColonnaSx is Colonna - N,
    retract(occupata(pos(RigaSopra, ColonnaSx), _)),
    assert(occupata(pos(RigaSopra, ColonnaSx), Pedone)),
    retract(occupata(pos(Riga, Colonna), Pedone)).

trasforma(su, Pedone, pos(Riga, Colonna),N) :-
    pedone(Pedone),
    RigaSopra is Riga + 1,
    retract(occupata(pos(Riga, Colonna), Pedone)),
    assert(occupata(pos(RigaSopra, Colonna), Pedone)).

%*Movimento in su di N caselle%
trasforma(su ,Torre, pos(Riga, Colonna), N) :-
    torre(Torre),
    RigaSopra is Riga+N,
    assert(occupata(pos(RigaSopra, Colonna), Torre)),
    retract(occupata(pos(Riga, Colonna), Torre)).

%*Movimento a destra di N caselle
trasforma(dx ,Torre, pos(Riga, Colonna), N) :-
    torre(Torre),
    ColonnaDx is Colonna+N,
    assert(occupata(pos(Riga, ColonnaDx), Torre)),
    retract(occupata(pos(Riga, Colonna), Torre)).    

