/*
 * ejecutar tests con

swipl -v  -f none -g "load_files('tests/test_ejemplos2.plt')" -t run_tests -- $*
swipl -s tests/test_ejemplos2.plt -g run_tests,halt -t 'halt(1)'

 */


ama(juan, futbol).
ama(juan, raspberri_pi).
ama(juan, programacion).
% ama(juan, yogurt). % si se descomenta, ambos tests fallan

