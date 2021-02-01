import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.serial.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class sketch_210119a extends PApplet {


/*
Classe permettant de faire la connection entre la carte arduino et le logiciel.
Connection sur le deuxieme port disponible (example: port dispo : CM1 et CM4, L'arduino doit être branché sur CM4)

*/

 

Serial arduinoPort; //port usb de connection entre l'ordinateur et la carte

public void connection(){ //etablie la connection arduino - logiciel
  printArray(Serial.list()); //liste tout les port usb disponible pour une connection pc - arduino 
  arduinoPort = new Serial(this, Serial.list()[1], 9600); // établie la connection
}

private String[][] m = null;

private String getInput(){ //recuperer 5 infos de l'arduino (pot/b1/b2/b3/b4)
  String s = null;
  while (arduinoPort.available() > 0) {
    s = arduinoPort.readStringUntil('\n');
  }
  return s;
}

private void getInfoArduino(){ //recupere les info de l'arduino et les separe les info dans un tableau
  String s = getInput();
  if (s != null){
    m = matchAll(s, "[0-9]+");
    //println(m[1][0]);
  }
  //return m;
}

//retourne la valeur en % du potentiometre
public int getPot(){
  int val = -1;
  if (m != null){
    val = Integer.parseInt(m[0][0]);
  }  
  return val;
}

//retourne vrais si le bouton 1 est appuye sinon faux
public Boolean boutonJauneAppuye(){
  Boolean val = false;
  //String[][] m = getMatch();

  if (m != null){
    if (m[1][0].equals("0")){
      val = true;
    }
  }
  return val;
}

//retourne vrais si le bouton 2 est appuye sinon faux
public Boolean boutonVertAppuye(){
  Boolean val = false;
  //String[][] m = getMatch();
  if (m != null){
    if (m[2][0].equals("0")){
      val = true;
    }
  }
  return val;
}

//retourne vrais si le bouton 3 est appuye sinon faux
public Boolean boutonRougeAppuye(){
  Boolean val = false;
  //String[][] m = getMatch();
  if (m != null){
    if (m[3][0].equals("0")){
      val = true;
    }
  }
  return val;
}

//retourne vrais si le bouton 4 est appuye sinon faux
public Boolean boutonBleuAppuye(){
  Boolean val = false;
  //String[][] m = getMatch();
  if (m != null){
    if (m[4][0].equals("0")){
      val = true;
    }
  }
  return val;
}
class Bouton { 
  private String[] tabTexte;
  private float x,y,tailleX,tailleY,tailleTexte;
  public Bouton (String texte, float x, float y,float tailleX,float tailleY){
    
    this.x = x;
    this.y = y;
    this.tailleX = tailleX;
    this.tailleY = tailleY;
    this.tabTexte = this.separeLigne(texte);
    this.adapteTexte();
  }
  
  public float centreX(){
    return (x+tailleX/2);
  }
  
  public float centreY(){
    return (y+tailleY/2);
  }
  
  public void setTailleTexte(float nouvVal){
    this.tailleTexte = nouvVal;
  }
  
  /*
  PARAMETRE : les tailles des bordures du bouton
  BUT: adapter le texte pour qu'il soit à l'intérieur du bouton
  */
  private void adapteTexte (){

    if (this.tailleY * 0.50f < this.tailleX * 0.50f){
     this.tailleTexte = this.tailleY * 0.50f;
    }else{
     this.tailleTexte = this.tailleX * 0.50f;
    }

      for (int i = 1; i < tabTexte.length; i++){
        this.tailleTexte = this.tailleTexte * 0.78f;
      }
  }
   /*
  PARAMETRE : les tailles des bordures du bouton et le texte du bouton
  BUT: donner un tableau des x et y des différentes lignes du texte
  il est de la forme {x1,y1,x2,y2...}
  */
  private float[] placeLigne(){
    float[] tabReturn = new float[2 * tabTexte.length] ;
    if (tabTexte.length == 1 ){
      tabReturn[0] = x + tailleX/16;
      tabReturn[1] = y + 5*tailleY/8;
    }
    else{
      int j;
      float placeTexte;
    for (int i = 0; i < tabReturn.length; i = i+2){
      j = i+1;
      placeTexte = i/2 +1;
      tabReturn[i] = this.x + this.tailleX/16;
      tabReturn[j] = this.y + (placeTexte * this.tailleY)/(this.tabTexte.length + 1) + this.tailleTexte * 0.15f * placeTexte ;
    }
    
    }
    return tabReturn;
  }
  
  
  /**
  *PARAMETRE : le texte du bouton
  *BUT : crée un tableau qui représente  
  **/
  
  private String[] separeLigne(String texte){
    int coef;
    if ((this.tailleX/this.tailleY > 0.88f) && (this.tailleX/this.tailleY < 1.12f)){
      coef = 5 + (int) (this.tailleX /this.tailleY);
    }else{
      coef = 5 + (int) (this.tailleX *2 /this.tailleY);//coef pour trouver le nombre de caractère pour chaque lignes
    }
    System.out.println("test");
    if (texte.length() < coef){
      return new String[]{texte};
    }
    ArrayList<String> arrayChaine= new ArrayList<String>();
    String chaineCour;
    Boolean pasDecouper = true;//condition finale ou l'on teste si le texte est encore découpable
    while (pasDecouper){
      
      if (texte.lastIndexOf(" ",coef) != -1){
        
        if (coef + 1 < texte.length()&& texte.charAt(coef+1) == ' ' ){
           
          chaineCour = texte.substring(0,coef + 1);
          texte = texte.substring(coef+2, texte.length());
          arrayChaine.add(chaineCour);
        }
        else {
        chaineCour = texte.substring(0,texte.lastIndexOf(" ",coef)  );
        texte = texte.substring(texte.lastIndexOf(" ",coef)+1, texte.length());
        arrayChaine.add(chaineCour);
        }
      
      }
      else {
        chaineCour = texte.substring(0,coef);
        texte = texte.substring(coef,texte.length());
        arrayChaine.add(chaineCour);
      }
      if (texte.length() <= coef){
        pasDecouper = false;
        arrayChaine.add(texte);
      }
          System.out.println(texte);

    }
    
    String[] tabChaine = new String[arrayChaine.size()];
    for(int i = 0;i < arrayChaine.size();i++){
      tabChaine[i] = arrayChaine.get(i);
    }
  return tabChaine;
  
  }
  
  
  
 public  void dessineBouton(){
    /*
    BUT : dessiner le bouton
    PARAMETRE : Ø
    */
    float[] tabCoord = this.placeLigne();
    noFill();
    rect(x,y,tailleX,tailleY);
    textSize(tailleTexte);
    int  j = 0;
    int k = 1;
    for(int i = 0 ; i < tabTexte.length;i++){
      text(tabTexte[i], tabCoord[j],tabCoord[k]);
      j = j+2;
      k = j+1;
    }
  };
}
public class Mathematique{
  //public static final AFFINE=1;
  
  private int fonction;
  
  public Mathematique(int fonction){
    this.fonction=fonction;
  }
}
class Menu{
  
  private ArrayList<Bouton> listeBouton;
  
  public void menuDemarrage(){
    Bouton start = new Bouton("start", 100 , 100, 25,25);
    Bouton quitter = new Bouton("start", 100 , 100, 25,25);
  }
  
  
}

//Fichier pour dessiner les polygone
/*
BUT: dessiner un carre totalement aleatoire
PARAMETRE:Ø
*/
public void dessinCarre(){
  square(random(displayWidth),random(displayHeight),random(max(displayWidth,displayHeight)));
}

/*
BUT: dessiner un carre de taille taille et de position aleatoire
PARAMETRE:int taille 
*/
public void dessinCarre(int taille){
  square(random(displayWidth),random(displayHeight),taille);
}

/*
BUT: dessiner un carre de position x, y et de taille aleatoire
PARAMETRE:int x, int y
*/
public void dessinCarre(int x, int y){
  square(x,y,random(max(displayWidth,displayHeight)));
}

/*
BUT: dessiner un carre de position x, y et de taille taille
PARAMETRE:Ø
*/
public void dessinCarre(int x, int y,int taille){
  square(x,y,taille);
}

/*
BUT: dessiner un carre totalement aleatoire
PARAMETRE:Ø
*/
public void dessinRectangle(){
  rect(random(displayWidth),random(displayHeight),random(displayWidth),random(displayHeight));
}

/*
BUT: dessiner un carre totalement aleatoire
PARAMETRE:Ø
*/
public void dessinRectangle(int i, int j, int type){
  if(type==0){
    rect(random(displayWidth),random(displayHeight),i,j);
  }else if(type==1){
    rect(i,j,random(displayWidth),random(displayHeight));
  }  
}

public void dessinRectangle(int x, int y, int i, int j){
  rect(x,y,i,j); 
}

public void dessineTriangle(){
  triangle(random(displayWidth),random(displayHeight),random(displayWidth),random(displayHeight),random(displayWidth),random(displayHeight));
}

public void dessineTriangle(int x, int y){
  triangle(x,y,random(displayWidth),random(displayHeight),random(displayWidth),random(displayHeight));
}

public void dessineTriangle(int x1, int y1, int x2, int y2){
  triangle(x1,y1,x2,y2,random(displayWidth),random(displayHeight));
}

public void dessineTriangle(int x1, int y1, int x2, int y2, int x3, int y3){
  triangle(x1,y1,x2,y2,x3,y3);
}

public void dessineEllipse(){
  ellipse(random(displayWidth), random(displayHeight),random(displayWidth), random(displayHeight));
}

public void dessineEllipse(int x, int y){
  ellipse(x,y,random(displayWidth), random(displayHeight));
}

public void dessineEllipse(int x1, int y1, int i, int j){
  ellipse(x1,y1,i,j);
}

public void dessineCercle(){
  int i=(int)random(max(displayWidth,displayHeight))/4;
  ellipse(random(displayWidth),random(displayHeight),i,i);
}

public void dessineCercle(int x, int y){
  int i=(int)random(max(displayWidth,displayHeight));
  ellipse(x,y,i,i);
}

public void dessineCercle(int x, int y, int i){
  ellipse(x,y,i,i);
}

public void dessinePoly(){
  dessinePoly((int)random(10)+1);
}

public void dessinePoly(int i){
  int[][] coord=new int[i][2];
  for(int j=0;j<coord.length;j++){
    coord[j][0]=(int)random(displayWidth);
    coord[j][1]=(int)random(displayHeight);
  }
  dessinePoly(coord);
}

public void dessinePoly(int x, int y){
  point(x,y);
}

public void dessinePoly(int[][] coord){
  line(coord[0][0], coord[0][1], coord[coord.length-1][0], coord[coord.length-1][1]);
  for(int i=0;i<coord.length-1;i++){
    line(coord[i][0], coord[i][1], coord[i+1][0], coord[i+1][1]);
  }
}

public void multiFormGeo(){
  multiFormGeo((int)random(10)+1);
}

public void multiFormGeo(int n){
  for(int i=0;i<n;i++){
    int r=(int)random(6);
    switch(r){
      case 0:dessinCarre();break;
      case 1:dessinRectangle();break;
      case 2:dessineTriangle();break;
      case 3:dessineEllipse();break;
      case 4:dessineCercle();break;
      case 5:dessinePoly();break;
    }
  }
}

public void multiFormGeoChoix(int choix){
    switch(choix){
      case 0:dessinCarre();break;
      case 1:dessinRectangle();break;
      case 2:dessineTriangle();break;
      case 3:dessineEllipse();break;
      case 4:dessineCercle();break;
      case 5:dessinePoly();break;
  }
}


public void setup(){  
  PApplet.runSketch(platformNames, new SecondApplet());
  connection();
}

public void settings() {
    size(800, 800);
}

int c = color(255,255,255); //couleur background

public void draw(){
  
  getInfoArduino();  
  
  dessineTest(getValModifPot());
}

public int getValModifPot(){
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





public void dessineTest(int val){
 
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
public String getNomFigure(int val){
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
  
public class SecondApplet extends PApplet {
  
 public void settings(){
    size(200,100);
 }
 
 public void setup(){
   surface.setTitle("figure actuelle");
 }
 
 public void draw(){
  background(0,0,0);
  textSize(32);
  text(getNomFigure(getValModifPot()), 50, 50);
   
 }
   
 }
  










/*void setup(){  

  connection();
}

public void settings() {
    size(800, 800);
}

color c = color(255,255,255); //couleur background

void draw(){
  
  getInfoArduino();  
  
  dessineTest();
}

void dessineTest(){
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
  

void setup(){  
    //test coucou les cons

  connection();
}

public void settings() {
    size(450, 100);
}

color c = color(255,255,255); //couleur background

//test avec model test 1 (4 boutons + un pot)
void draw(){
  
  //background(#C1C1C1);
  getInfoArduino(); //recupere les nouvelles info de l'arduino /!\ à appeller une fois avant d'utiliser les boutons/pot 
  
  dessinePot();
}

// test avec le potentiometre 
void dessinePot(){
  int val;
  float bval = 0;
  val = getPot();
  bval = map(val,0,100,0,360);
  
  
  if (boutonVertAppuye()){ //quand on appuie sur le bouton vert
    c = color(0,255,0);  
  }
  if (boutonJauneAppuye()){ //quand on appuie sur le bouton jaune
    c = color(255,255,0);  }
  if (boutonRougeAppuye()){ //quand on appuie sur le bouton rouge
    c = color(255,0,0);  }
  if (boutonBleuAppuye()){ //quand on appuie sur le bouton bleu
    c = color(0,0,255);
  }

  background(c);
  noFill();
  rect(30, 20, 360, 55);
  
  if(bval >= 0 && bval < 120){
    fill(0, 255, 0);
  }

  if(bval >= 120 && bval < 240){
    fill(255, 204, 51);
  }

  if(bval >= 240 && bval <= 360){
    fill(255, 0, 0);
  }
  rect(30, 20, bval, 55);
  
  translate(145, 45);
  fill(0);
  textSize(32);
  text(val+"%", 10, 20);
}
*/
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "sketch_210119a" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
