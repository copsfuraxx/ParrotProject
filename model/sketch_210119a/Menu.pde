class MenuListe {

  private int menuActuel;//le menu actuel 0 menu de démarrage
  /*
  menuActuel 0 menu de démarrage
   menuActuel 1 menu de dessin
   
   */
  private ArrayList<Bouton> listeBouton;
  private int curseur;//savoir sur quel bouton nous sommes
  private Couleur couleurActuelle;
  private int forme;
  private String nomJoueur = "_______";
  private int  menuActuelCour6 ;
  private String  nomFichier;


  public void setNomJoueur(String nom) {
    this.nomJoueur = nom;
  }
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

  public void setCouleurActuelle(Couleur couleur) {
    this.couleurActuelle = couleur;
  }

  public Couleur getCouleurActuelle() {
    return this.couleurActuelle;
  }

  public String getNomForme() {
    ArrayList<String> listeForme = creeListeDeForme();
    return listeForme.get(forme);
  }

  public MenuListe(int menuChoix) {
    if (menuChoix == 0) {

      this.menuActuel = 0;
      this.listeBouton = new ArrayList<Bouton>();
      this.menuDemarrage();
      this.forme = 0;
      this.setCouleurActuelle(new Couleur(0, 0, 0));
    }
  }

  Couleur nonChoix = new Couleur(color(200, 230, 215));
  Couleur choix = new Couleur(color(100, 100, 200));

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
    Bouton bleu = new BoutonValeur("bleu " + couleurActuelle.getBleuEntier(), 100, 200, 140, 70, choix, nonChoix, couleurActuelle.getBleu());
    Bouton rouge = new BoutonValeur("rouge " + couleurActuelle.getRougeEntier(), 100, 300, 140, 70, choix, nonChoix, couleurActuelle.getRouge());
    Bouton vert = new BoutonValeur("vert " + couleurActuelle.getVertEntier(), 100, 400, 140, 70, choix, nonChoix, couleurActuelle.getRouge());
    Bouton ok = new Bouton("OK", 100, 500, 140, 70, choix, nonChoix);
    listeBouton.add(couleur);
    listeBouton.add(bleu);
    listeBouton.add(rouge);
    listeBouton.add(vert);
    listeBouton.add(ok);
  }

  private void menuCouleurChoix() {//menu du choix rapide de la couleur 3
    listeBouton.clear();
    Bouton noir = new Bouton("noir", 100, 100, 140, 70, new Couleur(15, 15, 15), nonChoix);
    Bouton bleu = new Bouton("bleu", 100, 200, 140, 70, new Couleur(0, 0, 255), nonChoix);
    Bouton rouge = new Bouton("rouge", 100, 300, 140, 70, new Couleur(255, 0, 0), nonChoix);
    Bouton vert = new Bouton("vert", 100, 400, 140, 70, new Couleur(0, 255, 0), nonChoix);

    listeBouton.add(noir);
    listeBouton.add(bleu);
    listeBouton.add(rouge);
    listeBouton.add(vert);
  }

  private void menuInfo() {//menu de suivi de valeur pendant le dessin 4 
    listeBouton.clear();
    Bouton pot = new Bouton("pot : " + getPot(), 100, 100, 140, 70, choix, nonChoix);
    Bouton forme = new Bouton(this.getNomForme(), 100, 200, 140, 70, choix, nonChoix);

    listeBouton.add(pot);
    listeBouton.add(forme);
  }

  private void menuForme() {//menu de choix des formes 5
    listeBouton.clear();
    ArrayList<String> listeForme = creeListeDeForme();

    for (int i = 0; i < listeForme.size(); i++) {
      Bouton bouton = new Bouton(listeForme.get(i), 2000, 100, 140, 70, choix, nonChoix);

      if (this.curseur == i) {
        bouton.setX(100);
        bouton.setY(200);
        nomFichier = listeForme.get(i);
      } else if (this.curseur == i - 1) {
        bouton.setX(100);
        bouton.setY(100);
      } else if (this.curseur == i + 1) {
        bouton.setX(100);
        bouton.setY(300);
      }
      listeBouton.add(bouton);
    }
  }
  private void menuSauvNom() {//menu de saisie du nomJoueur 6
    listeBouton.clear();
    for (int i = 0; i < this.nomJoueur.length(); i++) {
      Bouton bouton = new Bouton(this.nomJoueur.substring(i, i+1), 20 + i * 40, 100, 40, 40, choix, nonChoix);
      listeBouton.add(bouton);
    }
    Bouton ok = new Bouton("ok", 100, 500, 140, 70, choix, nonChoix);

    listeBouton.add(ok);
  }

  private void menuSauvLettre() {//menu de la saisie des lettres 7
    listeBouton.clear();
    int j = 0;
    for (int i = 48; i < 58; i++) {
      Bouton bouton = new Bouton(char(i) + "", 2000, 100, 140, 70, choix, nonChoix);

      if (this.curseur == j) {
        bouton.setX(100);
        bouton.setY(200);
      } else if (this.curseur == j - 1) {
        bouton.setX(100);
        bouton.setY(100);
      } else if (this.curseur == j + 1) {
        bouton.setX(100);
        bouton.setY(300);
      }

      listeBouton.add(bouton);

      j++;
    }
    for (int i = 65; i < 91; i++) {
      Bouton bouton = new Bouton(char(i) + "", 2000, 100, 140, 70, choix, nonChoix);

      if (this.curseur == j) {
        bouton.setX(100);
        bouton.setY(200);
      } else if (this.curseur == j - 1) {
        bouton.setX(100);
        bouton.setY(100);
      } else if (this.curseur == j + 1) {
        bouton.setX(100);
        bouton.setY(300);
      }

      listeBouton.add(bouton);

      j++;
    }
  }

  private void menuChargement() {//menu de récupération des sauvegardes 8
    listeBouton.clear();
    String cheminFichier = sketchPath() + "\\saves";
    println(cheminFichier);
    java.io.File dossierSaves = new java.io.File(dataPath(cheminFichier));
    String[] listeNomFichier= dossierSaves.list();
    Bouton boutonRetour = new Bouton("retour", 100, 100, 140, 70, choix, nonChoix);
    listeBouton.add(boutonRetour);

    if ( listeNomFichier.length > 0) {
      for (int i = 0; i < listeNomFichier.length; i++) {
        Bouton bouton = new Bouton(listeNomFichier[i], 2000, 100, 140, 70, choix, nonChoix);

        if (this.curseur == i+1) {//position du curseur
          bouton.setX(100);
          bouton.setY(300);
          nomFichier = listeNomFichier[i];
        } else if (this.curseur == i) {//en dessous du curseur
          bouton.setX(100);
          bouton.setY(200);
        } else if (this.curseur == i + 2) {//au dessus du curseur
          bouton.setX(100);
          bouton.setY(400);
        }

        listeBouton.add(bouton);
      }
    }
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
        this.menuSauvNom();
        this.setCurseur(0);
        this.setMenuActuel(6);
        break;
      case 3 : 
        this.menuChargement();
        this.setCurseur(0);
        this.setMenuActuel(8);
        break;
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
              this.couleurActuelle = new Couleur(color(0, 0, 0));
              this.menuCouleur();
              this.setCurseur(1);
              this.setMenuActuel(2);
              break;
            case 1:
              this.couleurActuelle = new Couleur(color(0, 0, 255));
              this.menuCouleur();
              this.setCurseur(1);
              this.setMenuActuel(2);
              break;
            case 2:
              this.couleurActuelle = new Couleur(color(255, 0, 0));
              this.menuCouleur();
              this.setCurseur(1);
              this.setMenuActuel(2);
              break;
            case 3:
              this.couleurActuelle = new Couleur(color(0, 255, 0));
              this.menuCouleur();
              this.setCurseur(1);
              this.setMenuActuel(2);
              break;
            default : 
              System.out.println("erreur");
            }
          } else if (menuActuel == 4) {
            stroke(couleurActuelle.getCouleur());
            fill(couleurActuelle.getCouleur());
            dessineForme(this.getForme(), couleurActuelle);
          } else if (menuActuel == 5) {
            this.forme = curseur;
            this.menuDessin();
            this.setCurseur(0);
            this.setMenuActuel(1);
          } else if (menuActuel == 6) {
            if (curseur < 7) {
              menuActuelCour6 = curseur;
              this.setCurseur(trouveCharListe(this.nomJoueur.charAt(menuActuelCour6)));
              this.setMenuActuel(7);
              this.menuSauvLettre();
            } else if (curseur == 7) {
              save.save(this.nomJoueur);
              this.menuDemarrage();
              this.setCurseur(0);
              this.setMenuActuel(0);
            }
          } else if (menuActuel == 7) {
            char[] tab = this.nomJoueur.toCharArray();
            tab[menuActuelCour6] = this.getListeBouton().get(curseur).getPremierChar();
            this.setNomJoueur(String.valueOf(tab));
            this.menuSauvNom();
            this.setCurseur(0);
            this.setMenuActuel(6);
          } else if (menuActuel == 8) {
            save.load(nomFichier);
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

  public int trouveCharListe(char c) {
    for (int i = 0; i < this.getListeBoutonTaille(); i++) {
      if (this.getListeBouton().get(i).getPremierChar() == c) {
        return i;
      }
    }
    return -1;
  }

  private String nomJoueurSansBarre() {
    char[] tab = this.nomJoueur.toCharArray();
    for (int i = 0; i < tab.length; i++) {
      if (tab[i] == '_') {
        tab[i] =' ';
      }
    }
    return String.valueOf(tab);
  }



  public void actualise() {
    switch(this.getMenuActuel()) {
    case 5:
      this.menuForme();
      break;
    case 7:
      this.menuSauvLettre();
      break;
    default : 
      break;
    }
  }
}
