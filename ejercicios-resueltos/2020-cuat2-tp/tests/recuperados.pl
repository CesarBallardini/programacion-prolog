/*
 * ejecutar tests con
swipl -v  -f none -g "load_files('tests/recuperados.pl')" -t run_tests -- $*
swipl -s tests/recuperados.pl -g run_tests,halt -t 'halt(1)'
 */

:- set_prolog_flag(verbose, silent).
:- consult('kungflu.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(recuperados).


test(hay, [true(L = ['Diego','Melina'])]) :- 
	recuperados(fecha(2020,6,30),L).


:- end_tests(recuperados).
