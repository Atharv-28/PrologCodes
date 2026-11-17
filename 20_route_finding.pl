% 20. Find a route between cities.
% Run: swipl -q -s 20_route_finding.pl -g main -t halt
% Query manually: ?- route(mumbai, pune, Path).

road(mumbai, pune).
road(pune, kolhapur).
road(kolhapur, belgaum).
road(mumbai, nashik).
road(nashik, pune).

connected(X,Y) :- road(X,Y).
connected(X,Y) :- road(Y,X).

route(Start, Goal, Path) :-
    route_dfs(Start, Goal, [Start], RevPath),
    reverse(RevPath, Path).

route_dfs(Goal, Goal, Visited, Visited) :- !.
route_dfs(Current, Goal, Visited, Path) :-
    connected(Current,Next),
    \\+ member(Next,Visited),
    route_dfs(Next,Goal,[Next|Visited],Path).

main :-
    route(mumbai, belgaum, Path),
    format('Route from Mumbai to Belgaum: ~w~n', [Path]).
