class Bouton { 
  String[] tabTexte;
  float x,y,tailleX,tailleY,tailleTexte;
  Bouton (String texte, float x, float y,float tailleX,float tailleY){
    
    this.x = x;
    this.y = y;
    this.tailleX = tailleX;
    this.tailleY = tailleY;
    this.tabTexte = this.separeLigne(texte);
    this.adapteTexte();
  }
  
  float centreX(){
    return (x+tailleX/2);
  }
  
  float centreY(){
    return (y+tailleY/2);
  }
  
  void setTailleTexte(float nouvVal){
    this.tailleTexte = nouvVal;
  }
  
  /*
  PARAMETRE : les tailles des bordures du bouton
  BUT: adapter le texte pour qu'il soit à l'intérieur du bouton
  */
  private void adapteTexte (){

    if (this.tailleY * 0.50 < this.tailleX * 0.50){
     this.tailleTexte = this.tailleY * 0.50;
    }else{
     this.tailleTexte = this.tailleX * 0.50;
    }

      for (int i = 1; i < tabTexte.length; i++){
        this.tailleTexte = this.tailleTexte * 0.78;
      }
  }
   /*
  PARAMETRE : les tailles des bordures du bouton et le texte du bouton
  BUT: donner un tableau des x et y des différentes lignes du texte
  il est de la forme {x1,y1,x2,y2...}
  */
  private float[] placeLigne(){
    float[] tabReturn = new float[2 * tabTexte.length] ;
    if (tabTexte.length == 1 ){
      tabReturn[0] = x + tailleX/16;
      tabReturn[1] = y + 5*tailleY/8;
    }
    else{
      int j;
      float placeTexte;
    for (int i = 0; i < tabReturn.length; i = i+2){
      j = i+1;
      placeTexte = i/2 +1;
      tabReturn[i] = this.x + this.tailleX/16;
      tabReturn[j] = this.y + (placeTexte * this.tailleY)/(this.tabTexte.length + 1) + this.tailleTexte * 0.15 * placeTexte ;
    }
    
    
    
    }
    return tabReturn;
  }
  
  
  /*
  PARAMETRE : le texte du bouton
  BUT : crée un tableau qui représente  
  */
  
  private String[] separeLigne(String texte){
    int coef = 7 * 1 + (int) (this.tailleX *1.7 /this.tailleY);//coef pour trouver le nombre de caractère pour chaque lignes
    System.out.println("test");
    if (texte.length() < coef){
      return new String[]{texte};
    }
    ArrayList<String> arrayChaine= new ArrayList<String>();
    String chaineCour;
    Boolean pasDecouper = true;//condition finale ou l'on teste si le texte est encore découpable
    while (pasDecouper){
      
      if (texte.lastIndexOf(" ",coef) != -1){
        
        if (coef + 1 < texte.length()&& texte.charAt(coef+1) == ' ' ){
       
          chaineCour = texte.substring(0,coef + 1);
          texte = texte.substring(coef+2, texte.length());
          arrayChaine.add(chaineCour);
        }
        else {
        chaineCour = texte.substring(0,texte.lastIndexOf(" ",coef)  );
        texte = texte.substring(texte.lastIndexOf(" ",coef)+1, texte.length());
        arrayChaine.add(chaineCour);
        }
        
        
        
        
      }
      else {
        chaineCour = texte.substring(0,coef);
        texte = texte.substring(coef,texte.length());
        arrayChaine.add(chaineCour);
      }
      if (texte.length() <= coef){
        pasDecouper = false;
        arrayChaine.add(texte);
      }
          System.out.println(texte);

    }

    
    String[] tabChaine = new String[arrayChaine.size()];
    for(int i = 0;i < arrayChaine.size();i++){
      tabChaine[i] = arrayChaine.get(i);
    }
  return tabChaine;
  
  }
  
  
  
  void dessineBouton(){
    /*
    BUT : dessiner le bouton
    PARAMETRE : Ø
    */
    float[] tabCoord = this.placeLigne();
    noFill();
    rect(x,y,tailleX,tailleY);
    textSize(tailleTexte);
    int  j = 0;
    int k = 1;
    for(int i = 0 ; i < tabTexte.length;i++){
      text(tabTexte[i], tabCoord[j],tabCoord[k]);
      j = j+2;
      k = j+1;
    }
  };
}
