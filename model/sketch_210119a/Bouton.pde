class Bouton { 
  private String[] tabTexte;
  private float[] tabCoord;
  private float x, y, tailleX, tailleY, tailleTexte;
  private color on, off;
  private Boolean choix;
  
  public Bouton (String texte, float x, float y, float tailleX, float tailleY, color on, color off) {
    this.desactive();
    this.on = on;
    this.off = off;
    this.x = x;
    this.y = y;
    this.tailleX = tailleX;
    this.tailleY = tailleY;
    this.tabTexte = this.separeLigne(texte);
    this.adapteTexte();
    this.tabCoord = this.placeLigne();
  }

  float centreX() {
    return (x+tailleX/2);
  }

  float centreY() {
    return (y+tailleY/2);
  }

  public void setTailleTexte(float nouvVal) {
    this.tailleTexte = nouvVal;
  }

  public void active() {
    this.choix = true;
  }

  public void desactive() {
    this.choix = false;
  }

  public float[] getTabCoord(){
    return this.tabCoord;
  }
  
  public String[] getTabTexte(){
    return this.tabTexte;
  }
  
  public float getX(){
   return this.x; 
  }
  
  public float getY(){
   return this.y; 
  }
  
  public float getTailleX(){
   return this.tailleX; 
  }

  public float getTailleY(){
   return this.tailleY; 
  }
  
  public float getTailleTexte(){
   return this.tailleTexte; 
  }
  
  public color getCouleurOn(){
   return this.on; 
  }
  
  public color getCouleurOff(){
   return this.off ;
  }
  
  public Boolean getChoix(){
    return this.choix;
  }
  
  /*
  PARAMETRE : les tailles des bordures du bouton
   BUT: adapter le texte pour qu'il soit à l'intérieur du bouton
   */
  private void adapteTexte () {

    if (this.tailleY * 0.50 < this.tailleX * 0.50) {
      this.tailleTexte = this.tailleY * 0.50;
    } else {
      this.tailleTexte = this.tailleX * 0.50;
    }

    for (int i = 1; i < tabTexte.length; i++) {
      this.tailleTexte = this.tailleTexte * 0.78;
    }
  }
  /*
  PARAMETRE : les tailles des bordures du bouton et le texte du bouton
   BUT: donner un tableau des x et y des différentes lignes du texte
   il est de la forme {x1,y1,x2,y2...}
   */
  private float[] placeLigne() {
    float[] tabReturn = new float[2 * tabTexte.length] ;
    if (tabTexte.length == 1 ) {
      tabReturn[0] = x + tailleX/16;
      tabReturn[1] = y + 5*tailleY/8;
    } else {
      int j;
      float placeTexte;
      for (int i = 0; i < tabReturn.length; i = i+2) {
        j = i+1;
        placeTexte = i/2 +1;
        tabReturn[i] = this.x + this.tailleX/16;
        tabReturn[j] = this.y + (placeTexte * this.tailleY)/(this.tabTexte.length + 1) + this.tailleTexte * 0.15 * placeTexte ;
      }
    }
    return tabReturn;
  }


  /**
   *PARAMETRE : le texte du bouton
   *BUT : crée un tableau qui représente  
   **/

  private String[] separeLigne(String texte) {
    int coef;
    if ((this.tailleX/this.tailleY > 0.88) && (this.tailleX/this.tailleY < 1.12)) {
      coef = 5 + (int) (this.tailleX /this.tailleY);
    } else {
      coef = 5 + (int) (this.tailleX *2 /this.tailleY);//coef pour trouver le nombre de caractère pour chaque lignes
    }
    if (texte.length() < coef) {
      return new String[]{texte};
    }
    ArrayList<String> arrayChaine= new ArrayList<String>();
    String chaineCour;
    Boolean pasDecouper = true;//condition finale ou l'on teste si le texte est encore découpable
    while (pasDecouper) {

      if (texte.lastIndexOf(" ", coef) != -1) {

        if (coef + 1 < texte.length()&& texte.charAt(coef+1) == ' ' ) {

          chaineCour = texte.substring(0, coef + 1);
          texte = texte.substring(coef+2, texte.length());
          arrayChaine.add(chaineCour);
        } else {
          chaineCour = texte.substring(0, texte.lastIndexOf(" ", coef)  );
          texte = texte.substring(texte.lastIndexOf(" ", coef)+1, texte.length());
          arrayChaine.add(chaineCour);
        }
      } else {
        chaineCour = texte.substring(0, coef);
        texte = texte.substring(coef, texte.length());
        arrayChaine.add(chaineCour);
      }
      if (texte.length() <= coef) {
        pasDecouper = false;
        arrayChaine.add(texte);
      }
      System.out.println(texte);
    }

    String[] tabChaine = new String[arrayChaine.size()];
    for (int i = 0; i < arrayChaine.size(); i++) {
      tabChaine[i] = arrayChaine.get(i);
    }
    return tabChaine;
  }



  public  void dessineBouton() {
    /*
    BUT : dessiner le bouton
     PARAMETRE : Ø
     */
    float[] tabCoord = this.placeLigne();
    noFill();
    if (this.choix) {
      stroke(this.on);
    } else {
      stroke(this.off);
    }
    rect(x, y, tailleX, tailleY);
    textSize(tailleTexte);
    int  j = 0;
    int k = 1;
    for (int i = 0; i < tabTexte.length; i++) {
      text(tabTexte[i], tabCoord[j], tabCoord[k]);
      j = j+2;
      k = j+1;
    }
  };
}


class BoutonValeur extends Bouton{
  
  private float[] listeEntier;
  public BoutonValeur (String texte, float x, float y, float tailleX, float tailleY, color on, color off,float[] listeEntier){
   super(texte, x, y, tailleX, tailleY, on, off);
   this.listeEntier = listeEntier;
  }
  
  public BoutonValeur (String texte, float x, float y, float tailleX, float tailleY, color on, color off,float entier){
   super(texte, x, y, tailleX, tailleY, on, off);
   float[] listeEntier = new float[1];
   listeEntier[0] = entier;
   this.listeEntier = listeEntier;
  }
 public float[] getListeEntier(){
   return this.listeEntier;
 }
 
 public void setListeEntier(float[] listeEntier){
  this.listeEntier = listeEntier; 
 }
 
 public float getEntierDeListeEntier(int place){
   return listeEntier[place];
 }
  
  public void setEntierDeListeEntier(int place, float entier){
   this.listeEntier[place] = entier;
 }
}

class BoutonListe extends Bouton{
  
  private String[] listeChaine;
  public BoutonListe (String texte, float x, float y, float tailleX, float tailleY, color on, color off,String[] listeChaine){
   super(texte, x, y, tailleX, tailleY, on, off);
   this.listeChaine = listeChaine;
  }
  
 public String[] getListeChaine(){
   return this.listeChaine;
 }
 
 public void setlisteChaine(String[] listeChaine){
  this.listeChaine = listeChaine; 
 }
 
 public String getEntierDelisteChaine(int place){
   return listeChaine[place];
 }
  
  public void setEntierDelisteChaine(int place, String chaine){
   this.listeChaine[place] = chaine;
 }
}
