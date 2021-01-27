#include <stdio.h>

#define MAX_OUT_CHARS 16
char   buffer[MAX_OUT_CHARS + 1];  //buffer used to format a line (+1 is for trailing 0)
int bouton1 = 2; // déclaration du bouton
int bouton2 = 3; // déclaration du bouton
int bouton3 = 4; // déclaration du bouton
int bouton4 = 5; // déclaration du bouton

int analogPin = 0; // lecture potentiometre


int etatbouton1 = 1; // etat dans lequel se trouve le bouton
int etatbouton2 = 1; // etat dans lequel se trouve le bouton
int etatbouton3 = 1; // etat dans lequel se trouve le bouton
int etatbouton4 = 1; // etat dans lequel se trouve le bouton

void setup() {

pinMode(bouton1, INPUT_PULLUP);// déclaration du bouton en entrée avec la résistance pullup
pinMode(bouton2, INPUT_PULLUP);// déclaration du bouton en entrée avec la résistance pullup
pinMode(bouton3, INPUT_PULLUP);// déclaration du bouton en entrée avec la résistance pullup
pinMode(bouton4, INPUT_PULLUP);// déclaration du bouton en entrée avec la résistance pullup

Serial.begin(9600);// ouverture port de communication
}

void loop() {
  etatbouton1 = digitalRead(bouton1);
  
  sprintf(buffer,"/%d/%d/%d/%d/%d/",map(analogRead(analogPin), 0, 1023, 0, 100), 
                             etatbouton1, digitalRead(bouton2),
                             digitalRead(bouton3), digitalRead(bouton4));  
  Serial.println(buffer);

   
}
