
class ManipulationImage{

  private PImage img;
  
  //====== Construteur
  
  public ManipulationImage(){
    File f = new File("Images");
  }
  
  //creer une image
  public ManipulationImage(String cheminImage){
    img = loadImage(cheminImage);
  }

  // creer une image en l'adaptant au format de la fenetre
  public ManipulationImage(String cheminImage, int fenetreWidth, int fenetreHeight){
    this(cheminImage);
    resizeImage(fenetreWidth, fenetreHeight);
  }
  
  //======= Methode
  
  private void resizeImage(int w, int h){
    img.resize(w, h);
  }
   
  //====== GET
  
  //retourne la couleur de l'image au coordonnées indiquée
  public color getColor(int x, int y){
    return img.get(x,y);
  }
  
  public int getWidth(){
    return img.width;
  }

  public int getHeight(){
    return img.height;
  }
}
