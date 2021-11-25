knightmove([X, Y], [A, B]) :-
    X + 2 < 8, Y + 1 < 8, A is X + 2, B is Y + 1;
    X + 2 < 8, Y - 1 >= 0, A is X + 2, B is Y - 1;
    X - 2 >= 0, Y + 1 < 8, A is X - 2, B is Y + 1;
    X - 2 >= 0, Y - 1 >= 0, A is X - 2, B is Y - 1;
    X + 1 < 8, Y + 2 < 8, A is X + 1, B is Y + 2;
    X + 1 < 8, Y - 2 >= 0, A is X + 1, B is Y - 2;
    X - 1 >= 0, Y + 2 < 8, A is X - 1, B is Y + 2;
    X - 1 >= 0, Y - 2 >= 0, A is X - 1, B is Y - 2.

% Start = [X, Y], End = [I, J], List = Path
knightpath([X, Y], [I, J]) :- 
    between(0, 7, X),
    between(0, 7, Y),
    between(0, 7, I),
    between(0, 7, J),
    knightpath([X, Y], [I, J], [[X, Y]]).

knightpath(A, B, Path) :- 
    A == B, 
    !, print(Path), nl.

knightpath([X, Y], [I, J], Path) :-
    knightmove([X, Y], [A, B]),
    not(member([A, B], Path)),
    knightpath([A, B], [I, J], [[A, B]|Path]).

%need to copy & paste Path from knightpath to use knightpassthru

knightpassthru(Path, Sq, N) :-
    member(Sq, Path),
    nth0(N, Path, Sq).

findlen([], Count) :-
    Count is 0.

findlen([_|Tail],Count) :-
    findlen(Tail, Prev),
    Count is Prev + 1.

%need to copy & paste Path from knightpath to use knightjourney

knightjourney(L, Path) :-
	findlen(Path, Count),
    Count = L.
