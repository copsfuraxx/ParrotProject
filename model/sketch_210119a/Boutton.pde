class Bouton { 
  String texte;
  float x,y,tailleX,tailleY,tailleTexte;
  Bouton (String texte, float x, float y,float tailleX,float tailleY){
    this.texte = texte;
    this.x = x;
    this.y = y;
    this.tailleX = tailleX;
    this.tailleY = tailleY;
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
  
  void adapteTexte (){
     this.tailleTexte = this.tailleY * 0.35;

  }
  
  void dessineBouton(){
    /*
    BUT : dessiner le bouton simplement
    PARAMETRE : Ø
    */
    noFill();
    rect(x,y,tailleX,tailleY);
    textSize(tailleTexte);
    text(texte,x + tailleX/16 ,y + 5*tailleY/8);
    fill(0,102,153);
  };
}
