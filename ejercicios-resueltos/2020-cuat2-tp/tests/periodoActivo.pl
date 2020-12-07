/*
 * ejecutar tests con
swipl -v  -f none -g "load_files('tests/periodoActivo.pl')" -t run_tests -- $*
swipl -s tests/periodoActivo.pl -g run_tests,halt -t 'halt(1)'
 */

:- set_prolog_flag(verbose, silent).
:- consult('kungflu.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(periodoActivo).


test(hay) :- 
	periodoActivo(2,F1,F2),
	F1 = fecha(2020,6,16),
	F2 = fecha(2020,7,1).

test(no_activo, [fail]) :- 
	periodoActivo(5,_F1,_F2).


:- end_tests(periodoActivo).
