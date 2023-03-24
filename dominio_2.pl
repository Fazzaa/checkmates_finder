num_colonne(8).
num_righe(8).

pedone(pedone_nero_1).
pedone(pedone_nero_2).
pedone(pedone_nero_3).
pedone(pedone_bianco_1).
pedone(pedone_bianco_2).
re(re_nero).
re(re_bianco).
torre(torre_bianco).


bianco(pedone_bianco_1).
bianco(pedone_bianco_2).
bianco(torre_bianco).
bianco(re_bianco).


nero(re_nero).
nero(pedone_nero_1).
nero(pedone_nero_2).
nero(pedone_nero_3).

initialize :- 
    retractall(occupata(_,_)),
    assert(occupata(pos(8,7), re_nero)),
    assert(occupata(pos(7,6), pedone_nero_1)),
    assert(occupata(pos(6,7), pedone_nero_2)),
    assert(occupata(pos(7,8), pedone_nero_3)),
    assert(occupata(pos(5,8), pedone_bianco_1)),
    assert(occupata(pos(5,7), pedone_bianco_2)),
    assert(occupata(pos(1,1), torre_bianco)),
    assert(occupata(pos(1,5), re_bianco)).
