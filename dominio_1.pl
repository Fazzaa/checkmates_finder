num_colonne(8).
num_righe(8).

pedone(pedone_nero_1).
pedone(pedone_nero_2).
pedone(pedone_nero_4).
pedone(pedone_bianco).
re(re_nero).
re(re_bianco).
torre(torre_bianco).


bianco(pedone_bianco).
bianco(torre_bianco).
bianco(re_bianco).


nero(re_nero).
nero(pedone_nero_1).
nero(pedone_nero_2).
nero(pedone_nero_4).

initialize :- 
    retractall(occupata(_,_)),
    assert(occupata(pos(8,7), re_nero)),
    assert(occupata(pos(7,6), pedone_nero_1)),
    assert(occupata(pos(6,7), pedone_nero_2)),
    assert(occupata(pos(5,3), pedone_nero_4)),
    assert(occupata(pos(6,6), pedone_bianco)),
    assert(occupata(pos(1,1), torre_bianco)),
    assert(occupata(pos(1,5), re_bianco)).
