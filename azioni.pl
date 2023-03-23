%* Pedone Bianco
applicabile(su, Pedone, pos(Riga, Colonna), N) :-
    pedone(Pedone),
    N=1,
    Riga < 8,
    RigaSopra is Riga + 1,
    \+ occupata(pos(RigaSopra, Colonna), _).

applicabile(mangiadx, Pedone, pos(Riga, Colonna),N) :-
    pedone(Pedone),
    N=1,
    Riga < 8,
    RigaSopra is Riga + 1,
    ColonnaDx is Colonna + 1,
    nero(X),
    occupata(pos(RigaSopra, ColonnaDx), X).

applicabile(mangiasx, Pedone, pos(Riga, Colonna), N) :-
    pedone(Pedone),
    N=1,
    Riga < 8,
    RigaSopra is Riga + 1,
    ColonnaSx is Colonna - 1,
    nero(X),
    occupata(pos(RigaSopra, ColonnaSx), X).

%* Re Nero
applicabile(su, Re, pos(Riga, Colonna), N) :-
    re(Re),
    nero(Re),
    N=1,
    Riga < 8,
    RigaSopra is Riga + 1,
    no_check(pos(RigaSopra, Colonna)),
    occupata(pos(Riga, Colonna), Re),
    \+ occupata(pos(RigaSopra, Colonna), _).

applicabile(giu, Re, pos(Riga, Colonna), N) :-
    re(Re),
    nero(Re),
    N=1, 
    Riga > 1,
    RigaSotto is Riga - 1,
    no_check(pos(RigaSotto, Colonna)),
    occupata(pos(Riga, Colonna), Re),
    \+ occupata(pos(RigaSotto, Colonna), _).

applicabile(dx, Re, pos(Riga, Colonna), N) :-
    re(Re),
    nero(Re),
    N=1,
    Colonna < 8,
    ColonnaDestra is Colonna + 1,
    no_check(pos(Riga, ColonnaDestra)),
    occupata(pos(Riga, Colonna), Re),
    \+ occupata(pos(Riga, ColonnaDestra), _).

applicabile(sx, Re, pos(Riga, Colonna), N) :-
    re(Re),
    nero(Re),
    N=1,
    Colonna > 1,
    ColonnaSinistra is Colonna - 1,
    no_check(pos(Riga, ColonnaSinistra)),
    occupata(pos(Riga, Colonna), Re),
    \+ occupata(pos(Riga, ColonnaSinistra), _).

%* Torre
%Controllo se la torre può spostarsi a destra di N caselle, utilizzo 
%il metodo continua_riga per controllare ricorsivamente se le righe sono occupate
applicabile(su, Torre, pos(Riga, Colonna), N) :-
    torre(Torre),
    Riga < 8,
    continua_riga(Torre, pos(Riga, Colonna), N).

%Controllo se la torre può spostarsi a destra di N caselle, utilizzo 
%il metodo continua_colonna_dx per controllare ricorsivamente se le colonne sono occupate
applicabile(dx, Torre, pos(Riga, Colonna), N) :-
    torre(Torre),
    Colonna < 8,
    continua_colonna_dx(Torre, pos(Riga, Colonna), N).

%Esattamente come sopra, solo che controllo a sx. Mi disturba avere un metodo
%continua_colonna diverso, ma per ora mi è sembrato necessario%
applicabile(sx, Torre, pos(Riga, Colonna), N) :-
    torre(Torre),
    Colonna > 1 ,
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

%* Pedone
trasforma(mangiadx, Pedone, pos(Riga, Colonna),N) :-
    pedone(Pedone),
    N=1,
    RigaSopra is Riga + N,
    ColonnaDx is Colonna + N,
    retract(occupata(pos(RigaSopra, ColonnaDx), _)),
    assert(occupata(pos(RigaSopra, ColonnaDx), Pedone)),
    retract(occupata(pos(Riga, Colonna), Pedone)).

trasforma(mangiasx, Pedone, pos(Riga, Colonna),N) :-
    pedone(Pedone),
    N=1,
    RigaSopra is Riga + N,
    ColonnaSx is Colonna - N,
    retract(occupata(pos(RigaSopra, ColonnaSx), _)),
    assert(occupata(pos(RigaSopra, ColonnaSx), Pedone)),
    retract(occupata(pos(Riga, Colonna), Pedone)).

trasforma(su, Pedone, pos(Riga, Colonna),N) :-
    pedone(Pedone),
    N=1,
    RigaSopra is Riga + 1,
    retract(occupata(pos(Riga, Colonna), Pedone)),
    assert(occupata(pos(RigaSopra, Colonna), Pedone)).

%* Torre
%Movimento in su di N caselle
trasforma(su ,Torre, pos(Riga, Colonna), N) :-
    torre(Torre),
    RigaSopra is Riga+N,
    assert(occupata(pos(RigaSopra, Colonna), Torre)),
    retract(occupata(pos(Riga, Colonna), Torre)).

%Movimento a destra di N caselle
trasforma(dx ,Torre, pos(Riga, Colonna), N) :-
    torre(Torre),
    ColonnaDx is Colonna+N,
    assert(occupata(pos(Riga, ColonnaDx), Torre)),
    retract(occupata(pos(Riga, Colonna), Torre)).    

%* Re Nero
trasforma(su, Re, pos(Riga, Colonna), _) :-
    re(Re),
    nero(Re),
    RigaSopra is Riga + 1,
    retract(occupata(pos(Riga, Colonna), Re)),
    assert(occupata(pos(RigaSopra, Colonna), Re)).

trasforma(giu, Re, pos(Riga, Colonna), _) :-
    re(Re),
    nero(Re),
    RigaSotto is Riga - 1,
    retract(occupata(pos(Riga, Colonna), Re)),
    assert(occupata(pos(RigaSotto, Colonna), Re)).

trasforma(dx, Re, pos(Riga, Colonna), _) :-
    re(Re),
    nero(Re),
    ColonnaDestra is Colonna + 1,
    retract(occupata(pos(Riga, Colonna), Re)),
    assert(occupata(pos(Riga, ColonnaDestra), Re)).

trasforma(sx, Re, pos(Riga, Colonna), _) :-
    re(Re),
    nero(Re),
    ColonnaSinistra is Colonna - 1,
    retract(occupata(pos(Riga, Colonna), Re)),
    assert(occupata(pos(Riga, ColonnaSinistra), Re)).
    
