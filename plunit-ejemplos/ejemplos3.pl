/*
 * ejemplos3.pl
 *
*/

% FIXME: para el caso de error, no lo captura sino que falla
resultado_print(Limite, Demora, Meta, R) :- % R es uno de: exito,error,timeout,fallo
    write(res(Limite,Demora,Meta)), nl,
    catch(call_with_time_limit( Limite, catch((Meta, R = exito), error(E), (print_message(error, error(E)), R = error)) ),
          time_limit_exceeded,
          R = timeout), !
  ; R = fallo.


resultado(Limite, Meta, R) :- % R es uno de: exito,error,timeout,fallo
    catch(call_with_time_limit( Limite, catch((Meta, R = exito), error(E), (print_message(error, error(E)), R = error)) ),
          time_limit_exceeded,
          R = timeout), !
  ; R = fallo.

