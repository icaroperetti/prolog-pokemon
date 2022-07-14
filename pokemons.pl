% Aluno: Icaro Peretti

jogar :- hipotese(Pokemon),
      write('Acredito que seja o: '),
      write(Pokemon),
      nl,
      undo.

% Hipoteses a serem testadas 
hipotese(venomoth) :- venomoth, !. % 1
hipotese(gastly) :- gastly, !.  % 2
hipotese(muk) :- muk, !. % 3
hipotese(bulbasaur) :- bulbasaur, !. % 4
hipotese(charmander) :- charmander, !. % 5
hipotese(blastoise) :- blastoise, !. % 6
hipotese(raichu) :- raichu, !. % 7
hipotese(beedrel) :- beedrel, !. % 8
hipotese(abra) :- abra, !. % 9 
hipotese(geodude) :- geodude, !. % 10


% Caso não encontre o Pokemon.
hipotese(desconhecido).             


% Regras para identificar o pokemon
venomoth :- 
  verificar(cor_tons_roxo),
  verificar(voa),
  verificar(e_do_tipo_venenoso).


gastly :- 
  verificar(cor_tons_roxo),
  verificar(e_do_tipo_fantasma),
  verificar(flutua).


muk :-
  verificar(cor_tons_roxo),
  verificar(e_terrestre),
  verificar(e_do_tipo_venenoso).

bulbasaur :-
  verificar(cor_tons_verde),
  verificar(e_do_tipo_grama),
  verificar(e_terrestre).

charmander :- 
  verificar(cor_tons_laranja),
  verificar(e_do_tipo_fogo),
  verificar(e_terrestre).

blastoise :- 
  verificar(cor_tons_azul),
  verificar(e_do_tipo_agua),
  verificar(terrestre).

raichu :- 
  verificar(cor_tons_amarelo),
  verificar(e_do_tipo_eletrico),
  verificar(e_terrestre).


beedrel :- 
  verificar(cor_tons_amarelo),
  verificar(e_do_tipo_inseto),
  verificar(voa).

abra :- 
  verificar(cor_tons_amarelo),
  verificar(e_do_tipo_psiquico),
  verificar(flutua).

geodude :- 
  verificar(cor_tons_cinza),
  verificar(e_do_tipo_pedra),
  verificar(e_terrestre).


perguntar(Questao) :-
    write('O pokemon possui a seguinte caracteristica: '),
    write(Questao),
    nl,
    write(' Responda (s. ou n. )'),
    read(Resposta),
    nl,
    ( (Resposta == sim ; Resposta == s)
      ->
       assert(yes(Questao));
       assert(no(Questao)), fail).

:- dynamic yes/1,no/1.

% Verificar algo
verificar(S) :-
   (yes(S)
    ->
    true;
    (no(S)
     ->
     fail;
     perguntar(S))).

/* Desfazer todas as afirmacoes de sim e nao */
undo :- retract(yes(_)),fail.
undo :- retract(no(_)),fail.
undo.
