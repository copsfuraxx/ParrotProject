//Fichier pour dessiner les polygone
/*
BUT: dessiner un carre totalement aleatoire
 PARAMETRE:Ø
 */
void dessineCarre() {
  dessineCarre(random(lmin,lmax), random(hmin,hmax));
}

/*
BUT: dessiner un carre de taille taille et de position aleatoire
 PARAMETRE:int taille 
 */
void dessineCarre(float taille) {
  dessineCarre(random(lmin,lmax), random(hmin,hmax), taille);
}

/*
BUT: dessiner un carre de position x, y et de taille aleatoire
 PARAMETRE:int x, int y
 */
void dessineCarre(float x, float y) {
  dessineCarre(x, y, random(min(lmin,hmin),max(lmax,hmax)));
}

/*
BUT: dessiner un carre de position x, y et de taille taille
 PARAMETRE:Ø
 */
void dessineCarre(float x, float y, float taille) {
  square(x, y, taille);
  ArrayList list=new ArrayList();
  list.add(x);
  list.add(y);
  list.add(taille);
  save.addHistorique(new Historique(0, list));
}

/*
BUT: dessiner un carre totalement aleatoire
 PARAMETRE:Ø
 */
void dessineRectangle() {
  dessineRectangle(random(lmin,lmax), random(hmin,hmax));
}

/*
BUT: dessiner un carre totalement aleatoire
 PARAMETRE:Ø
 */
void dessineRectangle(float x, float y) {
  dessineRectangle(x, y, random(lmin,lmax), random(hmin,hmax));
}

void dessineRectangle(float x, float y, float i, float j) {
  rect(x, y, i, j);
  ArrayList list=new ArrayList();
  list.add(x);
  list.add(y);
  list.add(i);
  list.add(j);
  save.addHistorique(new Historique(1, list));
}

void dessineTriangle() {
  dessineTriangle(random(lmin,lmax), random(hmin,hmax));
}

void dessineTriangle(float x, float y) {
  dessineTriangle(x, y, random(lmin,lmax), random(hmin,hmax));
}

void dessineTriangle(float x1, float y1, float x2, float y2) {
  dessineTriangle(x1, y1, x2, y2, random(lmin,lmax), random(hmin,hmax));
}

void dessineTriangle(float x1, float y1, float x2, float y2, float x3, float y3) {
  triangle(x1, y1, x2, y2, x3, y3);
  ArrayList list=new ArrayList();
  list.add(x1);
  list.add(y1);
  list.add(x2);
  list.add(y2);
  list.add(x3);
  list.add(y3);
  save.addHistorique(new Historique(2, list));
}

void dessineEllipse() {
  dessineEllipse(random(lmin,lmax), random(hmin,hmax));
}

void dessineEllipse(float x, float y) {
  dessineEllipse(x, y, random(lmin,lmax)/4, random(hmin,hmax)/4);
}

void dessineEllipse(float x, float y, float i, float j) {
  ellipse(x, y, i, j);
  ArrayList list=new ArrayList();
  list.add(x);
  list.add(y);
  list.add(i);
  list.add(j);
  save.addHistorique(new Historique(3, list));
}

void dessineCercle() {
  dessineCercle(random(lmin,lmax), random(hmin,hmax));
}

void dessineCercle(float x, float y) {
  dessineCercle(x, y, random(min(lmin,hmin),max(lmax,hmax)));
}

void dessineCercle(float x, float y, float i) {
  ellipse(x, y, i, i);
  ArrayList list=new ArrayList();
  list.add(x);
  list.add(y);
  list.add(i);
  save.addHistorique(new Historique(4, list));
}

public float[][] dessinePoly() {
  return dessinePoly(random(lmin,lmax), random(hmin,hmax));
}

public float[][] dessinePoly(int nbrCotes) {
  return dessinePoly(random(lmin,lmax), random(hmin,hmax),random(min(lmin,hmin),max(lmax,hmax)),random(360),nbrCotes);
}

public float[][] dessinePoly(float x, float y){
  return dessinePoly(x, y,random(min(lmin,hmin),max(lmax,hmax)));
}

public float[][] dessinePoly(float x, float y, float taille){
  return dessinePoly(x,y,taille,random(360));
}

public float[][] dessinePoly(float x, float y, float taille, float rota) {
  return dessinePoly(x, y, taille, rota, int(random(3,10)));
}

public float[][] dessinePoly(float x, float y, float taille, float rota, int nbrCotes) {
  if(nbrCotes<3)return null;
  float[][] out=new float[nbrCotes][2];
  float x1, x2, x3, y1, y2, y3;
  x2=x+taille/2 - x;
  y2=y - y;
  x1=x2*cos(rota)+y2*sin(rota)+x;
  y1=-x2*sin(rota)+y2*cos(rota)+y;
  
  float a=(360f/nbrCotes)*PI/180;
  
  for(int i=0;i<nbrCotes;i++){
    out[i][0]=x1;
    out[i][1]=y1;
    x2=x1 - x;
    y2=y1 - y;
    x3=x2*cos(a)+y2*sin(a)+x;
    y3=-x2*sin(a)+y2*cos(a)+y;
    //noStroke();
    stroke(pinceau.getCouleurRemplissage());
    triangle(x1,y1,x,y,x3,y3);
    line(x1,y1,x,y);
    stroke(pinceau.getCouleur());
    line(x1,y1,x3,y3);
    x1=x3;
    y1=y3;
  }
  ArrayList list=new ArrayList();
  list.add(x);
  list.add(y);
  list.add(taille);
  list.add(rota);
  list.add(nbrCotes);
  save.addHistorique(new Historique(5, list));
  return out;
}
