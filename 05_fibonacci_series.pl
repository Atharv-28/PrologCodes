% 5. Generate the first N terms of the Fibonacci series.
% Run: swipl -q -s 05_fibonacci_series.pl -g main -t halt
% Query manually: ?- fibonacci_series(8, Series).

fib(0, 0) :- !.
fib(1, 1) :- !.
fib(N, F) :-
    N > 1,
    N1 is N - 1, N2 is N - 2,
    fib(N1, F1), fib(N2, F2),
    F is F1 + F2.

fibonacci_series(N, Series) :-
    integer(N), N >= 0,
    Last is N - 1,
    ( N =:= 0 -> Series = []
    ; findall(F, (between(0, Last, I), fib(I, F)), Series)
    ).

main :-
    N = 8,
    fibonacci_series(N, Series),
    format('First ~w Fibonacci terms: ~w~n', [N, Series]).
