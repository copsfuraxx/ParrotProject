class Couleur {
  private int r;
  private int v;
  private int b;
  private color couleur;
  
  public Couleur(int r, int v, int b){
    this.r = r;
    this.v = v;
    this.b = b;
    this.couleur = color(r,v,b);
  }
  
  private void maj(){        
    this.couleur = color(r,v,b);
  }
  
}
