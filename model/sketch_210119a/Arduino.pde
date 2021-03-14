/*
Classe permettant de faire la connection entre la carte arduino et le logiciel.
 Connection sur le deuxieme port disponible (example: port dispo : CM1 et CM4, L'arduino doit être branché sur CM4)
 
 */


import processing.serial.*; 

private int num_ports;
private String[] port_list;

private Serial arduinoPort; //port usb de connection entre l'ordinateur et la carte
private String stringArduinoPort;
public final int EN_COUR_DE_CONNECTION = 0, EST_CONNECTE = 1, EST_PAS_CONNECTE = 2;
private int etatConnection;
private String[][] m = null; // valeur des input de l'arduino
private boolean connectionEtablie = false;

public void initArduino() { //etablie la connection arduino - logiciel
  num_ports = Serial.list().length;
  port_list = new String[num_ports];
    for (int i = 0; i < num_ports; i++) {
        port_list[i] = Serial.list()[i];
    }
  etatConnection = EST_PAS_CONNECTE;
  /*autoConnection();
  if (etatConnection == EST_PAS_CONNECTE){
    manualConnection();
  }*/
}

//======= établie la connection a l'arduino =========


public StringList getInstructionPourConnectionAuto(){
  StringList listeIntruction = new StringList();
  listeIntruction.append("1/ assurez vous que l'arduino est débranché de l'ordinateur avant de lancer le programme");
  listeIntruction.append("(Si elle était déjà branché, débranché la et relancez le programme");
  listeIntruction.append("2/ brancher l'arduino");
  return listeIntruction;
}

public void autoConnection() {
  /*int i = 0; //numero du port
  etatConnection = EN_COUR_DE_CONNECTION;
  while (etatConnection == EN_COUR_DE_CONNECTION) {
    try {
      arduinoPort = new Serial(this, Serial.list()[i], 9600); // établie la connection
      delay(2000);
      if (getInput() != null) {
        etatConnection = EST_CONNECTE;
      }
    }
    catch (Exception e) {
      etatConnection = EST_PAS_CONNECTE;
    }
    i++;
    println(getEtatConnection());
  }*/
      if ((Serial.list().length > num_ports) && etatConnection != EST_CONNECTE) {
        etatConnection = EST_CONNECTE;
        // determine which port the device was plugge into
        boolean str_match = false;
        if (num_ports == 0) {
            stringArduinoPort = Serial.list()[0];
        }
        else {
            // go through the current port list
            for (int i = 0; i < Serial.list().length; i++) {
                // go through the saved port list
                for (int j = 0; j < num_ports; j++) {
                    if (Serial.list()[i].equals(port_list[j])) {
                        break;
                    }
                    if (j == (num_ports - 1)) {
                        str_match = true;
                        stringArduinoPort = Serial.list()[i];
                    }
                }
            }
        }
    }
    if (etatConnection == EST_CONNECTE){
      arduinoPort = new Serial (this, stringArduinoPort, 9600);
      connectionEtablie = true;
      println("connection réussi");
    }
}

private void manualConnection() {

}


public String getEtatConnection(){
  String etat = "NULL";
  switch(etatConnection){
    case EN_COUR_DE_CONNECTION: etat = "en cours de connection";
    break;
    case EST_CONNECTE: etat = "connextion reussi";
    break;
    case EST_PAS_CONNECTE: etat = "echec de la connection";
    break;
    default: etat = "NULL";
    break;
  } 
  return etat;
}

public boolean getConnection(){
  return connectionEtablie;
}

//============= Recuperation des capteurs ===============
private void getInfoArduino() { //recupere les info de l'arduino et les separe les info dans un tableau
  String s = getInput();
  if (s != null) {
    m = matchAll(s, "[0-9]+");
  }
}

private String getInput() { //recuperer 5 infos de l'arduino (pot/b1/b2/b3/b4)
  String s = null;
  while (arduinoPort.available() > 0) {
    s = arduinoPort.readStringUntil('\n');
  }
  return s;
}


//retourne la valeur en % du potentiometre
int getPot() {
  int val = -1;
  if (m != null) {
    val = Integer.parseInt(m[0][0]);
  }  
  return val;
}


//retourne vrais si le bouton 1 est appuye sinon faux
Boolean boutonJauneAppuye() {
  Boolean val = false;
  //String[][] m = getMatch();

  if (m != null) {
    if (m[1][0].equals("0")) {
      val = true;
    }
  }
  return val;
}

//retourne vrais si le bouton 2 est appuye sinon faux
Boolean boutonVertAppuye() {
  Boolean val = false;
  //String[][] m = getMatch();
  if (m != null) {
    if (m[2][0].equals("0")) {
      val = true;
    }
  }
  return val;
}

//retourne vrais si le bouton 3 est appuye sinon faux
Boolean boutonRougeAppuye() {
  Boolean val = false;
  //String[][] m = getMatch();
  if (m != null) {
    if (m[3][0].equals("0")) {
      val = true;
    }
  }
  return val;
}

//retourne vrais si le bouton 4 est appuye sinon faux
Boolean boutonBleuAppuye() {
  Boolean val = false;
  //String[][] m = getMatch();
  if (m != null) {
    if (m[4][0].equals("0")) {
      val = true;
    }
  }
  return val;
}
