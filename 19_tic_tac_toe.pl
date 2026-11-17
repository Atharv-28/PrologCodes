% 19. Simple Tic-Tac-Toe game: computer chooses the first available square.
% Run: swipl -q -s 19_tic_tac_toe.pl -g main -t halt
% Board positions: 1 2 3 / 4 5 6 / 7 8 9.
% X is the human, O is the computer. Edit the board or query winner/2.

winning_line([1,2,3]). winning_line([4,5,6]). winning_line([7,8,9]).
winning_line([1,4,7]). winning_line([2,5,8]). winning_line([3,6,9]).
winning_line([1,5,9]). winning_line([3,5,7]).

winner(Board, Player) :-
    winning_line([A,B,C]),
    nth1(A,Board,Player), nth1(B,Board,Player), nth1(C,Board,Player),
    Player \\= empty.

available_move(Board, Position) :-
    nth1(Position,Board,empty).

make_move(Board, Position, Player, NewBoard) :-
    available_move(Board,Position),
    replace_nth(Board,Position,Player,NewBoard).

replace_nth([_|T],1,X,[X|T]) :- !.
replace_nth([H|T],N,X,[H|R]) :-
    N1 is N-1, replace_nth(T,N1,X,R).

computer_move(Board, Position, NewBoard) :-
    available_move(Board,Position),
    make_move(Board,Position,o,NewBoard), !.

main :-
    Board = [x,x,empty, o,o,empty, empty,empty,empty],
    ( winner(Board, Player)
    -> format('Winner: ~w~n', [Player])
    ; computer_move(Board, Position, NewBoard),
      format('Computer places O at position ~w.~nBoard: ~w~n', [Position,NewBoard])
    ).
