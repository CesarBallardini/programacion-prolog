/*
 * ejecutar tests con
swipl -v  -f none -g "load_files('tests/cantTestPositivo.pl')" -t run_tests -- $*
swipl -s tests/cantTestPositivo.pl -g run_tests,halt -t 'halt(1)'
 */

:- set_prolog_flag(verbose, silent).
:- consult('kungflu.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(cantTestPositivo).


test(hay, [true(C =:= 5)]) :- 
	cantTestPositivo(fecha(2020,6,20),C).

test(no_hay, [true(C =:= 0)]) :- 
	cantTestPositivo(fecha(2020,5,6),C).


:- end_tests(cantTestPositivo).
