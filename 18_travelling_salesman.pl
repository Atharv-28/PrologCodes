% 18. Solve the Travelling Salesman Problem by checking all tours.
% Run: swipl -q -s 18_travelling_salesman.pl -g main -t halt
% This is a small brute-force example graph.

road(a,b,10). road(a,c,15). road(a,d,20).
road(b,c,35). road(b,d,25).
road(c,d,30).

distance(X,Y,D) :- road(X,Y,D).
distance(X,Y,D) :- road(Y,X,D).

tour(Cities, [Start|Tour], Cost) :-
    Cities = [Start|Rest],
    permutation(Rest, Tour),
    append([Start|Tour], [Start], FullTour),
    route_cost(FullTour, Cost).

route_cost([_], 0).
route_cost([A,B|T], Cost) :-
    distance(A,B,D),
    route_cost([B|T], Remaining),
    Cost is D + Remaining.

tsp(BestTour, BestCost) :-
    Cities = [a,b,c,d],
    findall(Cost-Tour, tour(Cities,Tour,Cost), Tours),
    keysort(Tours, [BestCost-BestTour|_]).

main :-
    tsp(Tour, Cost),
    format('Shortest tour: ~w~nTotal cost: ~w~n', [Tour, Cost]).
