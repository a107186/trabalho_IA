% Auto-run test harness for SWI-Prolog
% Loads the knowledge base and runs a set of verification queries, printing results.

:- initialization(main).

main :-
    Path = 'c:/Users/Utilizador/OneDrive/Ambiente de Trabalho/PROGRAMAÇÃO/trabalho_IA/trabalho pika.pl',
    format('Consulting ~w~n', [Path]),
    (   catch(consult(Path), E, (format('ERROR consulting ~w: ~w~n', [Path, E]), halt(1)))
    ),

    Tests = [
        inferir_classificacao_ta(c500,Class,Conf),
        inferir_classificacao_ta(c500i,Class,Conf),
        classificacao_consulta(c400, Poss),
        classificacao_consulta_aggregate(c400, PossFinal),
        relatorio_rapido_paciente(p100),
        relatorio_completo_paciente(p100)
    ],

    run_tests(Tests),
    halt(0).

run_tests([]).
run_tests([G|T]) :-
    format('\n--- Running: ~w~n', [G]),
    (   catch(findall(G, G, RList), E, (format('ERROR running ~w: ~w~n', [G, E]), RList = error(E)))
    ->  format('=> Results:~n~q~n', [RList])
    ;   format('=> No result (fail)~n')
    ),
    run_tests(T).
