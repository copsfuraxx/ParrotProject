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
  PImage photoTest = loadImage("test.JPG");
  photoTest.save("image/test.JPG");
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
    cleanFrame();
    appuyeBoutonVert = true;
  }
}

public void cleanFrame(){
    save.supprimeHistorique();
    background(c);  
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
    //rouge
  /*gros = (50*fenetreHeight)/350;
    petit = (7*fenetreHeight)/350; 
    moyen = (gros+petit)/2;*/
  pinceau=new Pinceau(new Couleur(donnee.getCouleurExt()),new Couleur(donnee.getCouleurInte()),donnee.getEpaisseur());
  int taille=0;
  switch(donnee.getTailleForme()){
    case 0:taille=(7*height)/350;break;
    case 1:taille=((50*height)/350+(7*height)/350)/2;break;
    case 2:taille=(50*height)/350;break;
  }
  switch(donnee.getZone()){
    case 0:lmin=0;lmax=width;hmin=0;hmax=height;break;
    case(1):lmin=0;lmax=width/2;hmin=0;hmax=height;break;
    case(2):lmin=width/3;lmax=width*2/3;hmin=0;hmax=height;break;
    case(3):lmin=width/2;lmax=width;hmin=0;hmax=height;break;
    case(4):lmin=0;lmax=width/3;hmin=0;hmax=height/3;break;
    case(5):lmin=width/3;lmax=width*2/3;hmin=0;hmax=height/3;break;
    case(6):lmin=width*2/3;lmax=width;hmin=0;hmax=height/3;break;
    case(7):lmin=0;lmax=width/3;hmin=height/3;hmax=height*2/3;break;
    case(8):lmin=width/3;lmax=width*2/3;hmin=height/3;hmax=height*2/3;break;
    case(9):lmin=width*2/3;lmax=width;hmin=height/3;hmax=height*2/3;break;
    case(10):lmin=0;lmax=width/3;hmin=0;hmin=height*2/3;hmax=height;break;
    case(11):lmin=width/3;lmax=width*2/3;hmin=height*2/3;hmax=height;break;
    case(12):lmin=width*2/3;lmax=width;hmin=height*2/3;hmax=height;break;
  }
  dessineFormeParIdDeListe(donnee.getForme(),taille);
  }
  if (boutonBleuAppuye() && (appuyeBoutonBleu == false || mtp.getMenuCurrent() == menuMosaique)) { //quand on appuie sur le bouton bleu
    mtp.getMenuCurrent().click();
    appuyeBoutonBleu = true;
  }
  gestionJoystick();
}


private void gestionJoystick() {
  int jy = getJoystickY();
  int jx = getJoystickX();


  int time = 250;
  if (jy >= 40) {
    mtp.getMenuCurrent().downCursor();
    delay(time);
  }
  if (jy <= -40) {
    mtp.getMenuCurrent().upCursor();
    delay(time);
  }
  if (jx >= 40) {
    donnee.gaucheCurseur();
    delay(time);
  }
  if (jx <= -40) {
    donnee.droiteCurseur();
    delay(time);
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
  //println("gauche");
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
  /*gros = (50*fenetreHeight)/350;
    petit = (7*fenetreHeight)/350; 
    moyen = (gros+petit)/2;*/
  pinceau=new Pinceau(new Couleur(donnee.getCouleurExt()),new Couleur(donnee.getCouleurInte()),donnee.getEpaisseur());
  int taille=0;
  switch(donnee.getTailleForme()){
    case 0:taille=(7*height)/350;break;
    case 1:taille=((50*height)/350+(7*height)/350)/2;break;
    case 2:taille=(50*height)/350;break;
  }
  switch(donnee.getZone()){
    case 0:lmin=0;lmax=width;hmin=0;hmax=height;break;
    case(1):lmin=0;lmax=width/2;hmin=0;hmax=height;break;
    case(2):lmin=width/3;lmax=width*2/3;hmin=0;hmax=height;break;
    case(3):lmin=width/2;lmax=width;hmin=0;hmax=height;break;
    case(4):lmin=0;lmax=width/3;hmin=0;hmax=height/3;break;
    case(5):lmin=width/3;lmax=width*2/3;hmin=0;hmax=height/3;break;
    case(6):lmin=width*2/3;lmax=width;hmin=0;hmax=height/3;break;
    case(7):lmin=0;lmax=width/3;hmin=height/3;hmax=height*2/3;break;
    case(8):lmin=width/3;lmax=width*2/3;hmin=height/3;hmax=height*2/3;break;
    case(9):lmin=width*2/3;lmax=width;hmin=height/3;hmax=height*2/3;break;
    case(10):lmin=0;lmax=width/3;hmin=0;hmin=height*2/3;hmax=height;break;
    case(11):lmin=width/3;lmax=width*2/3;hmin=height*2/3;hmax=height;break;
    case(12):lmin=width*2/3;lmax=width;hmin=height*2/3;hmax=height;break;
  }
  dessineFormeParIdDeListe(donnee.getForme(),taille);
}
if (int(keyCode)==102){
  //vert
}
if (int(keyCode)==104){
  //jaune
}
}
