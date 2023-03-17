num_colonne(8).
num_righe(8).

pedone(pedone_nero_1).
pedone(pedone_nero_2).
pedone(pedone_nero_3).
pedone(pedone_bianco_1).
re(re_nero).
re(re_bianco).
torre(torre_bianco).


bianco(pedone_bianco_1).
bianco(torre_bianco).
bianco(re_bianco).

nero(re_nero).
nero(pedone_nero_1).
nero(pedone_nero_2).
nero(pedone_nero_3).


occupata(pos(8,7), re_nero).
occupata(pos(7,6), pedone_nero_1).
occupata(pos(7,7), pedone_nero_2).
occupata(pos(7,8), pedone_nero_3).
occupata(pos(1,1), pedone_bianco_1).

occupata(pos(1,5), torre_bianco).
occupata(pos(1,6), re_bianco).

%checkmate(pos(8,5), torreBianco)%
checkmate(X,Y) :- 
    check(X,Y), 
    \+mangiabile(X), 
    \+move(reNero), 
    \+opposizione().
