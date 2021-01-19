class Bouton { 
  String texte;
  int x,y,sizeX,sizeY;
  Bouton (String texte, int x, int y,int sizeX,int sizeY){
    this.texte = texte;
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
  }
  
  int centreX(){
    return (x+sizeX/2);
  }
  
  int centreY(){
    return (y+sizeY/2);
  }
  
  
  
  void dessineBouton(){
    /*
    BUT : dessiner le bouton simplement
    PARAMETRE : Ø
    */
    noFill();
    rect(x,y,sizeX,sizeY);
    textSize(70);
    text(texte,x,y);
    fill(0,102,153);
  };
}
