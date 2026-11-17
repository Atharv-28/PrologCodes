% 17. Robot traversal using Means-Ends Analysis (MEA).
% Run: swipl -q -s 17_robot_means_ends_analysis.pl -g main -t halt
% A small room graph; the robot moves from room_a to room_d.

connected(room_a, room_b).
connected(room_b, room_c).
connected(room_c, room_d).
connected(room_a, room_e).
connected(room_e, room_d).

% Treat corridors as bidirectional.
adjacent(X,Y) :- connected(X,Y).
adjacent(X,Y) :- connected(Y,X).

mea(Start, Goal, Path) :-
    traverse(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

traverse(Goal, Goal, Visited, Visited) :- !.
traverse(Current, Goal, Visited, Path) :-
    adjacent(Current, Next),
    \\+ member(Next, Visited),
    traverse(Next, Goal, [Next|Visited], Path).

main :-
    mea(room_a, room_d, Path),
    format('Robot traversal plan: ~w~n', [Path]).
