% 13. Solve a maze using Depth First Search (DFS).
% Run: swipl -q -s 13_maze_dfs.pl -g main -t halt
% The maze is represented as connected cells.
% Query manually: ?- maze_path(start, goal, Path).

edge(start, a).
edge(start, b).
edge(a, c).
edge(b, d).
edge(c, goal).
edge(d, goal).

maze_path(Start, Goal, Path) :-
    dfs(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

dfs(Goal, Goal, Visited, Visited) :- !.
dfs(Current, Goal, Visited, Path) :-
    edge(Current, Next),
    \\+ member(Next, Visited),
    dfs(Next, Goal, [Next|Visited], Path).

main :-
    maze_path(start, goal, Path),
    format('DFS path from start to goal: ~w~n', [Path]).
