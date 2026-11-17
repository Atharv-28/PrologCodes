% 10. Family relationships: parent, brother, sister and grandparent.
% Run: swipl -q -s 10_family_relationships.pl -g main -t halt
% Query manually: ?- grandparent(alex, Who).

% Example family facts
male(john).
male(paul).
male(alex).
female(mary).
female(susan).

parent(john, paul).
parent(mary, paul).
parent(paul, alex).
parent(susan, alex).

brother(X, Y) :-
    male(X),
    parent(P, X), parent(P, Y),
    X \= Y.

sister(X, Y) :-
    female(X),
    parent(P, X), parent(P, Y),
    X \= Y.

grandparent(X, Y) :-
    parent(X, Z),
    parent(Z, Y).

main :-
    format('Grandchildren of John: '),
    ( grandparent(john, Who)
    -> format('~w~n', [Who])
    ;  format('None~n')
    ).
