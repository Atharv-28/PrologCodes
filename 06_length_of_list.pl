% 6. Find the length of a list.
% Run: swipl -q -s 06_length_of_list.pl -g main -t halt
% Query manually: ?- list_length([a,b,c], L).

list_length([], 0).
list_length([_|T], N) :-
    list_length(T, N1),
    N is N1 + 1.

main :-
    List = [red, green, blue, yellow],
    list_length(List, Length),
    format('List: ~w~nLength: ~w~n', [List, Length]).
