class Pinceau {
  //private int epaisseur;
  private Couleur couleurCrayon;
  private Couleur couleurRemplissage;
  
  public Pinceau(){
    couleurCrayon =new Couleur(0,0,0);
    couleurRemplissage=new Couleur(255,255,255);
    //this.epaisseur=1;
  }
  
  //public Pinceau(int epaisseur){
  //  couleurCrayon =new Couleur(0,0,0);
  //  couleurRemplissage=new Couleur(255,255,255);
  //  //this.epaisseur=epaisseur;
  //}
  
  public Pinceau(Couleur c){
    couleurCrayon = c;
    couleurRemplissage = c;
    //epaisseur=1;
    use();
  }
  
  public Pinceau(Couleur c1, Couleur c2){
    couleurCrayon = c1;
    couleurRemplissage = c2;
    //epaisseur=1;
    use();
  }
  
  //public Pinceau(color c1, color c2, int epaisseur){
  //  couleurCrayon = new Couleur(c1);
  //  couleurRemplissage = new Couleur(c2);
  //  //this.epaisseur=epaisseur;
  //}
  
  public void setCouleur(Couleur c){
    couleurCrayon=c;
    use();
  }
  
  public void setCouleur(Couleur c1, Couleur c2){
    couleurCrayon=c1;
    couleurRemplissage=c2;
    use();
  }
  
  public color getCouleur(){
    return couleurCrayon.getCouleur();
  }
  
  public color getCouleurRemplissage(){
    return couleurRemplissage.getCouleur();
  }
  
  
  //public void setEpaisseur(int epaisseur){
  //  this.epaisseur=epaisseur;
  //}
  
  private void use(){
    //strokeWeight(epaisseur);
    stroke(couleurCrayon.getCouleur());
    fill(couleurRemplissage.getCouleur());
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
