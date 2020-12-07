/*
 * ejecutar tests con
swipl -v  -f none -g "load_files('tests/testeados.pl')" -t run_tests -- $*
swipl -s tests/testeados.pl -g run_tests,halt -t 'halt(1)'
 */

:- set_prolog_flag(verbose, silent).
:- consult('kungflu.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(testeados).


/*
Si son los testeados que siempre dieron negativos, Diego, Mauro y Melina no califican para esta respuesta, tienen positivos:

?- Fecha=fecha(2020,6,15), persona(NUP,'Diego'), positivo(NUP, Fp), compara(Fp, =<, Fecha).
Fecha = fecha(2020, 6, 15),
NUP = 1,
Fp = fecha(2020, 6, 12).

?- Fecha=fecha(2020,6,15), persona(NUP,'Mauro'), positivo(NUP, Fp), compara(Fp, =<, Fecha).
Fecha = fecha(2020, 6, 15),
NUP = 3,
Fp = fecha(2020, 6, 12).

?- Fecha=fecha(2020,6,15), persona(NUP,'Melina'), positivo(NUP, Fp), compara(Fp, =<, Fecha).
Fecha = fecha(2020, 6, 15),
NUP = 6,
Fp = fecha(2020, 6, 7) ;
false.

Belén y Mariana no tienen positivos:

?- Fecha=fecha(2020,6,15), persona(NUP,'Belén'), positivo(NUP, Fp), compara(Fp, =<, Fecha).
false.

?- Fecha=fecha(2020,6,15), persona(NUP,'Mariana'), positivo(NUP, Fp), compara(Fp, =<, Fecha).
false.


Con testeados siempre negativos, el test es:

test(hay, [true(L = ['Belén','Mariana'])]) :- 
	testeados(fecha(2020,6,15),L).

con testeados positivos y/o negativos, el test es:

*/
test(hay, [true(L = ['Diego','Mauro','Melina','Belén','Mariana'])]) :- 
	testeados(fecha(2020,6,15),L).


:- end_tests(testeados).
