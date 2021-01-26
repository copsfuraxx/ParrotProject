#include <stdio.h>

#define MAX_OUT_CHARS 16
char   buffer[MAX_OUT_CHARS + 1];  //buffer used to format a line (+1 is for trailing 0)
int bouton1 = 2; // déclaration du bouton
int bouton2 = 3; // déclaration du bouton


int etatbouton1 = 1; // etat dans lequel se trouve le bouton
int etatbouton2 = 1; // etat dans lequel se trouve le bouton
int etatprec1 = 0;
int etatprec2 = 0;
void setup() {

pinMode(bouton1, INPUT_PULLUP);// déclaration du bouton en entrée avec la résistance pullup
pinMode(bouton2, INPUT_PULLUP);// déclaration du bouton en entrée avec la résistance pullup

Serial.begin(9600);// ouverture port de communication
}

void loop() {
  etatbouton1 = digitalRead(bouton1);//etatbouton est égale à la lecture du bouton
  etatbouton2 = digitalRead(bouton2);//etatbouton est égale à la lecture du bouton

  sprintf(buffer,"%d%d",etatbouton1, etatbouton2);  
  Serial.println(buffer);

   
}
