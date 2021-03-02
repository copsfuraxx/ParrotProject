//public class Mathematique{
//  //public static final AFFINE=1;

//  private int fonction;

//  public Mathematique(int fonction){
//    this.fonction=fonction;
//  }
//}

public void spiralrOr(){
  spiralrOr(random(width), random(height));
}

public void spiralrOr(float x, float y){
  println(x);
  println(y);
  spiralrOr(x,y,25);
}

private void spiralrOr(float X, float Y,int n){
  float x=X,y=Y,t1=1,t0=0;
  for(int i=0;i<n;i++){
    println("x"+i+":"+x);
    println("y"+i+":"+y);
    println("t0:"+t0+"/t1:"+t1);
    switch(i%4){
      case 0:
        arc(x, y, t1, t1, PI, PI+HALF_PI);
        y+=t0/2;
        break;
      case 1:
        arc(x, y, t1, t1, PI+HALF_PI, 2*PI);
        x-=t0/2;
        break;
      case 2:
        arc(x, y, t1, t1, 0, HALF_PI);
        y-=t0/2;
        break;
      case 3:
        arc(x, y, t1, t1, HALF_PI, PI);
        x+=t0/2;
        break;
    }
    t1+=t0;
    t0=t1-t0;
  }
}

public void polyParfait(){
  int r=int(random(0,2));
  if(r==0)polyParfait(random(60,90));
  else polyParfait(-random(60,90));
}

public void polyParfait(float angle){
  polyParfait(random(width), random(height), angle);
}

public void polyParfait(float x, float y){
  polyParfait(x, y, random(60,90));
}

public void polyParfait(float x, float y, float angle){
  polyParfait(x, y, angle,random(max(width,height)/4));
}

public void polyParfait(float x, float y, float angle, float taille){
  polyParfait(x, y, angle, taille, random(360));
}

public void polyParfait(float x, float y, float angle, float taille, float rota) {
  polyParfait(x, y, angle, taille, rota, int(random(3,10)));
}

public void polyParfait(float x, float y, float angle, float taille, float rota, int nbrCotes) {
  print(nbrCotes);
  if(angle>90 || angle<-90)return;
  if(angle>-60 && angle<60)return;
  if(nbrCotes<3)return;
  if (x+taille>width)x-=taille;
  if (y+taille>height)y-=taille;
  float x1, x2, x3, y1, y2, y3;
  x2=x+taille/2 - x;
  y2=y - y;
  x1=x2*cos(rota)+y2*sin(rota)+x;
  y1=-x2*sin(rota)+y2*cos(rota)+y;
  
  float a=(360f/nbrCotes)*PI/180;
  
  for(int i=0;i<nbrCotes;i++){
    x2=x1 - x;
    y2=y1 - y;
    x3=x2*cos(a)+y2*sin(a)+x;
    y3=-x2*sin(a)+y2*cos(a)+y;
    fractalKock(x1, y1, x3, y3, angle);
    x1=x3;
    y1=y3;
  }
}

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
  polyParfait(x,y,angle,taille,rota,4);
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
  polyParfait(x,y,angle,taille,rota,3);
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
  
  //fill(255*n/6,255*(6-n)/6,255*n/6);
  //triangle(xc,yc,xe,ye,xd,yd);
  
  fractalKock(xa, ya, xc, yc, angle, n-1);
  fractalKock(xc, yc, xe, ye, angle, n-1);
  fractalKock(xe, ye, xd, yd, angle, n-1);
  fractalKock(xd, yd, xb, yb, angle, n-1);
}

void multiFormMath() {
  multiFormMath((int)random(10)+1);
}

void multiFormMath(int[] formeGeo) {
  for (int i=0; i<formeGeo.length; i++) {
    multiFormMathChoix(formeGeo[i]);
  }
}

void multiFormMath(int n) {
  for (int i=0; i<n; i++) {
    multiFormMathChoix((int)random(7));
  }
}

void multiFormMathChoix(int choix) {
  switch(choix) {
  case 0:
    koch();
    break;
  case 1:
    cesaro();
    break;
  case 2:
    fractalKock();
    break;
  case 3:
    floconKoch();
    break;
  case 4:
    fractaleTriangle();
    break;
  case 5:
    fractaleCarre();
    break;  
  case 6:
    fractalKock();
    break;
  }
}
