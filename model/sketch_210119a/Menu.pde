class MenuListe {

  private int menuActuel;//le menu actuel 0 menu de démarrage
  /*
  menuActuel 0 menu de démarrage
   menuActuel 1 menu de dessin
   
   */
  private ArrayList<Bouton> listeBouton;
  private int curseur;//savoir sur quel bouton nous sommes
  private color couleurActuelle;
  private int forme;


  public int getForme() {
    return this.forme;
  }

  public void setForme(int forme) {
    this.forme = forme;
  }

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

  public String getNomForme() {
    switch(this.forme) {
    case 0 :
      return "carre";
    case 1 :
      return "rond";
    case 2 :
      return "koch";
    default : 
      return "erreur";
    }
  }

  public MenuListe(int menuChoix) {
    if (menuChoix == 0) {

      this.menuActuel = 0;
      this.listeBouton = new ArrayList<Bouton>();
      this.menuDemarrage();
      this.forme = 0;
    }
  }

  color nonChoix = color(200, 230, 215);
  color choix = color(100, 100, 200);

  private void menuDemarrage() {//menu de départ 0
    listeBouton.clear();
    Bouton start = new Bouton("start", 100, 100, 140, 70, choix, nonChoix);
    Bouton quitter = new Bouton("quitter", 100, 200, 140, 70, choix, nonChoix);
    Bouton sauv = new Bouton("sauver", 100, 300, 140, 70, choix, nonChoix);
    Bouton charge = new Bouton("charger", 100, 400, 140, 70, choix, nonChoix);


    listeBouton.add(start);
    listeBouton.add(quitter);
    listeBouton.add(sauv);
    listeBouton.add(charge);
  }

  private void menuDessin() {//menu avec la feuille de dessin 1
    listeBouton.clear();

    Bouton couleur = new Bouton("couleur", 100, 100, 140, 70, choix, nonChoix);
    Bouton forme = new Bouton("forme", 100, 200, 140, 70, choix, nonChoix);
    Bouton menu = new Bouton("menu", 100, 300, 140, 70, choix, nonChoix);
    listeBouton.add(couleur);
    listeBouton.add(forme);
    listeBouton.add(menu);
  }

  private void menuCouleur() {//menu principal de la couleur 2
    listeBouton.clear();
    Bouton couleur = new Bouton("couleur", 100, 100, 140, 70, choix, couleurActuelle);
    Bouton bleu = new BoutonValeur("bleu " + blue(couleurActuelle), 100, 200, 140, 70, choix, nonChoix, blue(couleurActuelle));
    Bouton rouge = new BoutonValeur("rouge " + red(couleurActuelle), 100, 300, 140, 70, choix, nonChoix, red(couleurActuelle));
    Bouton vert = new BoutonValeur("vert " + green(couleurActuelle), 100, 400, 140, 70, choix, nonChoix, green(couleurActuelle));
    Bouton ok = new Bouton("OK", 100, 500, 140, 70, choix, nonChoix);
    listeBouton.add(couleur);
    listeBouton.add(bleu);
    listeBouton.add(rouge);
    listeBouton.add(vert);
    listeBouton.add(ok);
  }

  private void menuCouleurChoix() {//menu du choix rapide de la couleur 3
    listeBouton.clear();
    Bouton noir = new Bouton("noir", 100, 100, 140, 70, color(15, 15, 15), nonChoix);
    Bouton bleu = new Bouton("bleu", 100, 200, 140, 70, color(0, 0, 255), nonChoix);
    Bouton rouge = new Bouton("rouge", 100, 300, 140, 70, color(255, 0, 0), nonChoix);
    Bouton vert = new Bouton("vert", 100, 400, 140, 70, color(0, 255, 0), nonChoix);

    listeBouton.add(noir);
    listeBouton.add(bleu);
    listeBouton.add(rouge);
    listeBouton.add(vert);
  }

  private void menuInfo() {//menu de suivi de valeur pendant le dessin 4 
    listeBouton.clear();
    Bouton pot = new Bouton("pot : " + getPot(), 100, 100, 140, 70, color(185, 185, 185), nonChoix);
    Bouton forme = new Bouton(this.getNomForme(), 100, 200, 140, 70, color(185, 185, 185), nonChoix);

    listeBouton.add(pot);
    listeBouton.add(forme);
  }

  private void menuForme() {//menu de choix des formes 5
    listeBouton.clear();
    Bouton carre = new Bouton("carre", 100, 100, 140, 70, color(185, 185, 185), nonChoix);
    Bouton rond = new Bouton("rond", 100, 200, 140, 70, color(185, 185, 185), nonChoix);
    Bouton koch = new Bouton("koch", 100, 300, 140, 70, color(185, 185, 185), nonChoix);


    listeBouton.add(carre);
    listeBouton.add(rond);
    listeBouton.add(koch);
  }

  public void cliqueBoutonBleu() {

    if (menuActuel == 0) {
      switch(curseur) {
      case 0:
        this.menuDessin();
        this.setCurseur(0);
        this.setMenuActuel(1);
        break;
      case 1:
        exit();
      case 2 :
        save.save();
        break;
      case 3 : 
        save.load();
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
          this.menuForme();
          this.setCurseur(0);
          this.setMenuActuel(5);
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
            this.menuCouleurChoix();
            this.setCurseur(0);
            this.setMenuActuel(3);
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
        } else
          if (menuActuel == 3) {
            switch(curseur) {
            case 0:
              this.couleurActuelle = color(0, 0, 0);
              this.menuCouleur();
              this.setCurseur(1);
              this.setMenuActuel(2);
              break;
            case 1:
              this.couleurActuelle = color(0, 0, 255);
              this.menuCouleur();
              this.setCurseur(1);
              this.setMenuActuel(2);
              break;
            case 2:
              this.couleurActuelle = color(255, 0, 0);
              this.menuCouleur();
              this.setCurseur(1);
              this.setMenuActuel(2);
              break;
            case 3:
              this.couleurActuelle = color(0, 255, 0);
              this.menuCouleur();
              this.setCurseur(1);
              this.setMenuActuel(2);
              break;
            default : 
              System.out.println("erreur");
            }
          } else if (menuActuel == 4) {
            stroke(couleurActuelle);
            fill(couleurActuelle);
            switch(forme) {
            case 0:
              dessineCarre();
              break;
            case 1:
              dessineCercle();
              break;

            case 2:
              floconKoch();
              break;

            default : 
              System.out.println("erreur");
            }
          } else if (menuActuel == 5) {
            this.forme = curseur;
            this.menuDessin();
            this.setCurseur(0);
            this.setMenuActuel(1);
          }
  }

  public void cliqueBoutonRouge() {
    if (menuActuel != 4) {
      this.menuInfo();
      this.setCurseur(0);
      this.setMenuActuel(4);
    } else {
      this.menuDessin();
      this.setCurseur(0);
      this.setMenuActuel(1);
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
