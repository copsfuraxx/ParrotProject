/*
Classe permettant de faire la connection entre la carte arduino et le logiciel.
Connection sur le deuxieme port disponible (example: port dispo : CM1 et CM4, L'arduino doit être branché sur CM4)

*/

import processing.serial.*; 

Serial arduinoPort; //port usb de connection entre l'ordinateur et la carte


void setup(){  
  printArray(Serial.list()); //liste tout les port usb disponible pour une connection pc - arduino 
  arduinoPort = new Serial(this, Serial.list()[1], 9600); // établie la connection
}

public void settings() {
  size(450, 100);
}

/*
// test avec le potentiometre 
void draw(){
  float val;
  int bval;

  while (arduinoPort.available() > 0) {
    String s = arduinoPort.readStringUntil('\n');
    if (s != null){
      val = float(s);
      bval = int(val);
    }
  }
  
  background(#C1C1C1);
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
  
  float aval = map(bval, 0, 359, 0, 100);
  int cval = int(aval);
  translate(145, 45);
  fill(0);
  textSize(32);
  text(cval+"%", 10, 20);
}
*/

// test avec deux boutons
void draw(){
  int val1 = -1;
  int val2 = -1;
  while (arduinoPort.available() > 0) {
    String s = arduinoPort.readStringUntil('\n');
    if (s != null){
      println(s);
      String[] m = match(s, "[0-9]{1}");
      val1 = Integer.valueOf(m[0]);
      val2 = Integer.valueOf(m[1]);
    }
  }
  
  background(#C1C1C1);

  if (val1 == 0){
    rect(30, 20, 50, 50);
    fill(0, 255, 0);
  }

  if (val2 == 0){
    rect(100, 20, 50, 50);
    fill(255, 0, 0);
  }
}
