Animation anim;
public class Animation{
  private int i;
  private ArrayList<int[]> triangles;
  
  
public Animation(){
    i=0;
    triangles=new ArrayList();
    String[] lines = loadStrings("Triangle.txt");
    for (int c=0; c<lines.length; c++) {
      String[] line=lines[c].split("/");
      if(line.length!=1){
        int[] triangle=new int[6];
        for(int c2=0;c2<6;c2++){
          triangle[c2]=int(line[c2]);
        }
        triangles.add(triangle);
      }
    }
  }
  
  public void dessine(){
    triangle2(triangles.get(i));
    i++;
  }
  
  public boolean isEnd(){return triangles.size()<=i;}
}

public void triangle2(int[] triangle){
  triangle(triangle[0]/9600f*800,triangle[1]/5400f*800,triangle[2]/9600f*800,triangle[3]/5400f*800,triangle[4]/9600f*800,triangle[5]/5400f*800);
}

void setup() {
  background(255, 255, 255);
  StringList instructions = getInstructionPourConnectionAuto();
  
  initArduino();
  for (int i=0; i<instructions.size(); i++){
    println(instructions.get(i));
  }
  save=new Save();
  pinceau = new Pinceau();
  PApplet.runSketch(platformNames, new SecondApplet());
  noFill();
  strokeWeight(2);
  anim=new Animation();
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
  if (getConnection()){
    if (!firstConnection){
      firstConnection = true;
      background(c);
    }
    getInfoArduino();  
    prendreScreenshot();
    if (save.getAfficheSave()){
      afficheForme();
      save.setAfficheSave(false);
    }
    effaceDessin();
  }
  else{
    if (anim==null || anim.isEnd()){
      anim=null;
    connection();
    }
    else anim.dessine();
  }
  // dessineTest(getValModifPot());
}

private void afficheForme(){
  ArrayList<Historique> historiques = save.getHistorique();
  if(historiques.size()>0){
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
        pinceau.setCouleur(new Couleur(int(line[1])),new Couleur(int(line[2])));
        save.dessineFormeParId(line);
      }    
  }
}

//prends un screenshot de la fenetre principal
private void prendreScreenshot(){ 
  if (!boutonJauneAppuye()) {
      appuyeBoutonJaune = false;
  }
  if (boutonJauneAppuye() && appuyeBoutonJaune == false) { //quand on appuie sur le bouton jaune
    save("screenshot/screenshot-"+str(hour())+"."+str(minute())+"."+str(second())+".png");
    appuyeBoutonJaune = true;
  }
}

//efface tout les dessins de la fenetre dessin
private void effaceDessin(){ 
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
public class SecondApplet extends PApplet {
  MenuListe menu = new MenuListe(0,save);



  public void settings() {
    size(400, 800);
  }

  public void setup() {
    surface.setTitle("Menu");
  }

  public void draw() {
    background(0, 0, 0);
    menu.actualise();

  gestionControleur();

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
  
  
  boolean appuyeBoutonBleu = false;
  boolean appuyeBoutonRouge = false;
  private void gestionControleur(){
    if (!boutonBleuAppuye()) {
      appuyeBoutonBleu = false;
    }
    if (!boutonRougeAppuye()) {
      appuyeBoutonRouge = false;
    }
     if (boutonRougeAppuye() && appuyeBoutonRouge == false) { //quand on appuie sur le bouton bleu
      menu.cliqueBoutonRouge();
      appuyeBoutonRouge = true;
    }
    if (boutonBleuAppuye() && (appuyeBoutonBleu == false || menu.getMenuActuel() == 4)) { //quand on appuie sur le bouton bleu
      menu.cliqueBoutonBleu();
      appuyeBoutonBleu = true;
    }
    gestionJoystick();
  }
  
  
  private int indexY = 0;
  private void gestionJoystick(){
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
    if (jy >= 40){
      menu.augmenteCurseur();
      delay(time);
      //indexY = 25;
    }
    if (jy <= -40){
      menu.descendCurseur();
      delay(time);
      //indexY = -25;
    }
  }
}
