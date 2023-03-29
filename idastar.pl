gioca(N,M):-
    prova_bianco(N),
    prova_nero(M).

prova_bianco(N):-
    risolvi_bianco(N).

prova_bianco(N):-
    NNuovo is N+1,
    NNuovo<8,
    prova_bianco(NNuovo).

risolvi_bianco(N):-
    bianco(PezzoBianco),
    occupata(pos(XBianco,YBianco), PezzoBianco),
    applicabile(AzBianco, PezzoBianco, pos(XBianco,YBianco), N),
    check(PezzoBianco, pos(XBianco,YBianco), N),
    trasforma(AzBianco, PezzoBianco, pos(XBianco,YBianco), N),
    tell('game.txt'),
    write((XBianco, YBianco)),write("-"), write(AzBianco), write("-"), write(N),write("\n"),!.

prova_nero(N) :-
    risolvi_nero(N),
    gioca(1,1).

prova_nero(N) :-
    NNuovo is N+1,
    NNuovo < 2,
    prova_nero(NNuovo).

prova_nero(_) :-
    write("Scaccomatto!"),
    told.

risolvi_nero(N) :-
    nero(PezzoNero),
    re(PezzoNero),
    occupata(pos(XNero,YNero), PezzoNero),
    applicabile(AzNero, PezzoNero, pos(XNero,YNero), N), %pezzoBianco
    trasforma(AzNero, PezzoNero, pos(XNero,YNero), N),
    tell('game.txt'),
    write((XNero, YNero)),write("-"), write(AzNero), write("-"), write(N), write("\n"),!.