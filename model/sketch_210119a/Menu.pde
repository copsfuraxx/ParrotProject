class MenuListe{
  
  private int menuActuel;//le menu actuel 0 menu de démarrage
  /*
  menuActuel 0 menu de démarrage
  menuActuel 1 menu de dessin
  
  */
  private ArrayList<Bouton> listeBouton;
  private int curseur;//savoir sur quel bouton nous sommes
  
  
  public int getCurseur(){
     return this.curseur; 
    
  }
  
  public int getListeBoutonTaille(){
     return this.listeBouton.size(); 
    
  }
  
  public ArrayList<Bouton> getListeBouton(){
     return this.listeBouton; 
  }
   
  public void augmenteCurseur(){
    if (this.curseur < this.getListeBoutonTaille()-1){ 
      this.curseur++;
    }  
  }
  public void descendCurseur(){
    if (this.curseur > 0){
      this.curseur--;
    }
  }
  
  public MenuListe(int menuChoix){
    if (menuChoix == 0){
      
   this.menuActuel = 0;
   this.listeBouton = new ArrayList<Bouton>();
   this.menuDemarrage();
    }
    
  }
  
  
  private void menuDemarrage(){//menu de départ
    listeBouton.clear();
    color nonChoix = color(20,20,20);
    color choix = color(255,255,255);
    Bouton start = new Bouton("start", 100 , 100, 100,70,choix,nonChoix);
    Bouton quitter = new Bouton("quitter", 100 , 200, 100,70,choix,nonChoix);
    listeBouton.add(start);
    listeBouton.add(quitter);
  }

  public void cliqueBouton(){
   if (menuActuel == 0){
      switch(curseur){
      case 0:menuActuel = 1;break;
      case 1:exit();
      default : System.out.println("erreur");
  }
     
   }
    
  }
 
 public void afficheMenu(){
  for (int i = 0; i < this.getListeBoutonTaille();i++){
    if (i == this.curseur){
      this.listeBouton.get(i).active();
    }
    else {
      this.listeBouton.get(i).desactive();

    }
       this.listeBouton.get(i).dessineBouton();
    }
    
 }
 
 
}
