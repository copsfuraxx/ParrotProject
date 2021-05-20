
class ManipulationImage{

  private PImage img;
  private int gros, moyen, petit, fenetreWidth, fenetreHeight;
    
  //====== Construteur
  
  // stocke le format de la fenetre
  public ManipulationImage(int initFenetreWidth, int initFenetreHeight){
    fenetreWidth = initFenetreWidth;
    fenetreHeight = initFenetreWidth;
    gros = (50*fenetreHeight)/350;
    petit = (7*fenetreHeight)/350; 
    moyen = (gros+petit)/2;
    img = null;
  }

  //======= Methode
  
  private void resizeImage(int w, int h){
    img.resize(w, h);
  }
  
  public void nouvelleForme(int forme, int taille){
    switch(taille){
      case 0: taille = petit; break;
      case 1: taille = moyen; break;
      case 2: taille = gros; break;
    }
    float x,y;
    x = random(0,fenetreWidth);
    y = random(0,fenetreHeight);
    Couleur c = new Couleur(getColor(int(x),int(y)));
    getPinceau().setCouleur(c);
    if (forme == -1){forme = int(random(0,6));}
    switch(forme){
      case 0: dessineCarre(x, y,  taille); break;
      case 1: dessineRectangle(x, y, x+random(taille/2,taille), y+random(taille/2,taille)); break;
      case 2: dessineTriangle(x, y, x+random(taille/2,taille), y+random(taille/2,taille)); break;
      case 3: dessineEllipse(x, y,  x+random(taille/2,taille), y+random(taille/2,taille)); break;
      case 4: dessineCercle(x, y,  taille); break;
      case 5: dessinePoly(x, y,  taille); break;
    }
  }
   
  //====== GET
  
  //retourne la couleur de l'image au coordonnées indiquée
  private color getColor(int x, int y){
    return img.get(x,y);
  }
  
  public PImage getImage(){
    return img;
  }
  
  //====== SET
  
  public void setImage(String cheminImage){
    img = loadImage(cheminImage);
    resizeImage(fenetreWidth, fenetreHeight);
  }
}
