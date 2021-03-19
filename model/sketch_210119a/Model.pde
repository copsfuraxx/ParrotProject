//Pour julio et son joli menu

Save save;
Pinceau pinceau;

public static ArrayList<String> creeListeDeForme(){
  ArrayList<String> formes=new ArrayList<String>();
  formes.add("Carre");
  formes.add("Rectangle");
  formes.add("Triangle");
  formes.add("Ellipse");
  formes.add("Cercle");
  formes.add("Polygone");
  formes.add("Koch");
  formes.add("cesaro");
  formes.add("Fractale de Kock");
  formes.add("Flocon de Koch");
  formes.add("Fractale de Triangle");
  formes.add("Fractale de Carre");
  formes.add("Polygone de koch de Kock");
  formes.add("Spirale d'Or");
  formes.add("Courbe de Bezier");
  return formes;
}

public void dessineFormeParIdDeListe(int id){
  switch(id) {
    case 0:
      dessineCarre();
      break;
    case 1:
      dessineRectangle();
      break;
    case 2:
      dessineTriangle();
      break;
    case 3:
      dessineEllipse();
      break;
    case 4:
      dessineCercle();
      break;
    case 5:
      dessinePoly();
      break;
    case 6:
      koch();
      break;
    case 7:
      cesaro();
      break;
    case 8:
      fractalKock();
      break;
    case 9:
      floconKoch();
      break;
    case 10:
      fractaleTriangle();
      break;
    case 11:
      fractaleCarre();
      break;  
    case 12:
      polyParfait();
      break;
     case 13:
      spiralrOr();
      break;
     case 14:
      courbeBezier();
      break;
  }
}

public void dessineForme(int id, Couleur c){
  pinceau.setCouleur(c);
  dessineFormeParIdDeListe(id);
}

public void dessineForme(int id, Couleur c1, Couleur c2){
  pinceau.setCouleur(c1,c2);
  dessineFormeParIdDeListe(id);
}
