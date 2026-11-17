% 7. Find the largest element in a non-empty list of numbers.
% Run: swipl -q -s 07_largest_in_list.pl -g main -t halt
% Query manually: ?- largest_in_list([3,9,2,7], Max).

largest_in_list([H|T], Max) :-
    largest_acc(T, H, Max).

largest_acc([], Max, Max).
largest_acc([H|T], Current, Max) :-
    ( H > Current -> Next = H ; Next = Current ),
    largest_acc(T, Next, Max).

main :-
    List = [12, 45, 7, 29, 31],
    largest_in_list(List, Max),
    format('Largest element in ~w is ~w.~n', [List, Max]).
