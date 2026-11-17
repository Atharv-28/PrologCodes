% 1. Find the largest of two numbers.
% Run: swipl -q -s 01_largest_of_two.pl -g main -t halt
% Query manually: ?- largest(10, 20, L).

largest(A, B, A) :- A >= B, !.
largest(_, B, B).

main :-
    A = 10, B = 20,
    largest(A, B, L),
    format('Largest of ~w and ~w is ~w.~n', [A, B, L]).
