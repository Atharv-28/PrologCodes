% 8. Reverse a list.
% Run: swipl -q -s 08_reverse_list.pl -g main -t halt
% Query manually: ?- reverse_list([a,b,c], R).

reverse_list(List, Reversed) :-
    reverse_acc(List, [], Reversed).

reverse_acc([], Acc, Acc).
reverse_acc([H|T], Acc, Reversed) :-
    reverse_acc(T, [H|Acc], Reversed).

main :-
    List = [a, b, c, d],
    reverse_list(List, Reversed),
    format('Original list: ~w~nReversed list: ~w~n', [List, Reversed]).
