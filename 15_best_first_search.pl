% 15. Implement Greedy Best First Search on a simple graph.
% Run: swipl -q -s 15_best_first_search.pl -g main -t halt
% Lower heuristic values indicate that a node is closer to the goal.

edge(a,b). edge(a,c).
edge(b,d). edge(b,e).
edge(c,f). edge(d,g).
edge(e,g). edge(f,g).

heuristic(a,6). heuristic(b,4). heuristic(c,3).
heuristic(d,2). heuristic(e,1). heuristic(f,2).
heuristic(g,0).

best_first(Start, Goal, Path) :-
    best_loop([[Start]], Goal, RevPath),
    reverse(RevPath, Path).

best_loop([[Goal|Rest]|_], Goal, [Goal|Rest]) :- !.
best_loop([ [Node|Rest] | Open], Goal, Path) :-
    findall(H-[Next,Node|Rest],
        (edge(Node,Next), \\+ member(Next,[Node|Rest]), heuristic(Next,H)),
        Candidates),
    keysort(Candidates, Sorted),
    pairs_values(Sorted, NewPaths),
    append(Open, NewPaths, Open1),
    sort_open(Open1, Open2),
    best_loop(Open2, Goal, Path).

sort_open(Paths, Sorted) :-
    findall(H-Path,
        (member(Path,Paths), Path=[Node|_], heuristic(Node,H)),
        Pairs),
    keysort(Pairs, Ordered),
    pairs_values(Ordered, Sorted).

main :-
    best_first(a, g, Path),
    format('Best First Search path from a to g: ~w~n', [Path]).
