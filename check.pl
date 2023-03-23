%checkmate(pos(1,1), torreBianco)%
checkmate(X,_) :- 
    check, 
    \+mangiabile(X), 
    \+move(reNero), 
    \+opposizione().

check(Pezzo, pos(X,Y), _):-
    pedone(Pezzo),
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    XNuovo is X+2,
    RigaRe = XNuovo,
    YConfuso is Y + 1,
    ColonnaRe = YConfuso.

check(Pezzo, pos(X,Y), _):-
    pedone(Pezzo),
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    XNuovo is X+2,
    RigaRe = XNuovo,
    YConfuso is Y -1,
    ColonnaRe = YConfuso.

check(Pezzo, pos(X,Y), N):-
    torre(Pezzo),
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    XNuovo is X + N, %sposto la torre su
    XNuovo = RigaRe,
    Diff is abs((ColonnaRe-1)-Y),
    applicabile(dx, Pezzo, pos(XNuovo, Y), Diff).

check(Pezzo, pos(X,Y), N):-
    torre(Pezzo),
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    XNuovo is X - N, %riga giù
    XNuovo = RigaRe,
    Diff is abs((ColonnaRe-1)-Y),
    applicabile(dx, Pezzo, pos(XNuovo, Y), Diff).

check(Pezzo, pos(X,Y), N):-
    torre(Pezzo),
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    YNuovo is Y + N, %muovo la torre a dx
    YNuovo = ColonnaRe,
    Diff is abs((RigaRe-1)-X),
    applicabile(su, Pezzo, pos(X, YNuovo), Diff).

check(Pezzo, pos(X,Y), N):-
    torre(Pezzo),
    occupata(pos(RigaRe, ColonnaRe), re_nero),
    YNuovo is Y - N, %muovo la torre a sx
    YNuovo=ColonnaRe,
    Diff is abs((RigaRe-1)-X),
    applicabile(su, Pezzo, pos(X, YNuovo), Diff).



no_check(pos(XRe,YRe)) :-
    torre(TB),
    bianco(TB),
    occupata(pos(XB, YB), TB),
    \+ XRe = XB,
    \+ YRe = YB,
    XPedone is XRe - 1,
    YPedoneSx is YRe - 1,
    YPedoneDx is YRe + 1,
    pedone(PB),
    bianco(PB),
    \+occupata(pos(XPedone, YPedoneSx), PB),
    \+occupata(pos(XPedone, YPedoneDx), PB).