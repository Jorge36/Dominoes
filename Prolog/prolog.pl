 /*
  *             INTELIGENCIA ARTIFICIAL
  *                     
  *                     
  *             PROYECTO N�1: Integraci�n de Prolog con Java.
  *                     
  *                                
  * Realizado por:
  *             Fernando Gabriel Seg�ino        L.U.: [61242] y
  *             Jorge Robla                     L.U.:[60599]
  *                     
  * entre los d�as 27 y 28 de abril de 2006.
  */


  /****************************************************************************
  * Definici�n: domino(+LE, -LS).                                             *
  * Aridad: domino/2.                                                         *                                                   *
  * Funci�n: recibe como argumento un conjunto de piezas de domin�,           *
  *          representadas mediante una lista "LE" de pares, no ordenados, de *
  *          n�meros entre 1 y 6, y retorna, de existir, una lista "LS"       *
  *          representando una configuraci�n v�lida de domin� utilizando todas*
  *          las piezas del conjunto.                                         *
  ****************************************************************************/
domino([], []).
domino([Ficha], [Ficha]).
domino(Fichas, Comb) :- permutacion(Fichas, Comb),
                        verifCombinacion(Comb),
                        !.
                        
                        
  /****************************************************************************
  * Definic�n: permutaci�n(+LE, -LS).                                         *
  * Aridad: permutaci�n/2.                                                    *
  * Funci�n: Recibe una lista de elementos "LE" y devuelve otra con una       *
  *          permutaci�n de sus elementos.                                    *
  ****************************************************************************/
permutacion([],[]).
permutacion([X|L],Lres):- permutacion(L,Laux),
                          insertar_permutar(X,Laux,Lres).


  /****************************************************************************
  * Definic�n: insertar_permutar(+E, +LE, -LS).                               *
  * Aridad: insertar_permutar/3.                                              *
  * Funci�n: Insertar el elemento "E" en la lista "LE" devolviendola en la    *
  *          lista de salida "LS".                                            *
  ****************************************************************************/
insertar_permutar(X,L,[X|L]).
insertar_permutar(X,[Y|L],[Y|Lres]):- insertar_permutar(X,L,Lres).


  /****************************************************************************
  * Definic�n: verifCombinacion(+LE).                                         *
  * Aridad: verifCombinacion/1.                                               *
  * Funci�n: Recive una lista de pares "LE" y verifica si es una              *
  *          configuraci�n v�lida de domino.                                  *
  ****************************************************************************/
verifCombinacion([F]).
verifCombinacion([F1,F2|Fichas]):- verifPar(F1, F2),
                                   verifCombinacion([F2 | Fichas]).


   /***************************************************************************
  * Definic�n: verifPar(+P1, +P2).                                            *
  * Aridad: verifPar/2.                                                       *
  * Funci�n: Dadas dos listas de dos elementos "P1" y "P2" representando      *
  *          fichas de domin�, determina si pueden combinarse.                *
  ****************************************************************************/
verifPar([X,Y],[X,Z]).
verifPar([X,Y],[Z,X]).
verifPar([X,Y],[Y,Z]).
verifPar([X,Y],[Z,Y]).
