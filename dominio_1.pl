num_colonne(8).
num_righe(8).

pedone(pedone_nero_1).
pedone(pedone_nero_2).
pedone(pedone_nero_3).
pedone(pedone_nero_4).
pedone(pedone_bianco_1).
pedone(pedone_bianco_2).
re(re_nero).
re(re_bianco).
torre(torre_bianco).
torre(torre_bianco_2).


bianco(pedone_bianco_1).
bianco(pedone_bianco_2).
bianco(torre_bianco).
bianco(torre_bianco_2).
bianco(re_bianco).


nero(re_nero).
nero(pedone_nero_1).
nero(pedone_nero_2).
nero(pedone_nero_3).
nero(pedone_nero_4).

initialize :- 
    retractall(occupata(_,_)),
    assert(occupata(pos(8,7), re_nero)),
    assert(occupata(pos(7,6), pedone_nero_1)),
    assert(occupata(pos(7,7), pedone_nero_2)),
    assert(occupata(pos(7,8), pedone_nero_3)),
    assert(occupata(pos(5,3), pedone_nero_4)),
    assert(occupata(pos(6,8), pedone_bianco_1)),
    assert(occupata(pos(2,5), pedone_bianco_2)),
    assert(occupata(pos(1,1), torre_bianco)),
    assert(occupata(pos(1,2), torre_bianco_2)),
    assert(occupata(pos(1,5), re_bianco)).


%checkmate(pos(1,1), torreBianco)%
checkmate(X,_) :- 
    check, 
    \+mangiabile(X), 
    \+move(reNero), 
    \+opposizione().

check(Pezzo):-
    pedone(Pezzo),
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    RigaPedone is RigaRe-1,
    ColonnaPedone is ColonnaRe +1,
    occupata(pos(RigaPedone, ColonnaPedone), Pezzo).

check(Pezzo):-
    pedone(Pezzo),
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    RigaPedone is RigaRe-1,
    ColonnaPedone is ColonnaRe -1,
    occupata(pos(RigaPedone, ColonnaPedone), Pezzo).


check(Pezzo):-
    torre(Pezzo),
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    occupata(pos(RigaRe, ColonnaTorre), Pezzo),
    N is (ColonnaRe-1)-ColonnaTorre,
    applicabile(dx, Pezzo, pos(RigaRe, ColonnaTorre), N).

check(Pezzo) :-
    torre(Pezzo),
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    occupata(pos(RigaTorre, ColonnaRe), Pezzo),
    N is (RigaRe-1)-RigaTorre,
    applicabile(su, Pezzo, pos(RigaTorre, ColonnaRe), N).