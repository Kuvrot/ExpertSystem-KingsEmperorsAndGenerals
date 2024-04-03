:- dynamic si/1, no/1.

/* Reglas de clasificación */
hombre :- verify(es_hombre).
anterior_siglo_VI :- verify(anterior_siglo_VI).
romano :- verify(es_romano).
rey_emperador :- verify(es_rey_emperador).
asesinado :- verify(fue_asesinado).
fue_traicionado :- verify(fue_traicionado).
estratega_guerrero :- verify(es_estratega_guerrero).
muere_joven :- verify(muere_joven).
tuvo_hijos :- verify(tuvo_hijos).

/* Cómo hacer preguntas */
ask(Question) :-
    write('¿El personaje tiene la siguiente caracteristica: '),
    write(Question),
    write('? '),
    read(Response),
    nl,
    ( (Response == si ; Response == s) ->
       assert(si(Question)) ;
       assert(no(Question)), fail).

/* Cómo verificar algo */
verify(S) :-
   (si(S) ->
    true ;
    (no(S) ->
     fail ;
     ask(S))).

/* Deshacer todas las afirmaciones de sí/no */
undo :- retractall(si(_)), retractall(no(_)).

/* Hipótesis a ser probadas */
go :- hypothesize(Personaje),
      write('Mi adivinanza es que el personaje es: '),
      write(Personaje),
      nl,
      undo.

/* Características de los personajes */
hypothesize(julio_cesar)     :- julio_cesar, !.
hypothesize(aureliano)       :- aureliano, !.
hypothesize(caligula)        :- caligula, !.
hypothesize(scipio_africanus):- scipio_africanus, !.
hypothesize(alejandro_magno) :- alejandro_magno, !.
hypothesize(arminio)         :- arminio, !.
hypothesize(marcus_aurelius) :- marcus_aurelius, !.
hypothesize(anibal_barca)    :- anibal_barca, !.
hypothesize(amilcar_barca)   :- amilcar_barca, !.
hypothesize(belisarius)      :- belisarius, !.
hypothesize(fabio)           :- fabio, !.
hypothesize(basilio)         :- basilio, !.
hypothesize(justiniano)      :- justiniano, !.
hypothesize(unknown).        /* No diagnosis */



/* Características de los personajes */
julio_cesar :- hombre,
               anterior_siglo_VI,
               romano,
               asesinado,
               fue_traicionado,
               estratega_guerrero,
               tuvo_hijos.
alejandro_magno :- hombre,
                   anterior_siglo_VI,
                   rey_emperador,
                   estratega_guerrero,
                   muere_joven,
                   tuvo_hijos.
amilcar_barca :- hombre,
                 anterior_siglo_VI,
                 asesinado,
                 estratega_guerrero,
                 tuvo_hijos.
anibal_barca :- hombre,
                anterior_siglo_VI,
                fue_traicionado,
                estratega_guerrero,
                tuvo_hijos.
scipio_africanus :- hombre,
                    anterior_siglo_VI,
                    romano,
                    fue_traicionado,
                    estratega_guerrero,
                    tuvo_hijos.
fabio :- hombre,
         anterior_siglo_VI,
         romano,
         estratega_guerrero,
         tuvo_hijos.
marcus_aurelius :- hombre,
                   anterior_siglo_VI,
                   romano,
                   rey_emperador,
                   tuvo_hijos.
aureliano :- hombre,
             anterior_siglo_VI,
             romano,
             rey_emperador,
             asesinado,
             fue_traicionado,
             estratega_guerrero,
             tuvo_hijos.
caligula :- hombre,
            anterior_siglo_VI,
            romano,
            rey_emperador,
            asesinado,
            fue_traicionado,
            muere_joven,
            tuvo_hijos.
arminio :- hombre,
           anterior_siglo_VI,
           asesinado,
           fue_traicionado,
           estratega_guerrero,
           muere_joven,
           tuvo_hijos.
belisarius :- hombre,
              romano,
              fue_traicionado,
              estratega_guerrero,
              tuvo_hijos.
justiniano :- hombre,
              romano,
              rey_emperador.
basilio :- hombre,
           romano,
           rey_emperador,
           estratega_guerrero.
