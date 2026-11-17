% 4. Find the sum of natural numbers from 1 to N.
% Run: swipl -q -s 04_sum_natural_numbers.pl -g main -t halt
% Query manually: ?- sum_natural(10, Sum).

sum_natural(0, 0) :- !.
sum_natural(N, Sum) :-
    integer(N), N > 0,
    N1 is N - 1,
    sum_natural(N1, S1),
    Sum is N + S1.

main :-
    N = 10,
    sum_natural(N, Sum),
    format('Sum of natural numbers from 1 to ~w is ~w.~n', [N, Sum]).
