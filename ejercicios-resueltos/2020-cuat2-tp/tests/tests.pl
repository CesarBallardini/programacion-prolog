:- style_check(-singleton). % apago el warning de singleton en el codigo fuente
:- set_test_options([silent(false)]).
:- load_files([
    tests/cantTestPositivo,
    tests/cantTestNegativo,
    tests/cantTestPersona,
    tests/noTesteados,
    tests/casosActivos,
    tests/testeados,
    tests/recuperados,
    tests/periodoActivo,
    tests/expuestos,
    tests/nexo
], [ if(not_loaded) ]).
