/*
 * ejecutar tests con
swipl -v  -f none -g "load_files('tests/noTesteados.pl')" -t run_tests -- $*
swipl -s tests/noTesteados.pl -g run_tests,halt -t 'halt(1)'
 */

:- set_prolog_flag(verbose, silent).
:- consult('kungflu.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(noTesteados).


test(hay, [true(L = ['Romina','Fabián','Pablo'])]) :- 
	noTesteados(fecha(2020,6,21),L).


:- end_tests(noTesteados).
