Animation anim;
public class Animation{
  private int i;
  private ArrayList<int[]> triangles;
  
  public Animation(){
    i=0;
    triangles=new ArrayList();
    triangles.add(new int[]{2280,440,1820,530,1630,860});
    triangles.add(new int[]{1840,500,1570,960,1330,720});
    triangles.add(new int[]{1620,870,1700,820,1650,970});
    triangles.add(new int[]{1620,870,1570,960,1670,1060});
    triangles.add(new int[]{1330,720,1410,1180,1800,1190});
    triangles.add(new int[]{1330,720,910,1150,1410,1180});
    triangles.add(new int[]{940,1660,910,1150,1410,1180});
    triangles.add(new int[]{1290,1300,1170,1300,1230,1360});
    triangles.add(new int[]{940,1660,1410,1180,1250,1560});
    triangles.add(new int[]{1250,1560,1410,1180,1800,1190});
    triangles.add(new int[]{1250,1560,940,1660,800,2230});
    triangles.add(new int[]{1250,1560,1800,1190,1680,1770});
    triangles.add(new int[]{1250,1560,1130,1730,1590,1730});
    triangles.add(new int[]{1130,1730,1590,1730,1090,1930});
    triangles.add(new int[]{1130,1730,1070,2000,900,2080});
    triangles.add(new int[]{1800,1190,2360,1780,2160,2120});
    triangles.add(new int[]{1800,1190,2160,2120,1680,1770});
    triangles.add(new int[]{2160,2120,1590,1730,1560,2310});
    triangles.add(new int[]{1590,1730,1560,2310,1490,1770});
    triangles.add(new int[]{4860,2850,4930,2850,4895,2800});
    triangles.add(new int[]{4970,2850,5070,2850,4960,2530});
    triangles.add(new int[]{5010,2650,4960,2530,5140,2530});
    triangles.add(new int[]{5180,2850,5330,2740,5250,2670});
    triangles.add(new int[]{5500,2850,5330,2740,5390,2670});
    triangles.add(new int[]{5250,2670,5390,2670,5310,2530});
    triangles.add(new int[]{5540,2850,5520,2530,5650,2540});
    triangles.add(new int[]{5710,2850,5610,2670,5700,2680});
    triangles.add(new int[]{5800,2850,5780,2530,5910,2540});
    triangles.add(new int[]{5970,2850,5870,2670,5960,2680});
    triangles.add(new int[]{6160,2850,6030,2670,6280,2670});
    triangles.add(new int[]{6030,2670,6280,2670,6160,2530});
    triangles.add(new int[]{6390,2850,6490,2850,6440,2590});
    triangles.add(new int[]{6440,2590,6370,2530,6490,2530});
    //triangles.add(new int[]{});
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
}

int delaiBoutonJaune = 0;
color c = color(255, 255, 255); //couleur background

void draw() {
  if (getConnection()){
    getInfoArduino();  
    prendreScreenshot();
  }
  else{
    if (anim.isEnd()){
      delay(2000);
      background(color(255,255,255));
      connection();
    }
    else anim.dessine();
  }
  // dessineTest(getValModifPot());
}

//prends un screenshot de la fenetre principal
private void prendreScreenshot(){ 
  if (delaiBoutonJaune > 0) {
      delaiBoutonJaune--;
  }
  if (boutonJauneAppuye() && delaiBoutonJaune == 0) { //quand on appuie sur le bouton jaune
    save("screenshot/screenshot-"+str(hour())+"."+str(minute())+"."+str(second())+".png");
    delaiBoutonJaune = 15;
  }
}

public class SecondApplet extends PApplet {
  MenuListe menu = new MenuListe(0,save);
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
