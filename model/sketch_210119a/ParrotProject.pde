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
Menu menuMosaique;
Menu menuChoixForme;
Menu menuTailleMosaique;
Menu menuChoixImage;
Menu menuNbMosaique;

private ManipulationImage manipImage;
private int w = 800, h = 450;
public void settings() {
  size(w, h);
  hmin=lmax=0;
  hmax=600;
  lmax=1300;
}
void setup() {
  background(255, 255, 255);
  StringList instructions = getInstructionPourConnectionAuto();
  initArduino();
  for (int i=0; i<instructions.size(); i++) {
    println(instructions.get(i));
  }
  save=new Save();
  pinceau = new Pinceau();
  save("image/config");
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
  creeMenuMosaique();
  creeMenuChoixForme();
  creeMenuTailleMosaique();
  creeMenuChoixImage();
  creeMenuNbMosaique();
  


  mtp.setMenuCurrent(menuDemarrage);

  strokeWeight(2);
  anim=new Animation1();
  frameRate(30);
    manipImage = new ManipulationImage(w,h);

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
      //println("test");
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

public void setImage(String cheminImage){
  manipImage.setImage(cheminImage);
}

public void dessineMosaique(int forme, int taille){
  manipImage.nouvelleForme(forme, taille);
}

private boolean imageAffiche = false;
private String tempoScreenshoot = "tempoScreenshot.png";
public void afficheImage(){
  PImage img = manipImage.getImage();
  if(img != null){
    if (!imageAffiche){
      save(tempoScreenshoot);
      background(img);
      imageAffiche = true;}
    else{background(loadImage(tempoScreenshoot)); imageAffiche = false;} //si l'image est déjà affiché on l'efface
  }
}

public Pinceau getPinceau(){
  return pinceau;
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
  pinceau=new Pinceau(new Couleur(donnee.getCouleurExt()),new Couleur(donnee.getCouleurInte()),donnee.getEpaisseur());
  dessineFormeParIdDeListe(donnee.getForme());
  switch(donnee.getZone()){
    case(1):lmin=0;lmax=0+(donnee.getTailleForme()+1)*width/3;break;
    case(2):lmin=width/3;lmax=lmin+(donnee.getTailleForme()+1)*width/3;break;
    case(3):lmin=width/3*2;lmax=lmin+(donnee.getTailleForme()+1)*width/3;break;
    case(4):lmin=0;lmax=0+(donnee.getTailleForme()+1)*width/3;
      hmin=0;hmax=0+(donnee.getTailleForme()+1)*height/3;
      break;
    case(5):lmin=width/3;lmax=lmin+(donnee.getTailleForme()+1)*width/3;
      hmin=height/3;hmax=hmin+(donnee.getTailleForme()+1)*height/3;
      break;
    case(6):lmin=width/3*2;lmax=lmin+(donnee.getTailleForme()+1)*width/3;
      hmin=height/3*2;hmax=hmin+(donnee.getTailleForme()+1)*height/3;
      break;
    case(7):break;
    case(8):break;
    case(9):break;
    case(10):break;
    case(11):break;
    case(12):break;
  }
}
if (int(keyCode)==102){
  //vert
}
if (int(keyCode)==104){
  //jaune
}
}
