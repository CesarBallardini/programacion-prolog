/*
 * ejecutar tests con
swipl -v  -f none -g "load_files('tests/casosActivos.pl')" -t run_tests -- $*
swipl -s tests/casosActivos.pl -g run_tests,halt -t 'halt(1)'
 */

:- set_prolog_flag(verbose, silent).
:- consult('kungflu.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(casosActivos).


test(hay, [true(L = ['Diego','Camila','Mauro','Martín'])]) :- 
	casosActivos(fecha(2020,6,25),L).


:- end_tests(casosActivos).
