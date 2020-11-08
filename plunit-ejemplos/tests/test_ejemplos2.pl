/*
 * ejecutar tests con

swipl -v  -f none -g "load_files('tests/test_ejemplos2.plt')" -t run_tests -- $*
swipl -s tests/test_ejemplos2.plt -g run_tests,halt -t 'halt(1)'

 */

:- set_prolog_flag(verbose, silent).
:- consult('ejemplos2.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(ejemplos2).


/* testing for failure */
test(juan1, [fail]) :- ama(juan,yogurt).

/* check for all answers from a nondeterministic predicate */
test(juan2, all(X == [futbol,raspberri_pi,programacion])) :-
   ama(juan,X).


:- end_tests(ejemplos2).
