class MenuListe {

  private int menuActuel;//le menu actuel 0 menu de démarrage
  /*
  menuActuel 0 menu de démarrage
   menuActuel 1 menu de dessin
   
   */
  private ArrayList<Bouton> listeBouton;
  private int curseur;//savoir sur quel bouton nous sommes
  private color couleurActuelle;

  public int getCurseur() {
    return this.curseur;
  }

  public void setCurseur(int nb) {
    this.curseur = nb;
  }

  public int getListeBoutonTaille() {
    return this.listeBouton.size();
  }

  public ArrayList<Bouton> getListeBouton() {
    return this.listeBouton;
  }

  public void augmenteCurseur() {
    if (this.curseur < this.getListeBoutonTaille()-1) { 
      this.curseur++;
    }
  }
  public void descendCurseur() {
    if (this.curseur > 0) {
      this.curseur--;
    }
  }

  public int getMenuActuel() {
    return this.menuActuel;
  }

  public void setMenuActuel(int nb) {
    this.menuActuel = nb;
  }

  public void setCouleurActuelle(color couleur) {
    this.couleurActuelle = couleur;
  }

  public color getCouleurActuelle() {
    return this.couleurActuelle;
  }

  public MenuListe(int menuChoix) {
    colorMode(HSB, 100);
    if (menuChoix == 0) {

      this.menuActuel = 0;
      this.listeBouton = new ArrayList<Bouton>();
      this.menuDemarrage();
    }
  }

  color nonChoix = color(20, 20, 20);
  color choix = color(100, 100, 100);

  private void menuDemarrage() {//menu de départ
    listeBouton.clear();
    Bouton start = new Bouton("start", 100, 100, 140, 70, choix, nonChoix);
    Bouton quitter = new Bouton("quitter", 100, 200, 140, 70, choix, nonChoix);
    listeBouton.add(start);
    listeBouton.add(quitter);
  }

  private void menuDessin() {
    listeBouton.clear();

    Bouton couleur = new Bouton("couleur", 100, 100, 140, 70, choix, nonChoix);
    Bouton forme = new Bouton("forme", 100, 200, 140, 70, choix, nonChoix);
    Bouton menu = new Bouton("menu", 100, 300, 140, 70, choix, nonChoix);
    listeBouton.add(couleur);
    listeBouton.add(forme);
    listeBouton.add(menu);
  }

  private void menuCouleur() {
    listeBouton.clear();
    Bouton couleur = new Bouton("couleur", 100, 100, 140, 70, choix, nonChoix);
    Bouton bleu = new BoutonValeur("bleu " + blue(couleurActuelle), 100, 200, 140, 70, choix, nonChoix, blue(couleurActuelle));
    Bouton rouge = new BoutonValeur("rouge " + red(couleurActuelle), 100, 300, 140, 70, choix, nonChoix, red(couleurActuelle));
    Bouton vert = new BoutonValeur("vert " + blue(couleurActuelle), 100, 400, 140, 70, choix, nonChoix, green(couleurActuelle));
    Bouton ok = new Bouton("OK", 100, 500, 140, 70, choix, nonChoix);
    listeBouton.add(couleur);
    listeBouton.add(bleu);
    listeBouton.add(rouge);
    listeBouton.add(vert);
    listeBouton.add(ok);
  }
  public void cliqueBoutonBleu() {
    System.out.println("test2");

    if (menuActuel == 0) {
      switch(curseur) {
      case 0:
        this.menuDessin();
        this.setCurseur(0);
        this.setMenuActuel(1);
        break;
      case 1:
        exit();
      default : 
        System.out.println("erreur");
      }
    } else
      if (menuActuel == 1) {
        switch(curseur) {
        case 0: 
          this.menuCouleur();
          this.setCurseur(0);
          this.setMenuActuel(2);
          break;
        case 1:
          break;
        case 2: 
          this.menuDemarrage();
          this.setCurseur(0);
          this.setMenuActuel(0);
          break;
        default : 
          System.out.println("erreur");
        }
      } else
        if (menuActuel == 2) {
          switch(curseur) {
          case 0:
            break;
          case 1:
            break;
          case 4:
            this.menuDessin();
            this.setCurseur(0);
            this.setMenuActuel(1);
            break;
          default : 
            System.out.println("erreur");
          }
        }
  }

  public void afficheMenu() {
    for (int i = 0; i < this.getListeBoutonTaille(); i++) {
      if (i == this.curseur) {
        this.listeBouton.get(i).active();
      } else {
        this.listeBouton.get(i).desactive();
      }
      this.listeBouton.get(i).dessineBouton();
    }
  }
}
