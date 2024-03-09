#import "../insa-template/template.typ" : *
#show: doc => insa-report(
  id: 3,
  pre-title: "S4 STPI",
  title: "Interférences et diffraction",
  authors: ("NOM1 Prénom1", "NOM2 Prénom2"),
  sub-authors: [
    STPI 2H\
    Binôme X
  ],
  date: "11/04/2023",
  doc)

#heading(numbering: none, "Introduction")

Template fait pour des comptes-rendus (notamment ceux des TP de physique de STPI) :
- règles de numérotation incluse
- équations numérotées aussi
- paragraphes justifiés
- premiers titres en lettres capitales
- présence de la fonction `#tableau` pour faire des figures nommées "Tableau" facilement
- les blocs de code sont automatiquement entourés d'un trait

= Théorie blabla

#counter(heading).step(level:2) // permet de sauter une sous partie si y'a rien à dire notamment

== Les fentes euh... diffraction euhh arctangente

Une petite équation:
$ (lambda D) / (n pi) = "truc au pif" $
// petit commentaire

Des maths sur la même ligne: $a b = sqrt(b a)$

Maintenant voici du contenu:

#tableau(table(
  columns: 2,
  [*Colonne 1*], [*Colonne 2*],
  "quelque chose", "une autre chose",
  "tralalala", "skibidi"
), caption: "Random tableau au pif")

#figure(image("../illustrations/github-download.png", width: 50%), caption: "Une image random")

=== Un bloc de code en Java
```java
public class ClasseDeMerde {

  public static void main(String[] args) {
    System.out.println("uwu");
  }

}
```