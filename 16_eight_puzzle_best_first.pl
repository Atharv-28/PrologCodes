% 16. Solve the 8-Puzzle using Best First Search (Manhattan distance).
% Run: swipl -q -s 16_eight_puzzle_best_first.pl -g main -t halt
% 0 represents the blank. This example starts one move from the goal.
% Query manually: ?- solve_puzzle([1,2,3,4,5,6,7,0,8], Path).

goal_state([1,2,3,4,5,6,7,8,0]).

heuristic(State, H) :-
    findall(D,
        (nth1(Pos, State, Tile), Tile =\\= 0,
         GoalPos is Tile,
         row_col(Pos, R,C), row_col(GoalPos, GR,GC),
         D is abs(R-GR)+abs(C-GC)),
        Ds),
    sum_list(Ds,H).

row_col(Pos,R,C) :-
    R is (Pos-1)//3,
    C is (Pos-1) mod 3.

swap_positions(List, I, J, Result) :-
    nth1(I,List,A), nth1(J,List,B),
    set_nth(List,I,B,Tmp),
    set_nth(Tmp,J,A,Result).

set_nth([_|T],1,X,[X|T]) :- !.
set_nth([H|T],N,X,[H|R]) :- N1 is N-1, set_nth(T,N1,X,R).

puzzle_move(State, Next) :-
    nth1(Blank, State, 0),
    (Blank > 3, Up is Blank-3 ; fail),
    swap_positions(State,Blank,Up,Next).
puzzle_move(State, Next) :-
    nth1(Blank, State, 0),
    (Blank =< 6, Down is Blank+3),
    swap_positions(State,Blank,Down,Next).
puzzle_move(State, Next) :-
    nth1(Blank, State, 0),
    (Col is (Blank-1) mod 3, Col > 0, Left is Blank-1),
    swap_positions(State,Blank,Left,Next).
puzzle_move(State, Next) :-
    nth1(Blank, State, 0),
    (Col is (Blank-1) mod 3, Col < 2, Right is Blank+1),
    swap_positions(State,Blank,Right,Next).

solve_puzzle(Start, Path) :-
    best_puzzle([[Start]], [], RevPath),
    reverse(RevPath, Path).

best_puzzle([[State|Rest]|_], _, [State|Rest]) :-
    goal_state(State), !.
best_puzzle([[State|Rest]|Open], Closed, Path) :-
    findall(H-[Next,State|Rest],
        (puzzle_move(State,Next),
         \\+ member(Next,[State|Rest]),
         \\+ member(Next,Closed),
         heuristic(Next,H)),
        Candidates),
    keysort(Candidates, Sorted),
    pairs_values(Sorted, NewPaths),
    append(Open,NewPaths,Open1),
    sort_puzzle_open(Open1,Open2),
    best_puzzle(Open2,[State|Closed],Path).

sort_puzzle_open(Paths,Sorted) :-
    findall(H-P,(member(P,Paths),P=[S|_],heuristic(S,H)),Pairs),
    keysort(Pairs,Ordered), pairs_values(Ordered,Sorted).

main :-
    Start = [1,2,3,4,5,6,7,0,8],
    solve_puzzle(Start, Path),
    format('8-Puzzle solution states:~n'),
    print_puzzle_path(Path).

print_puzzle_path([]).
print_puzzle_path([S|T]) :-
    format('~w~n', [S]),
    print_puzzle_path(T).
