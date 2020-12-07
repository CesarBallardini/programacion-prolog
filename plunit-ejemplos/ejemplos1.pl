/*
 * ejecutar tests con

swipl -v  -f none -g "load_files('tests/test_ejemplos1.pl')" -t run_tests -- $*
swipl -s tests/test_ejemplos1.pl -g run_tests,halt -t 'halt(1)'

 */


aprecia(juan, futbol).
aprecia(juan, raspberri_pi).
aprecia(juan, programacion).
% aprecia(juan, yogurt). % si se descomenta, ambos tests fallan

