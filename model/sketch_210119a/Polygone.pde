//Fichier pour dessiner les polygone

//fonction pour dessiner un rectangle
void dessinCarre(){
  square(random(400),random(400),random(400));
}

void dessinCarre(int taille){
  square(random(400),random(400),taille);
}

void dessinCarre(int x, int y){
  square(x,y,random(400));
}

void dessinRectangle(){
  rect(random(400),random(400),random(400),random(400));
}

void dessinRectangle(int i, int j, int type){
  if(type==0){
    rect(random(400),random(400),i,j);
  }else if(type==1){
    rect(i,j,random(400),random(400));
  }  
}
