prova(N):-
    risolvi(N).

prova(N):-
    NNuovo is N+1,
    NNuovo<8,
    prova(NNuovo).

risolvi(N):-
    initialize,
    bianco(Pezzo),
    occupata(pos(X,Y), Pezzo),
    applicabile(Az, Pezzo, pos(X,Y), N),
    trasforma(Az, Pezzo, pos(X,Y), N),
    check(Pezzo),
    %length(Az, L),
    %write(L)
    write(Az),write("---"), write(Pezzo),write("---"), write(N), write("\n"),
    read(String),
    String.

