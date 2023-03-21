prova_bianco(N):-
    risolvi_bianco(N).

prova_bianco(N):-
    NNuovo is N+1,
    NNuovo<8,
    prova_bianco(NNuovo).

risolvi_bianco(N):-
    initialize,
    bianco(Pezzo),
    occupata(pos(X,Y), Pezzo),
    applicabile(Az, Pezzo, pos(X,Y), N),
    trasforma(Az, Pezzo, pos(X,Y), N),
    check(Pezzo),
    %length(Az, L),
    %write(L)
    write(Az),write("---"), write(Pezzo),write("---"), write(N), write("\n"), !. % usa la prima mossa trovata che dà scacco
    %read(String),
    %String.

prova_nero(N) :-
    risolvi_nero(N).

prova_nero(N) :-
    NNuovo is N+1,
    NNuovo < 2,
    prova_nero(NNuovo).

risolvi_nero(N) :-
    % problema, qui non si può fare l'initialize ogni volta, pena vanificare tutto ciò che ha fatto il bianco per scegliere la mossa. Si potrebbero salvare le mosse del bianco in una lista e fare una "update" per il nero che legge dalla lista e ricompone scacchiera dal punto in cui l'ha lasciata il bianco
    nero(Pezzo),
    re(Pezzo),
    occupata(pos(X,Y), Pezzo),
    applicabile(Az, Pezzo, pos(X,Y), N),
    trasforma(Az, Pezzo, pos(X,Y), N),
    \+check(torre_bianco),
    write(Az),write("---"), write(N), write("---"), write("no more check motherfuckers").
