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


String getInput(){
  String s = null;
  while (arduinoPort.available() > 0) {
    s = arduinoPort.readStringUntil('\n');
  }
  return s;
}
