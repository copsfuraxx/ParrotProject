//Fichier pour dessiner les polygone
/*
BUT: dessiner un carre totalement aleatoire
PARAMETRE:Ø
*/
void dessinCarre(){
  square(random(displayWidth),random(displayHeight),random(max(displayWidth,displayHeight)));
}

/*
BUT: dessiner un carre de taille taille et de position aleatoire
PARAMETRE:int taille 
*/
void dessinCarre(int taille){
  square(random(displayWidth),random(displayHeight),taille);
}

/*
BUT: dessiner un carre de position x, y et de taille aleatoire
PARAMETRE:int x, int y
*/
void dessinCarre(int x, int y){
  square(x,y,random(max(displayWidth,displayHeight)));
}

/*
BUT: dessiner un carre de position x, y et de taille taille
PARAMETRE:Ø
*/
void dessinCarre(int x, int y,int taille){
  square(x,y,taille);
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

void dessinRectangle(int x, int y, int i, int j){
  rect(x,y,i,j); 
}

void dessineTriangle(){
  triangle(random(displayWidth),random(displayHeight),random(displayWidth),random(displayHeight),random(displayWidth),random(displayHeight));
}

void dessineTriangle(int x, int y){
  triangle(x,y,random(displayWidth),random(displayHeight),random(displayWidth),random(displayHeight));
}

void dessineTriangle(int x1, int y1, int x2, int y2){
  triangle(x1,y1,x2,y2,random(displayWidth),random(displayHeight));
}

void dessineTriangle(int x1, int y1, int x2, int y2, int x3, int y3){
  triangle(x1,y1,x2,y2,x3,y3);
}

void dessineEllipse(){
  ellipse(random(displayWidth), random(displayHeight),random(displayWidth), random(displayHeight));
}

void dessineEllipse(int x, int y){
  ellipse(x,y,random(displayWidth), random(displayHeight));
}

void dessineEllipse(int x1, int y1, int i, int j){
  ellipse(x1,y1,i,j);
}

void dessineCercle(){
  int i=(int)random(max(displayWidth,displayHeight))/4;
  ellipse(random(displayWidth),random(displayHeight),i,i);
}

void dessineCercle(int x, int y){
  int i=(int)random(max(displayWidth,displayHeight));
  ellipse(x,y,i,i);
}

void dessineCercle(int x, int y, int i){
  ellipse(x,y,i,i);
}

void dessinePoly(){
  dessinePoly((int)random(10)+1);
}

void dessinePoly(int i){
  int[][] coord=new int[i][2];
  for(int j=0;j<coord.length;j++){
    coord[j][0]=(int)random(displayWidth);
    coord[j][1]=(int)random(displayHeight);
  }
  dessinePoly(coord);
}

void dessinePoly(int x, int y){
  point(x,y);
}

void dessinePoly(int[][] coord){
  line(coord[0][0], coord[0][1], coord[coord.length-1][0], coord[coord.length-1][1]);
  for(int i=0;i<coord.length-1;i++){
    line(coord[i][0], coord[i][1], coord[i+1][0], coord[i+1][1]);
  }
}

void multiFormGeo(){
  multiFormGeo((int)random(10)+1);
}

void multiFormGeo(int n){
  for(int i=0;i<n;i++){
    int r=(int)random(6);
    switch(r){
      case 0:dessinCarre();break;
      case 1:dessinRectangle();break;
      case 2:dessineTriangle();break;
      case 3:dessineEllipse();break;
      case 4:dessineCercle();break;
      case 5:dessinePoly();break;
    }
  }
}

void multiFormGeoChoix(int choix){
    switch(choix){
      case 0:dessinCarre();break;
      case 1:dessinRectangle();break;
      case 2:dessineTriangle();break;
      case 3:dessineEllipse();break;
      case 4:dessineCercle();break;
      case 5:dessinePoly();break;
  }
}
