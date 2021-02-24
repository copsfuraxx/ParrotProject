//public class Mathematique{
//  //public static final AFFINE=1;

//  private int fonction;

//  public Mathematique(int fonction){
//    this.fonction=fonction;
//  }
//}

public void fractaleCarre() {
  int r=int(random(0,2));
  if(r==0)fractaleCarre(random(60,90));
  else fractaleCarre(-random(60,90));
}

public void fractaleCarre(float angle) {
  fractaleCarre(random(width), random(height), angle);
}

public void fractaleCarre(float x, float y) {
  fractaleCarre(x, y, random(60,90));
}

public void fractaleCarre(float x, float y, float angle) {
  fractaleCarre(x, y, angle,random(max(width,height)/4));
}

public void fractaleCarre(float x, float y, float angle, float taille) {
  fractaleCarre(x, y, angle, taille, random(360));
}

public void fractaleCarre(float x, float y, float angle, float taille, float rota) {
  if(angle>90 || angle<-90)return;
  if(angle>-60 && angle<60)return;
  if (x+taille>width)x-=taille;
  if (y+taille>height)y-=taille;
  float x1, x2, y1, y2, x3, y3, x4, y4;
  x2=x+taille - x;
  y2=y - y;
  x1=x2*cos(rota)+y2*sin(rota)+x;
  y1=-x2*sin(rota)+y2*cos(rota)+y;

  x2=x - x1;
  y2=y - y1;
  x3=x2*cos(90*PI/180)+y2*sin(90*PI/180)+x1;
  y3=-x2*sin(90*PI/180)+y2*cos(90*PI/180)+y1;
  
  x2=x1 - x3;
  y2=y1 - y3;
  x4=x2*cos(90*PI/180)+y2*sin(90*PI/180)+x3;
  y4=-x2*sin(90*PI/180)+y2*cos(90*PI/180)+y3;

  fractalKock(x1, y1, x, y, angle);
  fractalKock(x3, y3, x1, y1, angle);
  fractalKock(x4, y4, x3, y3, angle);
  fractalKock(x, y, x4, y4, angle);
}

public void floconKoch() {
  fractaleTriangle(60);
}

public void fractaleTriangle() {
  int r=int(random(0,2));
  if(r==0)fractaleTriangle(random(60,90));
  else fractaleTriangle(-random(60,90));
}

public void fractaleTriangle(float angle) {
  fractaleTriangle(random(width), random(height), angle);
}

public void fractaleTriangle(float x, float y) {
  fractaleTriangle(x, y, random(60,90));
}

public void fractaleTriangle(float x, float y, float angle) {
  fractaleTriangle(x, y, angle,random(max(width,height)/4));
}

public void fractaleTriangle(float x, float y, float angle, float taille) {
  fractaleTriangle(x, y, angle, taille, random(130));
}

public void fractaleTriangle(float x, float y, float angle, float taille, float rota) {
  if(angle>90 || angle<-90)return;
  if(angle>-60 && angle<60)return;
  if (x+taille>width)x-=taille;
  if (y+taille>height)y-=taille;
  float x1, x2, y1, y2, x3, y3;
  x2=x - (x+taille);
  y2=y - y;
  x1=x2*cos(rota)+y2*sin(rota)+(x+taille);
  y1=-x2*sin(rota)+y2*cos(rota)+y;

  x2=x1 - x;
  y2=y1 - y;
  x3=x2*cos(1.0472)+y2*sin(1.0472)+x;
  y3=-x2*sin(1.0472)+y2*cos(1.0472)+y;

  fractalKock(x, y, x1, y1, angle);
  fractalKock(x1, y1, x3, y3, angle);
  fractalKock(x3, y3, x, y, angle);
}

public void koch() {
  fractalKock(60);
}

public void cesaro() {
  fractalKock(85);
}

public void fractalKock(){
  fractalKock(random(60,90));
}

public void fractalKock(float angle){
  fractalKock(random(width), random(height), angle);
}

public void fractalKock(float x, float y) {
  fractalKock(x, y, random(width), random(height));
}

public void fractalKock(float x, float y, float angle) {
  fractalKock(x, y, random(width), random(height), angle);
}

public void fractalKock(float x1, float y1, float x2, float y2) {
  fractalKock(x1, y1, x2, y2, random(60,90));
}

public void fractalKock(float x1, float y1, float x2, float y2, float angle) {
  if(angle>90 || angle<-90)return;
  if(angle>-60 && angle<60)return;
  fractalKock(x1, y1, x2, y2, angle, 5);
  ArrayList list=new ArrayList();
  list.add(x1);
  list.add(y1);
  list.add(x2);
  list.add(y2);
  list.add(angle);
  save.addHistorique(new Historique(2, 1, list));
}

private void fractalKock(float xa, float ya, float xb, float yb, float angle, int n) {
  if (n==0) {
    line(xa, ya, xb, yb);
    return;
  }
  float xc, yc, xd, yd, xe, ye, x, y, a;
  a=3-(abs(angle)-60)/30;
  xc=xa+(xb-xa)/a;
  yc=ya+(yb-ya)/a;

  xd=xb-(xc-xa);
  yd=yb-(yc-ya);
  
  a=(180-angle)*PI/180;
  x=xa-xc;
  y=ya-yc;
  xe=x*cos(a)+y*sin(a)+xc;
  ye=-x*sin(a)+y*cos(a)+yc;
  
  fractalKock(xa, ya, xc, yc, angle, n-1);
  fractalKock(xc, yc, xe, ye, angle, n-1);
  fractalKock(xe, ye, xd, yd, angle, n-1);
  fractalKock(xd, yd, xb, yb, angle, n-1);
}
