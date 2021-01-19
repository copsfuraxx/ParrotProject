//Fichier pour dessiner les polygone

/*
BUT: dessiner un carre totalement aleatoire
PARAMETRE:Ø
*/
void dessinCarre(){
  square(random(displayWidth),random(displayHeight),random(max(displayWidth,displayHeight)));
}

/*
BUT: dessiner un carre totalement aleatoire
PARAMETRE:Ø
*/
void dessinCarre(int taille){
  square(random(displayWidth),random(displayHeight),taille);
}

/*
BUT: dessiner un carre totalement aleatoire
PARAMETRE:Ø
*/
void dessinCarre(int x, int y){
  square(x,y,random(max(displayWidth,displayHeight)));
}

/*
BUT: dessiner un carre totalement aleatoire
PARAMETRE:Ø
*/
void dessinRectangle(){
  rect(random(displayWidth),random(displayHeight),random(displayWidth),random(displayHeight));
}

/*
BUT: dessiner un carre totalement aleatoire
PARAMETRE:Ø
*/
void dessinRectangle(int i, int j, int type){
  if(type==0){
    rect(random(displayWidth),random(displayHeight),i,j);
  }else if(type==1){
    rect(i,j,random(displayWidth),random(displayHeight));
  }  
}

void dessineTriangle(){
  triangle(random(displayWidth),random(displayHeight),random(displayWidth),random(displayHeight),random(displayWidth),random(displayHeight));
}
