#include <stdio.h>

#define MAX_OUT_CHARS 16
char   buffer[MAX_OUT_CHARS + 1];  //buffer used to format a line (+1 is for trailing 0)
int boutonJaune = 2; // déclaration du bouton
int boutonVert = 3; // déclaration du bouton
int boutonRouge = 4; // déclaration du bouton
int boutonBleu = 5; // déclaration du bouton

int analogPin = 0; // lecture potentiometre



void setup() {

pinMode(boutonJaune, INPUT_PULLUP);// déclaration du bouton en entrée avec la résistance pullup
pinMode(boutonVert, INPUT_PULLUP);// déclaration du bouton en entrée avec la résistance pullup
pinMode(boutonRouge, INPUT_PULLUP);// déclaration du bouton en entrée avec la résistance pullup
pinMode(boutonBleu, INPUT_PULLUP);// déclaration du bouton en entrée avec la résistance pullup

Serial.begin(9600);// ouverture port de communication
}

void loop() {
  int val = map(analogRead(analogPin), 0, 1023, 0, 100);
  sprintf(buffer,"/%d/%d/%d/%d/%d/",val,
                             digitalRead(boutonJaune), digitalRead(boutonVert),
                             digitalRead(boutonRouge), digitalRead(boutonBleu));  
  Serial.println(buffer);

   
}
