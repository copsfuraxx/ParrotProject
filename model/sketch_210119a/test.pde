void setup() {  
  background(255, 255, 255);
  connection();
  save=new Save();
  pinceau = new Pinceau();
  PApplet.runSketch(platformNames, new SecondApplet());
}

public void settings() {
  size(800, 800);

}

color c = color(255, 255, 255); //couleur background

void draw() {

  getInfoArduino();  

  // dessineTest(getValModifPot());
}

public class SecondApplet extends PApplet {
  MenuListe menu = new MenuListe(0);
  int dernierPot = getPot();
  int delaiBoutonBleu = 0;
  int delaiBoutonRouge = 0;


  public void settings() {
    size(400, 800);
  }

  public void setup() {
    surface.setTitle("Menu");
  }

  public void draw() {
    background(0, 0, 0);
    menu.actualise();
    if (delaiBoutonBleu > 0) {
      delaiBoutonBleu--;
    }
    if (delaiBoutonRouge > 0) {
      delaiBoutonRouge--;
    }
     if (boutonRougeAppuye() && delaiBoutonRouge == 0) { //quand on appuie sur le bouton bleu
      menu.cliqueBoutonRouge();
      delaiBoutonRouge = 15;
    }
    if (boutonBleuAppuye() && delaiBoutonBleu == 0) { //quand on appuie sur le bouton bleu
      menu.cliqueBoutonBleu();
      delaiBoutonBleu = 15;
    }
    if ( (dernierPot - 1 > getPot())) {
      menu.descendCurseur();
    } else if ( (dernierPot + 1 < getPot())) {
      menu.augmenteCurseur();
    }
    dernierPot = getPot();
    background(0, 0, 0);
    textSize(32);
    text(menu.getCurseur(), 50, 50);
    text(menu.getMenuActuel(), 100, 50);
    if (menu.getMenuActuel() == 7){
      menu.menuSauvLettre();
    }
    for (int i = 0; i < menu.getListeBoutonTaille(); i++) {//dessine tous les boutons
      if (i == menu.getCurseur()) {
        menu.getListeBouton().get(i).active();
      } else {
        menu.getListeBouton().get(i).desactive();
      }
      noFill();
      if (menu.getListeBouton().get(i).getChoix()) {
        stroke(menu.getListeBouton().get(i).getCouleurOn().getCouleur());
      } else {
        stroke(menu.getListeBouton().get(i).getCouleurOff().getCouleur());
      }
      rect(menu.getListeBouton().get(i).getX(), menu.getListeBouton().get(i).getY(), menu.getListeBouton().get(i).getTailleX(), menu.getListeBouton().get(i).getTailleY());
      textSize(menu.getListeBouton().get(i).getTailleTexte());
      int  j = 0;
      int k = 1;
      for (int tailleI = 0; tailleI < menu.getListeBouton().get(i).getTabTexte().length; tailleI++) {//dessine le texte du bouton
        if (menu.getListeBouton().get(i).getChoix()) {
          fill(menu.getListeBouton().get(i).getCouleurOn().getCouleur());
        } else {
          fill(menu.getListeBouton().get(i).getCouleurOff().getCouleur());
        }       
        text(menu.getListeBouton().get(i).getTabTexte()[tailleI], menu.getListeBouton().get(i).getTabCoord()[j], menu.getListeBouton().get(i).getTabCoord()[k]);
        j = j+2;
        k = j+1;
      }
    };
  }
}
