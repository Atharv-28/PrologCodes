% 11. Water Jug problem (4-litre and 3-litre jugs; obtain 2 litres).
% Run: swipl -q -s 11_water_jug.pl -g main -t halt
% State is state(AmountIn4LJug, AmountIn3LJug).
% Query manually: ?- water_jug_solution(Path).

capacity(4, 3).

goal(state(2, _)).

% Possible actions
move(state(X,Y), state(4,Y)) :- X < 4.          % Fill 4L jug
move(state(X,Y), state(X,3)) :- Y < 3.          % Fill 3L jug
move(state(X,Y), state(0,Y)) :- X > 0.          % Empty 4L jug
move(state(X,Y), state(X,0)) :- Y > 0.          % Empty 3L jug
move(state(X,Y), state(X1,Y1)) :-               % Pour 4L into 3L
    X > 0, Y < 3, T is min(X, 3-Y),
    X1 is X-T, Y1 is Y+T.
move(state(X,Y), state(X1,Y1)) :-               % Pour 3L into 4L
    Y > 0, X < 4, T is min(Y, 4-X),
    X1 is X+T, Y1 is Y-T.

water_jug_solution(Path) :-
    bfs([[state(0,0)]], [], RevPath),
    reverse(RevPath, Path).

bfs([[S|Path]|_], _, [S|Path]) :- goal(S), !.
bfs([[S|Path]|Queue], Visited, Solution) :-
    findall([Next,S|Path],
        (move(S,Next), \+ member(Next, [S|Visited])),
        NewPaths),
    append(Queue, NewPaths, Queue1),
    bfs(Queue1, [S|Visited], Solution).

main :-
    water_jug_solution(Path),
    format('Water jug solution (4L, 3L):~n'),
    print_states(Path).

print_states([]).
print_states([S|T]) :-
    format('~w~n', [S]),
    print_states(T).
