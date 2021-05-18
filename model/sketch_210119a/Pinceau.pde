class Pinceau {
  private int epaisseur;
  private Couleur couleurCrayon;
  private Couleur couleurRemplissage;
  
  public Pinceau(){
    couleurCrayon =new Couleur(0,0,0);
    couleurRemplissage=new Couleur(0,0,0);
    epaisseur=1;
    use();
  }
  
  public Pinceau(int epaisseur){
    couleurCrayon =new Couleur(0,0,0);
    couleurRemplissage=new Couleur(255,255,255);
    this.epaisseur=epaisseur;
    use();
  }
  
  public Pinceau(Couleur c){
    couleurCrayon = c;
    couleurRemplissage = c;
    epaisseur=1;
    use();
  }
  
  public Pinceau(Couleur c, int epaisseur){
    couleurCrayon = c;
    couleurRemplissage = c;
    this.epaisseur=epaisseur;
    use();
  }
  
  public Pinceau(Couleur c1, Couleur c2){
    couleurCrayon = c1;
    couleurRemplissage = c2;
    epaisseur=1;
    use();
  }
  
  public Pinceau(Couleur c1, Couleur c2, int epaisseur){
    couleurCrayon = c1;
    couleurRemplissage = c2;
    this.epaisseur=epaisseur;
    use();
  }
  
  public void setCouleur(Couleur c){
    couleurCrayon=c;
    couleurRemplissage=c;
    use();
  }
  
  public void setCouleur(Couleur c1, Couleur c2){
    couleurCrayon=c1;
    couleurRemplissage=c2;
    use();
  }
  
  public void setEpaisseur(int epaisseur){
    this.epaisseur=epaisseur;
    use();
  }
  
  public color getCouleur(){
    return couleurCrayon.getCouleur();
  }
  
  public color getCouleurRemplissage(){
    return couleurRemplissage.getCouleur();
  }
  
  public int getEpaisseur(){
    return epaisseur;
  }
  
  private void use(){
    strokeWeight(epaisseur);
    stroke(couleurCrayon.getCouleur());
    fill(couleurRemplissage.getCouleur());
  }  
}

public class Couleur{
  private float r;
  private float v;
  private float b;
  private color couleur;
  
  public Couleur(float r, float v, float b){
    this.r = r;
    this.v = v;
    this.b = b;
    couleur=color(r,v,b);
  }
  
  public Couleur(color couleur){
    r = red(couleur);
    v = green(couleur);
    b = blue(couleur);
    this.couleur = couleur;
  }
  
  public color getCouleur(){
    return couleur;
  }
  
  public float getBleu(){
    return this.b;
  }
  
  public float getVert(){
    return this.v;
  }
  
  public float getRouge(){
    return this.r;
  }
  
  public int getBleuEntier(){
    return (int)this.b;
  }
  
  public int getVertEntier(){
    return (int)this.v;
  }
  
  public int  getRougeEntier(){
    return (int)this.r;
  }
  
  public color degrader(Couleur c, int n){
    float r;
    if(this.r<c.r)r=c.r-(c.r-this.r)*n/6;
    else r=c.r+(this.r-c.r)*n/6;
    
    float v;
    if(this.v<c.v)v=c.v-(c.v-this.v)*n/6;
    else v=c.v+(this.v-c.v)*n/6;
    
    float b;
    if(this.b<c.b)b=c.b-(c.b-this.b)*n/6;
    else b=c.b+(this.b-c.b)*n/6;
    return color(r,v,b);
  }
}
