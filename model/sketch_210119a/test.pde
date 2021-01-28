

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
