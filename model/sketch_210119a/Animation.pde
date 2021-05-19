public abstract class Animation{
  public abstract void dessine();
  public abstract boolean isEnd();
  public abstract int isAnime();
}

public class Animation2 extends Animation{
  private int i;
  
  public Animation2(){i=60;}
  
  public void dessine(){
    fill(255);
    noStroke();
    rect(width-360, height-175,width, height);
    stroke(0);
    textSize(32);
    fill(255*i/60);
    text("Damien Planchamp\nJules Finck\nJules Geyer", width-350, height-150);
    i--;
  }
  
  public boolean isEnd(){return i<0;}
  
  public int isAnime(){return 2;}
}

public class Animation1 extends Animation{
  private int i;
  private ArrayList<Triangle> trianglesD;
  private ArrayList<Triangle> trianglesT;
  
  public Animation1(){
    i=0;
    trianglesD=new ArrayList();
    trianglesT=new ArrayList();
    boolean bool=true;
    String[] lines = loadStrings("Triangle.txt");
    for (int c=0; c<lines.length; c++) {
      String[] line=lines[c].split("/");
      if(line.length!=1){
        int[] triangle=new int[6];
        for(int c2=0;c2<6;c2++){
          triangle[c2]=int(line[c2]);
        }
        if(bool)trianglesT.add(new Triangle(triangle,getCouleur(line[6])));
        else trianglesD.add(new Triangle(triangle,getCouleur(line[6])));
      }else{ bool=false;}
    }
  }
  
  private color getCouleur(String c){
    switch(c){
      case "n":return color(0);
      case "o":return color(255,100,0);//165
      case "v":return color(0,128,0);
      case "b":return color(0,191,255);
      case "g":return color(64);
    }
    return color(255);
  }
  
  public void dessine(){
    background(255);
    for(int a=0;a<trianglesD.size()&&a<i;a++){
      trianglesD.get(a).dessine(a%4);
    }
    for(int a=0;a<trianglesT.size()&&a<i;a++){
      trianglesT.get(a).dessine(a%4);
    }
    i++;
  }
  
  public boolean isEnd(){return trianglesD.get(trianglesD.size()-1).isEnd()&&trianglesT.get(trianglesT.size()-1).isEnd();}
  
  public int isAnime(){return 1;}
}

public class Triangle{
  private int[] points;
  private int i;
  private color couleur;
  private int[] centre;
  
  public Triangle(int[] points){
    this.points=points.clone();
    i=90;
    couleur=color(255);
    centre=new int[2];
    centre[0]=(points[0]+points[2]+points[4])/3;
    centre[1]=(points[1]+points[3]+points[5])/3;
  }
  
  public Triangle(int[] points, color couleur){
    this.points=points.clone();
    i=90;
    this.couleur=couleur;
    centre=new int[2];
    centre[0]=(points[0]+points[2]+points[4])/3;
    centre[1]=(points[1]+points[3]+points[5])/3;
  }
  
  public void dessine(int a){
    fill(couleur);
    if(i<0){
      triangle2(points);
      return;
    }
    triangle2(points,centre,a%4,1700*i/90,1080*i/90);
    i--;
  }
  
  public boolean isEnd(){return i<0;}
  
  public void triangle2(int[] triangle){
    triangle(triangle[0]/9600f*width,triangle[1]/5400f*height,triangle[2]/9600f*width,triangle[3]/5400f*height,triangle[4]/9600f*width,triangle[5]/5400f*height);
  }

  private void triangle2(int[] triangle, int[] centre, int sens, int taille, int rota){
    float angle=rota*PI/180;
    int[] points2=new int[6];
    for(int c=0;c<3;c++){
      int xM=triangle[c*2]-centre[0];
      int yM=triangle[c*2+1]-centre[1];
      points2[c*2]= int(xM * cos (angle) + yM * sin (angle) + centre[0]);
      points2[c*2+1]= int(- xM * sin (angle) + yM * cos (angle) + centre[1]);
    }
    switch(sens){
      case 0:triangle(points2[0]/9600f*width-taille,points2[1]/5400f*height,points2[2]/9600f*width-taille,points2[3]/5400f*height,points2[4]/9600f*width-taille,points2[5]/5400f*height);break;
      case 1:triangle(points2[0]/9600f*width,points2[1]/5400f*height-taille,points2[2]/9600f*width,points2[3]/5400f*height-taille,points2[4]/9600f*width,points2[5]/5400f*height-taille);break;
      case 2:triangle(points2[0]/9600f*width+taille,points2[1]/5400f*height,points2[2]/9600f*width+taille,points2[3]/5400f*height,points2[4]/9600f*width+taille,points2[5]/5400f*height);break;
      case 3:triangle(points2[0]/9600f*width,points2[1]/5400f*height+taille,points2[2]/9600f*width,points2[3]/5400f*height+taille,points2[4]/9600f*width,points2[5]/5400f*height+taille);break;
    }
  }
}
