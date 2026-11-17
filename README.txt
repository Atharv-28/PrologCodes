SWI-PROLOG PRACTICAL PROGRAMS

This folder contains 20 separate Prolog source files based on the questions in AI POE.docx.

REQUIREMENT
Install SWI-Prolog and make sure the `swipl` command is available in your terminal.

RUN A PROGRAM
Open Command Prompt or PowerShell in this folder and run, for example:
    swipl -q -s 01_largest_of_two.pl -g main -t halt

Each .pl file contains its own Run command in the first comment lines.
Replace the filename with the program you want to execute.

INTERACTIVE MODE
You can also start SWI-Prolog with:
    swipl
Then load a file:
    ?- [01_largest_of_two].
Then call a predicate, for example:
    ?- largest(10, 20, Result).

NOTES
- The examples and inputs are defined in each file's main/0 predicate. Edit those values
  to test different inputs.
- Program 11 uses 4L and 3L jugs and aims to obtain 2L.
- Program 12 prints one solution to the 8-Queens problem.
- Program 16 uses a sample 8-puzzle state that is one move from the goal.
- Program 19 demonstrates a simple computer move and winner check; it is not an
  interactive, turn-by-turn terminal interface.
