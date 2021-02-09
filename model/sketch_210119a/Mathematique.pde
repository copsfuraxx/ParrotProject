public class Mathematique{
  //public static final AFFINE=1;
  
  private int fonction;
  
  public Mathematique(int fonction){
    this.fonction=fonction;
  }
}

public void koch(){
  koch(random(width), random(height),random(max(width,height))/4);
}
public void koch(float x, float y){
}
public void koch(float taille){
}
public void koch(float x,float y, float taille){
  if(x+taille>width)x-=taille;
  if(y+taille>height)y-=taille;
  float rota=random(360)*PI/180;
  float x1,x2,y1,y2,x3,y3;
  x2=x - (x+taille);
  y2=y - y;
  x1=x2*cos(rota)+y2*sin(rota)+(x+taille);
  y1=-x2*sin(rota)+y2*cos(rota)+y;
  
  x2=x1 - x;
  y2=y1 - y;
  x3=x2*cos(1.0472)+y2*sin(1.0472)+x;
  y3=-x2*sin(1.0472)+y2*cos(1.0472)+y;
  
  koch(x,y,x1,y1,5);
  koch(x1,y1,x3,y3,5);
  koch(x3,y3,x,y,5);
}

public void koch(float xa, float ya, float xb, float yb, float n){
  if(n==0){
    line(xa,ya,xb,yb);
    return;
  }
  float xc,yc,xd,yd,xe,ye;
  xc=xa+(xb-xa)/3;
  yc=ya+(yb-ya)/3;
  koch(xa,ya,xc,yc,n-1);
  
  xd=xa+2*(xb-xa)/3;
  yd=ya+2*(yb-ya)/3;
  koch(xd,yd,xb,yb,n-1);
  
  xe=(xc+xd)*cos(1.0472)-(yd-yc)*sin(1.0472);
  ye=(yc+yd)*cos(1.0472)+(xd-xc)*sin(1.0472);
  koch(xc,yc,xe,ye,n-1);
  koch(xe,ye,xd,yd,n-1);
}
