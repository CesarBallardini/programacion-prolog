/*
 * ejecutar tests con

swipl -v  -f none -g "load_files('tests/test_ejemplos3.pl')" -t run_tests -- $*
swipl -s tests/test_ejemplos3.pl -g run_tests,halt -t 'halt(1)'

 */

:- set_prolog_flag(verbose, silent).
:- consult('ejemplos3.pl').
:- set_prolog_flag(verbose, verbose).


:- begin_tests(ejemplos3).


test(fallo_res1, true(R = fallo)) :-                % enmascara el fail: devuelve fallo
	Limite = 3, Meta = fail,
	resultado(Limite, Meta, R).

test(fallo_res2, true(R = timeout)) :-                % enmascara el fail: devuelve timeout porque tardo demasiado en fallar
	Limite = 1, Demora = 3, Meta = (sleep(Demora), fail),
	resultado(Limite, Meta, R).

test(timeout_res, true(R = timeout)) :-            % exito y demora mas de lo esperado
	 Limite = 1, Demora = 3, Meta = sleep(Demora),
	 resultado(Limite, Meta, R).

test(exito_res, true(R = exito)) :-                % exito y demora menos de lo esperado
	Limite = 3, Demora = 1, Meta = sleep(Demora),
	resultado(Limite, Meta, R).

%% no anda cuando hay un error, por ejemplo un procedimiento no definido:
%:- write('error:'), nl, Limite = 3, Demora = 1, Meta = perro(loco), resultado(Limite, Demora, Meta, R), write(resultado/R), nl, nl.
%test(error_res, [ true(R = error) ]) :-
test(error_res, [ true(R = error), fixme(el_error_no_es_capturado) ]) :-
	Limite = 3, Meta = perro(loco),
	resultado(Limite, Meta, R).


%%
% los predicados sueltos



test(fallo, true(R = fallo)) :- % R es uno de: exito,timeout,fallo -> fallo
    Limite = 3,
    Meta = fail,
    catch(call_with_time_limit( Limite, (Meta, R = exito) ),
          time_limit_exceeded,
          R = timeout), !
  ; R = fallo.

test(timeout, true(R = timeout)) :- % R es uno de: exito,timeout,fallo -> timeout
    Limite = 1,
    Demora = 3,
    Meta = sleep(Demora),
    catch(call_with_time_limit( Limite, (Meta, R = exito) ),
          time_limit_exceeded,
          R = timeout), !
  ; R = fallo.

test(exito, true(R = exito)) :- % R es uno de: exito,timeout,fallo -> exito
    Limite = 3,
    Demora = 1,
    Meta = sleep(Demora),
    catch(call_with_time_limit( Limite, (Meta, R = exito) ),
          time_limit_exceeded,
          R = timeout), !
  ; R = fallo.

test(excep, true(R = error)) :- % R es uno de: exito,error,timeout
    Limite = 3,
    Meta = perro(loco),
    catch(call_with_time_limit( Limite, catch((Meta, R = exito), E, (print_message(error, E), fail)) ),
          time_limit_exceeded,
          R = timeout), !
  ; R = error.


:- end_tests(ejemplos3).
