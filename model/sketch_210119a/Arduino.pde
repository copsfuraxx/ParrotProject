/*
Classe permettant de faire la connection entre la carte arduino et le logiciel.
Connection sur le deuxieme port disponible (example: port dispo : CM1 et CM4, L'arduino doit être branché sur CM4)

*/

import processing.serial.*; 

Serial arduinoPort; //port usb de connection entre l'ordinateur et la carte

void connection(){ //etablie la connection arduino - logiciel
  printArray(Serial.list()); //liste tout les port usb disponible pour une connection pc - arduino 
  arduinoPort = new Serial(this, Serial.list()[1], 9600); // établie la connection
}


String getInput(){ //recuperer 5 infos de l'arduino (pot/b1/b2/b3/b4)
  String s = null;
  while (arduinoPort.available() > 0) {
    s = arduinoPort.readStringUntil('\n');
  }
  return s;
}

//retourne la valeur en % du potentiometre


//retourne vrais si le bouton 1 est appuye sinon faux
Boolean getBoutonUn(){
  Boolean val = false;
  String s = getInput();
  if (s != null){
    String[][] m = matchAll(s, "([0-9]+)");
    if (m != null){
      if (m[1][0] == "0"){
        val = true;
      }
    }
  }
  return val;
}

//retourne vrais si le bouton 2 est appuye sinon faux
Boolean getBoutonDeux(){
  Boolean val = false;
  String s = getInput();
  if (s != null){
    String[][] m = matchAll(s, "([0-9]+)");
    if (m != null){
      if (m[2][0] == "0"){
        val = true;
      }
    }
  }
  return val;
}

//retourne vrais si le bouton 3 est appuye sinon faux
Boolean getBoutonTrois(){
  Boolean val = false;
  String s = getInput();
  if (s != null){
    String[][] m = matchAll(s, "([0-9]+)");
    if (m != null){
      if (m[3][0] == "0"){
        val = true;
      }
    }
  }
  return val;
}

//retourne vrais si le bouton 4 est appuye sinon faux
Boolean getBoutonQuatre(){
  Boolean val = false;
  String s = getInput();
  if (s != null){
    String[][] m = matchAll(s, "([0-9]+)");
    if (m != null){
      if (m[4][0] == "0"){
        val = true;
      }
    }
  }
  return val;
}
