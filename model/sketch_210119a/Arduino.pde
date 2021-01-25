/*
Classe permettant de faire la connection entre la carte arduino et le logiciel.
Connection sur le deuxieme port disponible (example: port dispo : CM1 et CM4, L'arduino doit être branché sur CM4)

*/

import processing.serial.*; 

Serial arduinoPort; //port usb de connection entre l'ordinateur et la carte
float val;
int bval;

void setup(){  
  printArray(Serial.list());
  arduinoPort = new Serial(this, Serial.list()[1], 9600); // établie la connection
}

/*public void settings() {
  size(450, 100);
}

void draw(){
  while (arduinoPort.available() > 0) {
    String sb = arduinoPort.readStringUntil('\n');
    if (sb != null){
      val = float(sb);
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
}*/

  
