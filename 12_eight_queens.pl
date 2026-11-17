% 12. Solve the 8-Queens problem.
% Run: swipl -q -s 12_eight_queens.pl -g main -t halt
% Each list position is a column; its value is the queen's row.

eight_queens(Solution) :-
    permutation([1,2,3,4,5,6,7,8], Solution),
    safe_queens(Solution).

safe_queens([]).
safe_queens([Q|Others]) :-
    safe_from_diagonal(Q, Others, 1),
    safe_queens(Others).

safe_from_diagonal(_, [], _).
safe_from_diagonal(Q, [R|Others], Distance) :-
    abs(Q-R) =\\= Distance,
    D1 is Distance + 1,
    safe_from_diagonal(Q, Others, D1).

main :-
    once(eight_queens(Solution)),
    format('One 8-Queens solution (row for each column):~n~w~n', [Solution]).
