% 9. Check whether an element exists in a list.
% Run: swipl -q -s 09_element_in_list.pl -g main -t halt
% Query manually: ?- element_exists(3, [1,2,3,4]).

element_exists(X, [X|_]) :- !.
element_exists(X, [_|T]) :-
    element_exists(X, T).

main :-
    Element = 3,
    List = [1, 2, 3, 4, 5],
    ( element_exists(Element, List)
    -> format('~w exists in ~w.~n', [Element, List])
    ;  format('~w does not exist in ~w.~n', [Element, List])
    ).
