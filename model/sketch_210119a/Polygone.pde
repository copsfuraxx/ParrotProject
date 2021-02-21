//Fichier pour dessiner les polygone
/*
BUT: dessiner un carre totalement aleatoire
 PARAMETRE:Ø
 */
void dessineCarre() {
  dessineCarre(random(width), random(height));
}

/*
BUT: dessiner un carre de taille taille et de position aleatoire
 PARAMETRE:int taille 
 */
void dessineCarre(float taille) {
  dessineCarre(random(width), random(height), taille);
}

/*
BUT: dessiner un carre de position x, y et de taille aleatoire
 PARAMETRE:int x, int y
 */
void dessineCarre(float x, float y) {
  dessineCarre(x, y, random(max(width, height))/4);
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
  save.addHistorique(new Historique(1, 1, list));
}

/*
BUT: dessiner un carre totalement aleatoire
 PARAMETRE:Ø
 */
void dessineRectangle() {
  dessineRectangle(random(width), random(height));
}

/*
BUT: dessiner un carre totalement aleatoire
 PARAMETRE:Ø
 */
void dessineRectangle(float x, float y) {
  dessineRectangle(x, y, random(width)/4, random(height)/4);
}

void dessineRectangle(float x, float y, float i, float j) {
  rect(x, y, i, j);
  ArrayList list=new ArrayList();
  list.add(x);
  list.add(y);
  list.add(i);
  list.add(j);
  save.addHistorique(new Historique(1, 2, list));
}

void dessineTriangle() {
  dessineTriangle(random(width), random(height));
}

void dessineTriangle(float x, float y) {
  dessineTriangle(x, y, random(width), random(height));
}

void dessineTriangle(float x1, float y1, float x2, float y2) {
  dessineTriangle(x1, y1, x2, y2, random(width), random(height));
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
  save.addHistorique(new Historique(1, 3, list));
}

void dessineEllipse() {
  dessineEllipse(random(width), random(height));
}

void dessineEllipse(float x, float y) {
  dessineEllipse(x, y, random(width)/4, random(height)/4);
}

void dessineEllipse(float x, float y, float i, float j) {
  ellipse(x, y, i, j);
  ArrayList list=new ArrayList();
  list.add(x);
  list.add(y);
  list.add(i);
  list.add(j);
  save.addHistorique(new Historique(1, 4, list));
}

void dessineCercle() {
  dessineCercle(random(width), random(height));
}

void dessineCercle(float x, float y) {
  dessineCercle(x, y, random(max(width, height))/4);
}

void dessineCercle(float x, float y, float i) {
  ellipse(x, y, i, i);
  ArrayList list=new ArrayList();
  list.add(x);
  list.add(y);
  list.add(i);
  save.addHistorique(new Historique(1, 5, list));
}

void dessinePoly() {
  dessinePoly((int)random(10)+3);
}

void dessinePoly(int i) {
  if (i<3)return;
  float[][] coord=new float[i][2];
  for (int j=0; j<coord.length; j++) {
    coord[j][0]=random(width);
    coord[j][1]=random(height);
  }
  dessinePoly(coord);
}

void dessinePoly(float[][] coord) {
  line(coord[0][0], coord[0][1], coord[coord.length-1][0], coord[coord.length-1][1]);
  ArrayList list=new ArrayList();
  list.add(coord.length);
  for (int i=0; i<coord.length-1; i++) {
    line(coord[i][0], coord[i][1], coord[i+1][0], coord[i+1][1]);
    list.add(coord[i][0]);
    list.add(coord[i][1]);
  }
  list.add(coord[coord.length-1][0]);
  list.add(coord[coord.length-1][1]);
  save.addHistorique(new Historique(1, 6, list));
}

void multiFormGeo() {
  multiFormGeo((int)random(10)+1);
}

void multiFormGeo(int[] formeGeo) {
  for (int i=0; i<formeGeo.length; i++) {
    multiFormGeoChoix(formeGeo[i]);
  }
}

void multiFormGeo(int n) {
  for (int i=0; i<n; i++) {
    multiFormGeoChoix((int)random(6));
  }
}

void multiFormGeoChoix(int choix) {
  switch(choix) {
  case 0:
    dessineCarre();
    break;
  case 1:
    dessineRectangle();
    break;
  case 2:
    dessineTriangle();
    break;
  case 3:
    dessineEllipse();
    break;
  case 4:
    dessineCercle();
    break;
  case 5:
    dessinePoly();
    break;
  }
}
