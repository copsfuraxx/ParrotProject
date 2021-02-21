//public class Mathematique{
//  //public static final AFFINE=1;

//  private int fonction;

//  public Mathematique(int fonction){
//    this.fonction=fonction;
//  }
//}

public void koch() {
  koch(random(width), random(height));
}

public void koch(float x, float y) {
  koch(x, y, random(max(width, height))/4);
}

public void koch(float taille) {
  koch(random(width), random(height), taille);
}

public void koch(float x, float y, float taille) {
  koch(x, y, taille, random(360)*PI/180);
}

public void koch(float x, float y, float taille, float rota) {
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

  koch(x, y, x1, y1, 5);
  koch(x1, y1, x3, y3, 5);
  koch(x3, y3, x, y, 5);
  ArrayList list=new ArrayList();
  list.add(x);
  list.add(y);
  list.add(taille);
  list.add(rota);
  save.addHistorique(new Historique(2, 1, list));
}

private void koch(float xa, float ya, float xb, float yb, float n) {
  if (n==0) {
    line(xa, ya, xb, yb);
    return;
  }
  float xc, yc, xd, yd, xe, ye, angle, a, b;
  xc=xa+(xb-xa)/3;
  yc=ya+(yb-ya)/3;
  

  xd=xa+2*(xb-xa)/3;
  yd=ya+2*(yb-ya)/3;
  
  angle=120*PI/180;
  a=xa-xc;
  b=ya-yc;

  xe=a*cos(angle)+b*sin(angle)+xc;
  ye=-a*sin(angle)+b*cos(angle)+yc;
  
  koch(xa, ya, xc, yc, n-1);
  koch(xd, yd, xb, yb, n-1);
  koch(xc, yc, xe, ye, n-1);
  koch(xe, ye, xd, yd, n-1);
}

public void cesaro() {
  cesaro(random(width), random(height));
}

public void cesaro(float x, float y) {
  cesaro(x, y, random(width), random(height));
}

public void cesaro(float x1, float y1, float x2, float y2) {
  cesaro(x1,y1,x2,y2,5);
  ArrayList list=new ArrayList();
  list.add(x1);
  list.add(y1);
  list.add(x2);
  list.add(y2);
  save.addHistorique(new Historique(2, 2, list));
}

private void cesaro(float xa, float ya, float xb, float yb, float n) {
  if (n==0) {
    line(xa, ya, xb, yb);
    return;
  }
  float xc, yc, xd, yd, xe, ye, angle, a, b;
  xc=xa+(xb-xa)*(6f/13);
  yc=ya+(yb-ya)*(6f/13);

  xd=xb-(xc-xa);
  yd=yb-(yc-ya);
  
  angle=95*PI/180;
  a=xa-xc;
  b=ya-yc;
  xe=a*cos(angle)+b*sin(angle)+xc;
  ye=-a*sin(angle)+b*cos(angle)+yc;
  
  cesaro(xa, ya, xc, yc, n-1);  
  cesaro(xd, yd, xb, yb, n-1);
  cesaro(xc, yc, xe, ye, n-1);
  cesaro(xe, ye, xd, yd, n-1);
}
