

void setup(){  
  connection();

  PApplet.runSketch(platformNames, new SecondApplet());
}

public void settings() {
    size(800, 800);
}

color c = color(255,255,255); //couleur background

void draw(){
  
  getInfoArduino();  
  background(0,0,0);
  textSize(32);
  text("test",50,50);
 // dessineTest(getValModifPot());
}
/*
int getValModifPot(){
   int val;
  val = getPot();
  if (val < 15){
    val = 0;
  }else if (val < 32){
    val = 1;
  }else if (val < 50){
    val = 2;
  }else if (val < 66){ 
    val = 3;
  }else if (val < 82){
    val = 4;
  }else {
    val = 5;
  }
  return val;
  
}





void dessineTest(int val){
 
  if (boutonVertAppuye()){ //quand on appuie sur le bouton vert
    fill(0,255,0);
    multiFormGeoChoix(val);
  }
  if (boutonJauneAppuye()){ //quand on appuie sur le bouton jaune
    fill(255,255,0);
    multiFormGeoChoix(val);  
    }
  if (boutonRougeAppuye()){ //quand on appuie sur le bouton rouge
    fill(255,0,0);
    multiFormGeoChoix(val);}
  if (boutonBleuAppuye()){ //quand on appuie sur le bouton bleu
    fill(0,0,255);
    multiFormGeoChoix(val);
  }
}
String getNomFigure(int val){
  switch(val){
      case 0:return "carre";
      case 1:return "rectangle";
      case 2:return "triangle";
      case 3:return "ellipse";
      case 4:return "cercle";
      case 5:return "poly";
      default : return "erreur";
  }
}
 */
public class SecondApplet extends PApplet {
 MenuListe menu = new MenuListe(0);
 int dernierPot = getPot();
 int delaiBoutonBleu = 0;


 public void settings(){
    size(400,800);
 }
 
 public void setup(){
   surface.setTitle("Menu");

 }
 
 public void draw(){
  background(0,0,0);
  if (delaiBoutonBleu > 0){
  delaiBoutonBleu--;
  }
  if (boutonBleuAppuye() && delaiBoutonBleu == 0){ //quand on appuie sur le bouton bleu
    menu.cliqueBoutonBleu();
    delaiBoutonBleu = 15;
    System.out.println("test");
  }
  if ( (dernierPot - 1 > getPot())){
     menu.descendCurseur();
   }
   else if ( (dernierPot + 1 < getPot())){
     menu.augmenteCurseur();
   }
   dernierPot = getPot();
    background(0,0,0);
  textSize(32);
  text(menu.getCurseur(),50,50);
  text(menu.getMenuActuel(),100,50);
 
  for (int i = 0; i < menu.getListeBoutonTaille();i++){
    if (i == menu.getCurseur()){
      menu.getListeBouton().get(i).active();
    }
    else {
      menu.getListeBouton().get(i).desactive();

    }
    noFill();
    if (menu.getListeBouton().get(i).getChoix()){
      stroke(menu.getListeBouton().get(i).getCouleurOn());
    }else{
      stroke(menu.getListeBouton().get(i).getCouleurOff());

    }
    rect(menu.getListeBouton().get(i).getX(),menu.getListeBouton().get(i).getY(),menu.getListeBouton().get(i).getTailleX(),menu.getListeBouton().get(i).getTailleY());
    textSize(menu.getListeBouton().get(i).getTailleTexte());
    int  j = 0;
    int k = 1;
    for(int tailleI = 0 ; tailleI < menu.getListeBouton().get(i).getTabTexte().length;tailleI++){
      text(menu.getListeBouton().get(i).getTabTexte()[tailleI], menu.getListeBouton().get(i).getTabCoord()[j],menu.getListeBouton().get(i).getTabCoord()[k]);
      j = j+2;
      k = j+1;
    }
  };
    }
    
 }
   



   
 
