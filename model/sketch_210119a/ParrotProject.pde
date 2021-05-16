import menuThreePoint.*;
Animation anim;
MenuThreePoint mtp;
Donnee donnee = new Donnee();
Menu menuDemarrage;
Menu menuDessin;
Menu menuCouleurUn;
Menu menuCouleurDeux;
Menu menuCouleurTrois;
Menu menuCouleurChoix;
Menu menuResume;
Menu menuForme;
Menu menuSauv ;
Menu menuChargement;

void setup() {
  background(255, 255, 255);
  StringList instructions = getInstructionPourConnectionAuto();
  initArduino();
  for (int i=0; i<instructions.size(); i++) {
    println(instructions.get(i));
  }
  save=new Save();
  pinceau = new Pinceau();

  creeMenu();
 
  int[] size = new int[2];
  size[0] = 500;
  size[1] = 1200;
  mtp = new MenuThreePoint(size);
  PApplet.runSketch(platformNames, mtp);

  creeMenuDemarrage();
  creeMenuDessin();
  creeMenuCouleurUn();
  creeMenuCouleurDeux();
  creeMenuCouleurTrois();
  creeMenuResume();
  creeMenuForme();
  creeMenuSauv();

  mtp.setMenuCurrent(menuDemarrage);

  strokeWeight(2);
  anim=new Animation1();
  frameRate(30);
}

public void settings() {
  size(800, 800);
  hmin=lmax=0;
  hmax=lmax=800;
}



int cooldownButton = 30;

boolean appuyeBoutonJaune = false;
boolean appuyeBoutonVert = false;
color c = color(255, 255, 255); //couleur background


boolean firstConnection = false;

void draw() {

  if (getConnection()) {
    if (!firstConnection) {
      delay(1000);
      firstConnection = true;
      background(c);
    }
    getInfoArduino();  
    prendreScreenshot();
    if (save.getAfficheSave()) {
      afficheForme();
      save.setAfficheSave(false);
    }
    effaceDessin();
  } else {
    if (anim.isEnd()) {
      if(anim.isAnime()==1)anim=new Animation2();
      else connection();
    } else anim.dessine();
  }
  // dessineTest(getValModifPot());
  gestionControleur();
}

private void afficheForme() {
  ArrayList<Historique> historiques = save.getHistorique();
  if (historiques.size()>0) {
    ArrayList<String> lines=new ArrayList();
    for (int i=0; i<historiques.size(); i++) {
      Historique historique=historiques.get(i);
      lines.add(historique.getId()+"/");
      ArrayList arg=historique.getArg();
      for (int j=0; j<arg.size(); j++) {
        lines.set(i, lines.get(i)+arg.get(j));
        if (j!=arg.size()-1)lines.set(i, lines.get(i)+"/");
      }
    }
    for (int i=0; i<lines.size(); i++) {
      String[] line=lines.get(i).split("/");
      pinceau.setCouleur(new Couleur(int(line[1])), new Couleur(int(line[2])));
      save.dessineFormeParId(line);
    }
  }
}

//prends un screenshot de la fenetre principal
private void prendreScreenshot() { 
  if (!boutonJauneAppuye()) {
    appuyeBoutonJaune = false;
  }
  if (boutonJauneAppuye() && appuyeBoutonJaune == false) { //quand on appuie sur le bouton jaune
    save("screenshot/screenshot-"+str(hour())+"."+str(minute())+"."+str(second())+".png");
    appuyeBoutonJaune = true;
  }
}

//efface tout les dessins de la fenetre dessin
private void effaceDessin() { 
  if (!boutonVertAppuye()) {
    appuyeBoutonVert = false;
  }
  if (boutonVertAppuye() && appuyeBoutonVert == false) { //quand on appuie sur le bouton jaune
    save.supprimeHistorique();
    background(c);
    appuyeBoutonVert = true;
  }
}

/* JOYSTICK VERSION */


boolean appuyeBoutonBleu = false;
boolean appuyeBoutonRouge = false;
private void gestionControleur() {
  if (!boutonBleuAppuye()) {
    appuyeBoutonBleu = false;
  }
  if (!boutonRougeAppuye()) {
    appuyeBoutonRouge = false;
  }
  if (boutonRougeAppuye() && appuyeBoutonRouge == false) { //quand on appuie sur le bouton bleu
    appuyeBoutonRouge = true;
  }
  if (boutonBleuAppuye() && (appuyeBoutonBleu == false )) { //quand on appuie sur le bouton bleu
    mtp.getMenuCurrent().click();
    appuyeBoutonBleu = true;
  }
  gestionJoystick();
}



private int indexY = 0;
private void gestionJoystick() {
  int jy = getJoystickY();
  /*if (jy < 5 && jy > -5){
   indexY = 0;
   }
   
   if (jy <= 25 && jy > 0){
   indexY ++;
   }
   if (jy < 45 && jy > 26){
   indexY += 2;
   }
   if(jy >= 45){
   indexY += 6;
   }
   
   if (jy <= -25 && jy < 0){
   indexY --;
   }
   if (jy < -45 && jy < -26){
   indexY -= 2;
   }
   if(jy <= -45){
   indexY -= 6;
   }*/


  int time = 250;
  if (jy >= 40) {
    mtp.getMenuCurrent().downCursor();
    delay(time);
    //indexY = 25;
  }
  if (jy <= -40) {
    mtp.getMenuCurrent().upCursor();
    delay(time);
    //indexY = -25;
  }
}
