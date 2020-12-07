/*
 * ejecutar tests con
swipl -v  -f none -g "load_files('tests/cantTestPersona.pl')" -t run_tests -- $*
swipl -s tests/cantTestPersona.pl -g run_tests,halt -t 'halt(1)'
 */

:- set_prolog_flag(verbose, silent).
:- consult('kungflu.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(cantTestPersona).


test(hay, [true(C =:= 3)]) :- 
	cantTestPersona(2,C).

test(no_hay, [true(C =:= 0)]) :- 
	cantTestPersona(5,C).


:- end_tests(cantTestPersona).
