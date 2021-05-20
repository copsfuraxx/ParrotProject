import menuThreePoint.*;
Animation anim;
MenuThreePoint mtp;
Donnee donnee = new Donnee();
Menu menuDemarrage;
Menu menuCouleurUnExt;
Menu menuCouleurDeuxExt;
Menu menuCouleurTroisExt;
Menu menuCouleurChoixExt;
Menu menuCouleurUnInte;
Menu menuCouleurDeuxInte;
Menu menuCouleurTroisInte;
Menu menuCouleurChoixInte;
Menu menuForme;
Menu menuSauv ;
Menu menuChargement;
Menu menuPinceau;
Menu menuValeur;
Menu menuEpaisseur;
Menu menuTailleForme;
Menu menuZone;


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
  creeMenuCouleurUnInte();
  creeMenuCouleurDeuxInte();
  creeMenuCouleurTroisInte();
  creeMenuCouleurChoixInte();
  creeMenuCouleurUnExt();
  creeMenuCouleurDeuxExt();
  creeMenuCouleurTroisExt();
  creeMenuCouleurChoixExt();
  creeMenuForme();
  creeMenuSauv();
  creeMenuChargement();
  creeMenuPinceau();
  creeMenuEpaisseur();
  creeMenuValeur();
  creeMenuTailleForme();
  creeMenuZone();
  


  mtp.setMenuCurrent(menuDemarrage);

  strokeWeight(2);
  anim=new Animation1();
  frameRate(30);
}

public void settings() {
  size(1300, 600);
  hmin=lmax=0;
  hmax=600;
  lmax=1300;
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
      println("test");
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
      if (anim.isAnime()==1)anim=new Animation2();
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
  int jx = getJoystickX();

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
  if (jx >= 40) {
    //donnee.gaucheCurseur();
    println("gauche");
    delay(time);
    //indexY = 25;
  }
  if (jx <= -40) {
    //donnee.droiteCurseur();
    delay(time);
    //indexY = -25;
  }
  println(jx);
}
void keyPressed(){
if (int(keyCode)==38){
  mtp.getMenuCurrent().upCursor();
}
if (int(keyCode)==40){
  mtp.getMenuCurrent().downCursor();
}
if (int(keyCode)==39){
  println("gauche");
 donnee.gaucheCurseur();
}
if (int(keyCode)==37){
  donnee.droiteCurseur();
}
if (int(keyCode)==98){
    mtp.getMenuCurrent().click();
}
if (int(keyCode)==100){
  //rouge
}
if (int(keyCode)==102){
  //vert
}
if (int(keyCode)==104){
  //jaune
}
}
