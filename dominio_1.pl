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


bianco(pedone_bianco_1).
bianco(pedone_bianco_2).
bianco(torre_bianco).
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
    assert(occupata(pos(1,5), re_bianco)).


%checkmate(pos(1,1), torreBianco)%
checkmate(X,_) :- 
    check, 
    \+mangiabile(X), 
    \+move(reNero), 
    \+opposizione().

check_pawn_right :-
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    RigaPedone is RigaRe-1,
    ColonnaPedone is ColonnaRe +1,
    pedone(Pedone),
    bianco(Pedone),
    occupata(pos(RigaPedone, ColonnaPedone), Pedone).

check_pawn_left :-
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    RigaPedone is RigaRe-1,
    ColonnaPedone is ColonnaRe -1,
    pedone(Pedone),
    bianco(Pedone),
    occupata(pos(RigaPedone, ColonnaPedone), Pedone).


check_rook_row :-
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    torre(Torre),
    bianco(Torre),
    occupata(pos(RigaRe, ColonnaTorre), Torre),
    N is (ColonnaRe-1)-ColonnaTorre,
    applicabile(dx, Torre, pos(RigaRe, ColonnaTorre), N).
    %ColonnaAfterTorre is ColonnaTorre + 1,
    %ColonnaBeforeRe is ColonnaRe - 1,
    %riga_occupata(pos(RigaRe, ColonnaAfterTorre), pos(RigaRe, ColonnaBeforeRe)).    

check_rook_col :-
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    torre(Torre),
    bianco(Torre),
    occupata(pos(RigaTorre, ColonnaRe), Torre),
    N is (RigaRe-1)-RigaTorre,
    applicabile(su, Torre, pos(RigaTorre, ColonnaRe), N).
    %RigaAfterTorre is RigaTorre + 1,
    %RigaBeforeRe is RigaRe - 1,
    %colonna_occupata(pos(RigaAfterTorre, ColonnaRe), pos(RigaBeforeRe, ColonnaRe)).