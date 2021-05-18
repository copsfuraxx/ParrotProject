//public class Mathematique{
//  //public static final AFFINE=1;

//  private int fonction;

//  public Mathematique(int fonction){
//    this.fonction=fonction;
//  }
//}

public void courbeBezier(){
  courbeBezier((int)random(10)+3);
}

void courbeBezier(int i) {
  if (i<3)return;
  float[][] coord=new float[i][2];
  for (int j=0; j<coord.length; j++) {
    coord[j][0]=random(lmin,lmax);
    coord[j][1]=random(hmin,hmax);
  }
  courbeBezier(coord);
}

public void courbeBezier(float[][] droites){
  if(droites[0].length!=2)return;
  float[][] points=new float[(droites.length-1)*droites.length/2][2];
  float x=droites[0][0],y=droites[0][1];
  for(int i=1;i<1001;i++){
    for(int j=0;j<droites.length-1;j++){
      points[j][0]=droites[j][0]+(droites[j+1][0]-droites[j][0])*i/1000;
      points[j][1]=droites[j][1]+(droites[j+1][1]-droites[j][1])*i/1000;
      //point(points[j][0],points[j][1]);
    }
    int l;
    int b=l=droites.length-1;
    for(int a=droites.length-2;a>=0;a--){
      for(int j=0;j<a;j++){
        points[b][0]=points[b-l][0]+(points[b-l+1][0]-points[b-l][0])*i/1000;
        points[b][1]=points[b-l][1]+(points[b-l+1][1]-points[b-l][1])*i/1000;
        //point(points[j][0],points[j][1]);
        b++;
      }
      l--;
    }
    l=points.length-1;
    line(x,y,points[l][0],points[l][1]);
    x=points[l][0];y=points[l][1];
  }
  ArrayList list=new ArrayList();
  list.add(droites.length);
  for (int i=0; i<droites.length; i++) {
    list.add(droites[i][0]);
    list.add(droites[i][1]);
  }
  save.addHistorique(new Historique(9, list));
}

public void spiralrOr(){
  spiralrOr(random(lmin,lmax), random(hmin,hmax));
}

public void spiralrOr(float x, float y){
  noFill();
  spiralrOr(x,y,25);
  fill(pinceau.couleurRemplissage.getCouleur());
  ArrayList list=new ArrayList();
  list.add(x);
  list.add(y);
  save.addHistorique(new Historique(8, list));
}

private void spiralrOr(float X, float Y,int n){
  float x=X,y=Y,t1=1,t0=0;
  for(int i=0;i<n;i++){
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

public void fractalePoly() {
  int r=int(random(0,2));
  if(r==0)fractalePoly(random(60,90));
  else fractalePoly(-random(60,90));
}

public void fractalePoly(float angle) {
  fractalePoly(random(lmin,lmax), random(hmin,hmax), angle);
}

public void fractalePoly(float x, float y) {
  fractalePoly(x, y, random(60,90));
}

public void fractalePoly(float x, float y, float angle) {
  fractalePoly(x, y, angle,random(min(lmin,hmin),max(lmax,hmax)));
}

public void fractalePoly(float x, float y, float angle, float taille) {
  fractalePoly(x, y, angle, taille, random(360));
}

public void fractalePoly(float x, float y, float angle, float taille, float rota) {
  fractalePoly(x,y,angle,taille,rota,int(random(3,10)));
}

public void fractalePoly(float x, float y, float angle, float taille, float rota, int nbrCotes) {
  float[][] coord=dessinePoly(x,y,taille,rota,nbrCotes);
  for(int i=0;i<coord.length-1;i++){
    fractalKock(coord[i][0],coord[i][1],coord[i+1][0],coord[i+1][1],angle);
  }
  fractalKock(coord[coord.length-1][0],coord[coord.length-1][1],coord[0][0],coord[0][1],angle);
}

public void fractaleCarre() {
  int r=int(random(0,2));
  if(r==0)fractaleCarre(random(60,90));
  else fractaleCarre(-random(60,90));
}

public void fractaleCarre(float angle) {
  fractaleCarre(random(lmin,lmax), random(hmin,hmax), angle);
}

public void fractaleCarre(float x, float y) {
  fractaleCarre(x, y, random(60,90));
}

public void fractaleCarre(float x, float y, float angle) {
  fractaleCarre(x, y, angle,random(min(lmin,hmin),max(lmax,hmax)));
}

public void fractaleCarre(float x, float y, float angle, float taille) {
  fractaleCarre(x, y, angle, taille, random(360));
}

public void fractaleCarre(float x, float y, float angle, float taille, float rota) {
  fractalePoly(x,y,angle,taille,rota,4);
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
  fractaleTriangle(random(lmin,lmax), random(hmin,hmax), angle);
}

public void fractaleTriangle(float x, float y) {
  fractaleTriangle(x, y, random(60,90));
}

public void fractaleTriangle(float x, float y, float angle) {
  fractaleTriangle(x, y, angle,random(min(lmin,hmin),max(lmax,hmax)));
}

public void fractaleTriangle(float x, float y, float angle, float taille) {
  fractaleTriangle(x, y, angle, taille, random(130));
}

public void fractaleTriangle(float x, float y, float angle, float taille, float rota) {
  fractalePoly(x,y,angle,taille,rota,3);
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
  fractalKock(random(lmin,lmax), random(hmin,hmax), angle);
}

public void fractalKock(float x, float y) {
  fractalKock(x, y, random(lmin,lmax), random(hmin,hmax));
}

public void fractalKock(float x, float y, float angle) {
  fractalKock(x, y, random(lmin,lmax), random(hmin,hmax), angle);
}

public void fractalKock(float x1, float y1, float x2, float y2) {
  fractalKock(x1, y1, x2, y2, random(60,90));
}

public void fractalKock(float x1, float y1, float x2, float y2, float angle) {
  fractalKockIntern(x1,y1,x2,y2,angle);
  ArrayList list=new ArrayList();
  list.add(x1);
  list.add(y1);
  list.add(x2);
  list.add(y2);
  list.add(angle);
  save.addHistorique(new Historique(6, list));

}

private void fractalKockIntern(float x1, float y1, float x2, float y2, float angle) {
  if(angle>90 || angle<-90)return;
  if(angle>-60 && angle<60)return;
  fractalKock(x1, y1, x2, y2, angle, 5);
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
  Couleur c1=new Couleur(pinceau.getCouleurRemplissage());
  Couleur c2=new Couleur(pinceau.getCouleur());
  fill(c1.degrader(c2,n));
  triangle(xc,yc,xe,ye,xd,yd);
  fill(pinceau.getCouleurRemplissage());
  
  fractalKock(xa, ya, xc, yc, angle, n-1);
  fractalKock(xc, yc, xe, ye, angle, n-1);
  fractalKock(xe, ye, xd, yd, angle, n-1);
  fractalKock(xd, yd, xb, yb, angle, n-1);
}
