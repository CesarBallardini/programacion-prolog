/*
 * ejecutar tests con
swipl -v  -f none -g "load_files('tests/expuestos.pl')" -t run_tests -- $*
swipl -s tests/expuestos.pl -g run_tests,halt -t 'halt(1)'
 */

:- set_prolog_flag(verbose, silent).
:- consult('kungflu.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(expuestos).

% FIXME: el orden es importante en la salida de este predicado?? Ver consultas...

test(hay_melina) :-
	expuestos(6,L),
	Expected = ['Diego','Mauro','Fabián','Belén'],
	msort(L,L_sorted),
	msort(Expected, Expected_sorted),
	L_sorted = Expected_sorted.

test(hay_camila, true(L == ['Pablo'])) :-
	expuestos(2,L).

test(no_hay_pablo, fail) :-
	expuestos(10,_L).


:- end_tests(expuestos).
