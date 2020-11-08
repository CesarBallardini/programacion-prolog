/*
 * ejecutar tests con

swipl -v  -f none -g "load_files('tests/test_ejemplos0.plt')" -t run_tests -- $*
swipl -s tests/test_ejemplos0.plt -g run_tests,halt -t 'halt(1)'

 */


:- begin_tests(ejemplos).


test(add, [true(A =:= 3)]) :-
        A is 1 + 2.

test(member, all(X == [a,b,c])) :-
        member(X, [a,b,c]).


:- end_tests(ejemplos).
