% 3. Calculate the factorial of a given non-negative integer.
% Run: swipl -q -s 03_factorial.pl -g main -t halt
% Query manually: ?- factorial(5, F).

factorial(0, 1) :- !.
factorial(N, F) :-
    integer(N), N > 0,
    N1 is N - 1,
    factorial(N1, F1),
    F is N * F1.

main :-
    N = 5,
    factorial(N, F),
    format('Factorial of ~w is ~w.~n', [N, F]).
