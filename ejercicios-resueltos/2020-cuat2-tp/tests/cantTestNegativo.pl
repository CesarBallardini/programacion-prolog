/*
 * ejecutar tests con
swipl -v  -f none -g "load_files('tests/cantTestNegativo.pl')" -t run_tests -- $*
swipl -s tests/cantTestNegativo.pl -g run_tests,halt -t 'halt(1)'
 */

:- set_prolog_flag(verbose, silent).
:- consult('kungflu.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(cantTestNegativo).


test(hay, [true(C =:= 9)]) :- 
	cantTestNegativo(fecha(2020,7,3),C).


:- end_tests(cantTestNegativo).
