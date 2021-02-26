class Pinceau {
  private int epaisseur;
  private Couleur couleurCrayon;
  private Couleur couleurRemplissage;
  private boolean remplissage;
  
  public Pinceau(int epaisseur){
    couleurCrayon =new Couleur(0,0,0);
    couleurRemplissage=new Couleur(255,255,255);
    this.epaisseur=epaisseur;
  }
  
  public Pinceau(color c1, color c2){
    couleurCrayon = new Couleur(c1);
    couleurRemplissage = new Couleur(c2);
    epaisseur=1;
  }
  
  public Pinceau(color c1, color c2, int epaisseur){
    couleurCrayon = new Couleur(c1);
    couleurRemplissage = new Couleur(c2);
    this.epaisseur=epaisseur;
  }
  
  public void setCouleur(color c){
    couleurCrayon=new Couleur(c);
  }
  
  public void setCouleurRemplissage(color c){
    couleurRemplissage=new Couleur(c);
  }
  
  public color getCouleur(){
    return couleurCrayon.getCouleur();
  }
  
  public color getCouleurRemplissage(){
    return couleurRemplissage.getCouleur();
  }
  
  public boolean isRemplis(){
    return remplissage;
  }
  
  public void setEpaisseur(int epaisseur){
    this.epaisseur=epaisseur;
  }
  
  public void use(boolean fill){
    remplissage=fill;
    strokeWeight(epaisseur);
    stroke(couleurCrayon.getCouleur());
    if(fill)fill(couleurRemplissage.getCouleur());
    else noFill();
  }  
}

public class Couleur{
  private int r;
  private int v;
  private int b;
  private color couleur;
  
  public Couleur(int r, int v, int b){
    this.r = r;
    this.v = v;
    this.b = b;
  }
  
  public Couleur(color couleur){
    r=-1;
    this.couleur=couleur;
  }
  
  public color getCouleur(){
  if(r==-1)return couleur;
  else return color(r,v,b);
  }
  
}
