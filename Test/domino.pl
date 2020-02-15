 /*
  *             INTELIGENCIA ARTIFICIAL
  *                     
  *                     
  *             PROYECTO Nº1: Integración de Prolog con Java.
  *                     
  *                                
  * Realizado por:
  *             Fernando Gabriel Següino        L.U.: [61242] y
  *             Jorge Robla                     L.U.:[60599]
  *                     
  * entre los d¡as 27 y 28 de abril de 2006.
  */


  /****************************************************************************
  * Definición: domino(+LE, -LS).                                             *
  * Aridad: domino/2.                                                         *                                                   *
  * Función: recibe como argumento un conjunto de piezas de dominó,           *
  *          representadas mediante una lista "LE" de pares, no ordenados, de *
  *          números entre 1 y 6, y retorna, de existir, una lista "LS"       *
  *          representando una configuración válida de dominó utilizando todas*
  *          las piezas del conjunto.                                         *
  ****************************************************************************/
domino([], []).
domino([Ficha], [Ficha]).
domino(Fichas, Comb) :- permutacion(Fichas, Comb),
                        verifCombinacion(Comb),
                        !.
                        
                        
  /****************************************************************************
  * Definicón: permutación(+LE, -LS).                                         *
  * Aridad: permutación/2.                                                    *
  * Función: Recibe una lista de elementos "LE" y devuelve otra con una       *
  *          permutación de sus elementos.                                    *
  ****************************************************************************/
permutacion([],[]).
permutacion([X|L],Lres):- permutacion(L,Laux),
                          insertar_permutar(X,Laux,Lres).


  /****************************************************************************
  * Definicón: insertar_permutar(+E, +LE, -LS).                               *
  * Aridad: insertar_permutar/3.                                              *
  * Función: Insertar el elemento "E" en la lista "LE" devolviendola en la    *
  *          lista de salida "LS".                                            *
  ****************************************************************************/
insertar_permutar(X,L,[X|L]).
insertar_permutar(X,[Y|L],[Y|Lres]):- insertar_permutar(X,L,Lres).


  /****************************************************************************
  * Definicón: verifCombinacion(+LE).                                         *
  * Aridad: verifCombinacion/1.                                               *
  * Función: Recive una lista de pares "LE" y verifica si es una              *
  *          configuración válida de domino.                                  *
  ****************************************************************************/
verifCombinacion([F]).
verifCombinacion([F1,F2|Fichas]):- verifPar(F1, F2),
                                   verifCombinacion([F2 | Fichas]).


   /***************************************************************************
  * Definicón: verifPar(+P1, +P2).                                            *
  * Aridad: verifPar/2.                                                       *
  * Función: Dadas dos listas de dos elementos "P1" y "P2" representando      *
  *          fichas de dominó, determina si pueden combinarse.                *
  ****************************************************************************/
verifPar([X,Y],[X,Z]).
verifPar([X,Y],[Z,X]).
verifPar([X,Y],[Y,Z]).
verifPar([X,Y],[Z,Y]).
