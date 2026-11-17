% 14. Find a path between two nodes using Breadth First Search (BFS).
% Run: swipl -q -s 14_breadth_first_search.pl -g main -t halt
% Query manually: ?- bfs_path(a, f, Path).

edge(a,b).
edge(a,c).
edge(b,d).
edge(c,e).
edge(d,f).
edge(e,f).

bfs_path(Start, Goal, Path) :-
    bfs([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

bfs([[Goal|Rest]|_], Goal, [Goal|Rest]) :- !.
bfs([[Node|Rest]|Queue], Goal, Path) :-
    findall([Next,Node|Rest],
        (edge(Node,Next), \\+ member(Next,[Node|Rest])),
        NewPaths),
    append(Queue, NewPaths, Queue1),
    bfs(Queue1, Goal, Path).

main :-
    bfs_path(a, f, Path),
    format('Shortest path from a to f: ~w~n', [Path]).
