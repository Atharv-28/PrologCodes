% 2. Check whether a number is even or odd.
% Run: swipl -q -s 02_even_or_odd.pl -g main -t halt
% Query manually: ?- even_or_odd(7, Result).

even_or_odd(N, even) :- 0 is N mod 2, !.
even_or_odd(_, odd).

main :-
    N = 7,
    even_or_odd(N, Result),
    format('~w is ~w.~n', [N, Result]).
