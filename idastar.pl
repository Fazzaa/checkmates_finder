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
    write(AzBianco),write("---"), write(PezzoBianco),write("---"), write(N), write("\n"), !. % usa la prima mossa trovata che dà scacco
    
prova_nero(N) :-
    risolvi_nero(N).

prova_nero(N) :-
    NNuovo is N+1,
    NNuovo < 2,
    prova_nero(NNuovo).

prova_nero(_) :-
    write("Scaccomatto!").

risolvi_nero(N) :-
    nero(PezzoNero),
    re(PezzoNero),
    occupata(pos(XNero,YNero), PezzoNero),
    applicabile(AzNero, PezzoNero, pos(XNero,YNero), N), %pezzoBianco
    trasforma(AzNero, PezzoNero, pos(XNero,YNero), N),
    write(AzNero),write("---"), write(N), write("---"), write("no check motherfuckers"), write("\n").
