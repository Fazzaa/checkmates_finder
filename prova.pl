prova(pos(Riga, Colonna), Torre, N) :-
    occupata(pos(Riga, Colonna), Torre),
    applicabile(continua, Torre, pos(Riga, Colonna), N),
    trasforma(continua, Torre, pos(Riga, Colonna), N).
 
