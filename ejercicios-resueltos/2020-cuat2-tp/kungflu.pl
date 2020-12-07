/*
 * kungflu.pl
 *
 * Para aquellos que envían su trabajo como
 * Little-endian UTF-16 Unicode text, with CR line terminators
 * se puede convertir a UTF-8 con:
   iconv -f UTF-16  -t UTF-8 tp2.pl -o - | tr "\015" "\012" > kungflu.pl
 *
 * la variabilidad de nombres se puede resolver con:
   sed -i -e "s/Martin/Martín/g"   -e "s/Fabian/Fabián/g"   -e "s/Belen/Belén/g"   kungflu.pl

   sed -i -e "s/mart.n/'Martín'/g" -e "s/fabi.n/'Fabián'/g" -e "s/bel.n/'Belén'/g" kungflu.pl
   sed -i -e "s/diego/'Diego'/g"   -e "s/camila/'Camila'/g" -e "s/mauro/'Mauro'/g" kungflu.pl
   sed -i -e "s/romina/'Romina'/g" -e "s/melina/'Melina'/g" -e "s/marcelo/'Marcelo'/g" kungflu.pl
   sed -i -e "s/pablo/'Pablo'/g"   -e "s/mariana/'Mariana'/g" kungflu.pl

   sed -i -e "s/\".art.n\"/'Martín'/g" -e "s/\".abi.n\"/'Fabián'/g" -e "s/\".el.n\"/'Belén'/g" kungflu.pl
   sed -i -e "s/\".iego\"/'Diego'/g"   -e "s/\".amila\"/'Camila'/g" -e "s/\".auro\"/'Mauro'/g" kungflu.pl
   sed -i -e "s/\".omina\"/'Romina'/g" -e "s/\".elina\"/'Melina'/g" -e "s/\".arcelo\"/'Marcelo'/g" kungflu.pl
   sed -i -e "s/\".ablo\"/'Pablo'/g"   -e "s/\".ariana\"/'Mariana'/g" kungflu.pl
 */

persona(1,'Diego').
persona(2,'Camila').
persona(3,'Mauro').
persona(4,'Martín').
persona(5,'Romina').
persona(6,'Melina').
persona(7,'Marcelo').
persona(8,'Fabián').
persona(9,'Belén').
persona(10,'Pablo').
persona(11,'Mariana').

/* Contactos */
contacto(10,2,fecha(2020,6,29)).
contacto(2,7,fecha(2020,6,14)).
contacto(4,2,fecha(2020,6,14)).
contacto(7,4,fecha(2020,6,16)).
contacto(5,2,fecha(2020,6,12)).
contacto(5,3,fecha(2020,6,11)).
contacto(3,6,fecha(2020,6,9)).
contacto(1,6,fecha(2020,6,11)).
contacto(6,8,fecha(2020,6,9)).
contacto(11,6,fecha(2020,6,26)).
contacto(6,9,fecha(2020,6,10)).
contacto(8,9,fecha(2020,6,26)).
contacto(11,8,fecha(2020,6,12)).

/* Resultados de tests */
positivo(6,fecha(2020,6,7)).
positivo(6,fecha(2020,6,21)).
positivo(1,fecha(2020,6,12)).
positivo(3,fecha(2020,6,12)).
positivo(9,fecha(2020,6,29)).
positivo(9,fecha(2020,7,5)).
positivo(2,fecha(2020,6,16)).
positivo(2,fecha(2020,6,26)).
positivo(4,fecha(2020,6,18)).

negativo(6,fecha(2020,6,25)).
negativo(11,fecha(2020,6,9)).
negativo(1,fecha(2020,6,9)).
negativo(1,fecha(2020,6,26)).
negativo(3,fecha(2020,6,7)).
negativo(9,fecha(2020,6,14)).
negativo(2,fecha(2020,7,1)).
negativo(7,fecha(2020,6,20)).
negativo(7,fecha(2020,6,27)).
negativo(4,fecha(2020,7,5)).

/* Comparación de fechas */
compara(D1,=,D2):-D1 = D2, !.
compara(D1,>,D2):-D1 @> D2, !.
compara(D1,<,D2):-D1 @< D2, !.
compara(D1,>=,D2):-D1 @>= D2, !.
compara(D1,=<,D2):-D1 @=< D2, !.



/*
5. cantTestPositivo(F,C): F unifica con una fecha y C con la cantidad de tests
positivos totales realizados hasta la fecha F (inclusive). Ej.:
?- cantTestPositivo(fecha(2020,6,20),C).
C = 5.
?- cantTestPositivo(fecha(2020,5,6),C).
C = 0.
*/

cantTestPositivo([], []). % FIXME

/*
6. cantTestNegativo(F,C): F unifica con una fecha y C con la cantidad de tests
negativos totales realizados hasta la fecha F (inclusive). Ej.:
?- cantTestNegativo(fecha(2020,7,3),C).
C = 9.
*/

cantTestNegativo([], []). % FIXME

/*
7. cantTestPersona(N,C): N unifica con un NUP y C con la cantidad total de tests
(positivos y negativos) realizados a la persona con dicho NUP. Ej.:
?- cantTestPersona(2,C).
C = 3.
?- cantTestPersona(5,C).
C = 0.
*/

cantTestPersona([],[]). % FIXME

/*
8. noTesteados(F,L): F unifica con una fecha y L con la lista de nombres de
personas en el grupo No-Testeadas hasta la fecha F (inclusive). Ej.:
?- noTesteados(fecha(2020,6,21),L).
L = ['Romina','Fabián','Pablo'].
*/

noTesteados([], []). % FIXME

/*
9. casosActivos(F,L): F unifica con una fecha y L con la lista de nombres de
personas en el grupo Casos-Activos hasta la fecha F (inclusive). Ej.:
?- casosActivos(fecha(2020,6,25),L).
L = ['Diego','Camila','Mauro','Martín'].
*/

casosActivos([], []). % FIXME

/*
10. testeados(F,L): F unifica con una fecha y L con la lista de nombres de
personas en el grupo Testeados hasta la fecha F (inclusive). Ej.:
?- testeados(fecha(2020,6,15),L).
L = ['Diego','Mauro','Melina','Belén','Mariana'].

*/

testeados([], []). % FIXME

/*
11. recuperados(F,L): F unifica con una fecha y L con la lista de nombres de
personas en el grupo Recuperados hasta la fecha F (inclusive). Ej.:
?- recuperados(fecha(2020,6,30),L).
L = ['Diego','Melina'].
*/

recuperados([], []).  % FIXME

/*
12. periodoActivo(N,F1,F2): N unifica con un NUP, F1 con la fecha en que la
persona tuvo el primer test(+) y F2 con la fecha en que tuvo el test(-) con el que
ingresó al grupo Recuperados. Ej.:
?- periodoActivo(2,F1,F2).
F1 = fecha(2020,6,16)
F2 = fecha(2020,7,1).
?- periodoActivo(5,F1,F2).
false.
*/

periodoActivo([], [], []). % FIXME

/*
13. expuestos(N,L): N unifica con un NUP y L con la lista de nombres de las
personas con las que tuvo contacto en el periodo en que fue caso activo (ver 12). Ej.:
?- expuestos(6,L).
L = ['Diego','Mauro','Fabián','Belén'].
?- expuestos(10,L).
false.
?- expuestos(2,L).
L = ['Pablo'].
*/

expuestos([], []). % FIXME

/*
14. nexo(N1,N2,L): N1 y N2 unifican con NUPs y L con una lista en donde cada
elemento es una lista de nombres. Una lista de nombres [A1, A2, A3, ..., An]
tendrá las siguientes características:
1. n >= 2
2. A1 es el nombre de la persona con NUP N1.
3. An es el nombre de la persona con NUP N2.
4. Cada par Ai, Ai+1 es un contacto directo.
5. La fecha de contacto de las personas con nombres Ai-1,Ai es menor o igual a la fecha de contacto de las personas con nombres Ai,Ai+1

Ej.:

?- nexo(6,2,L).
L = [['Melina','Mauro','Romina','Camila']].
?- nexo(2,6,L).
L = [].
?- nexo(5,7,L).
L = [['Romina','Camila','Marcelo'],['Romina','Camila','Martín','Marcelo']].
?- nexo(3,8,L).
L = [['Mauro','Melina','Fabián'],['Mauro','Melina','Belén','Fabián']].

*/

nexo([], [], []). % FIXME
