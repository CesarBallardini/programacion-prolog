/*
 * ejecutar tests con

swipl -v  -f none -g "load_files('tests/test_ejemplos1.plt')" -t run_tests -- $*
swipl -s tests/test_ejemplos1.plt -g run_tests,halt -t 'halt(1)'

 */


aprecia(juan, futbol).
aprecia(juan, raspberri_pi).
aprecia(juan, programacion).
% aprecia(juan, yogurt). % si se descomenta, ambos tests fallan

:- begin_tests(ejemplos1).


/* testing for failure */
test(juan1, [fail]) :- aprecia(juan,yogurt).

/* check for all answers from a nondeterministic predicate */
test(juan2, all(X == [futbol,raspberri_pi,programacion])) :-
   aprecia(juan,X).


:- end_tests(ejemplos1).
