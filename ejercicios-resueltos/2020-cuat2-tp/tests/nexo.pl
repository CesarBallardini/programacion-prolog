/*
 * ejecutar tests con
swipl -v  -f none -g "load_files('tests/nexo.pl')" -t run_tests -- $*
swipl -s tests/nexo.pl -g run_tests,halt -t 'halt(1)'
 */

:- set_prolog_flag(verbose, silent).
:- consult('kungflu.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(nexo).


test(melina_hasta_camila, [true(L = [['Melina','Mauro','Romina','Camila']] )]) :- 
	nexo(6,2,L).

test(camila_hasta_melina, [true(L = [] )]) :- 
	nexo(2,6,L).

test(romina_hasta_marcelo, [true(L = [['Romina','Camila','Marcelo'],['Romina','Camila','Martín','Marcelo']] )]) :- 
	nexo(5,7,L).

test(mauro_hasta_fabian, [true(L = [['Mauro','Melina','Fabián'],['Mauro','Melina','Belén','Fabián']] )]) :- 
	nexo(3,8,L).

:- end_tests(nexo).
