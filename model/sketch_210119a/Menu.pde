void creeMenu() {
  Settings reglageLightThemeWithTitle = new Settings(Settings.LIGHTTHEMEWITHTITLE);
  Settings reglageLightTheme = new Settings(Settings.LIGHTTHEME);

  reglageLightThemeWithTitle.setSizeText(32);
  reglageLightThemeWithTitle.setxTitle(15);
  menuDemarrage = new Menu(reglageLightTheme);
  menuCouleurUnInte = new Menu(reglageLightThemeWithTitle);
  menuCouleurDeuxInte = new Menu(reglageLightThemeWithTitle);
  menuCouleurTroisInte = new Menu(reglageLightThemeWithTitle);
  menuCouleurChoixInte = new Menu(reglageLightThemeWithTitle);
  menuCouleurUnExt = new Menu(reglageLightThemeWithTitle);
  menuCouleurDeuxExt = new Menu(reglageLightThemeWithTitle);
  menuCouleurTroisExt = new Menu(reglageLightThemeWithTitle);
  menuCouleurChoixExt = new Menu(reglageLightThemeWithTitle);
  menuForme = new Menu(reglageLightTheme);
  menuSauv = new Menu(reglageLightThemeWithTitle);
  menuChargement = new Menu(reglageLightTheme);
  menuPinceau = new  Menu(reglageLightTheme);
  menuEpaisseur = new  Menu(reglageLightTheme);
  menuTailleForme = new  Menu(reglageLightTheme);
  menuZone = new  Menu(reglageLightTheme);
  menuValeur = new  Menu(reglageLightTheme);
  menuMosaique = new  Menu(reglageLightTheme);
  menuChoixForme = new  Menu(reglageLightTheme);
  menuTailleMosaique = new  Menu(reglageLightTheme);
  menuChoixImage = new  Menu(reglageLightTheme);
  menuNbMosaique = new  Menu(reglageLightTheme);
}


void creeMenuNbMosaique() {
  menuChoixForme.addButton("peu", new ButtonListener() {
    public void buttonListener() {
      donnee.setNbFormeMosaique(50);
      mtp.setMenuCurrent(menuMosaique);
    }
  }
  );
  menuChoixForme.addButton("moyen", new ButtonListener() {
    public void buttonListener() {
      donnee.setNbFormeMosaique(100);
      mtp.setMenuCurrent(menuMosaique);
    }
  }
  );
  menuChoixForme.addButton("beaucoup", new ButtonListener() {
    public void buttonListener() {
      donnee.setNbFormeMosaique(150);
      mtp.setMenuCurrent(menuMosaique);
    }
  }
  );
}
void creeMenuChoixImage() {
  String cheminFichier = getCheminDossier("image");
  java.io.File dossierImage = new java.io.File(dataPath(cheminFichier));
  String[] listeNomFichier= dossierImage.list();
  menuChoixImage.addButton("menu", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuDemarrage);
    }
  }
  );

  if ( listeNomFichier.length > 0) {
    for (int i = 0; i < listeNomFichier.length; i++) {
      final String cour = listeNomFichier[i];
      menuChoixImage.addButton(listeNomFichier[i], new ButtonListener() {
        public void buttonListener() {
          setImage("image/"+cour);
          mtp.setMenuCurrent(menuMosaique);
        }
      }
      );
    }
  }
}

void creeMenuChoixForme() {
  menuChoixForme.addButton("Aléatoire", new ButtonListener() {
    public void buttonListener() {
      donnee.setChoixFormeMosaique(-1);
      mtp.setMenuCurrent(menuMosaique);
    }
  }
  );
  ArrayList<String> listeForme = creeListeDeForme();

  for (int i = 0; i < 6; i++) {
    final int j = i;
    menuChoixForme.addButton(listeForme.get(i), new ButtonListener() {
      public void buttonListener() {
        donnee.setChoixFormeMosaique(j);
        mtp.setMenuCurrent(menuMosaique);

        /*stroke(donnee.getCouleur());
         fill(donnee.getCouleur());
         dessineForme(j, new Couleur(donnee.getCouleur()));
         */
      }
    }
    );
  }
}


void creeMenuTailleMosaique() {
  menuTailleMosaique.addButton("Petit", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuMosaique);
      donnee.setTailleMosaique(donnee.PETIT);
    }
  }
  );

  menuTailleMosaique.addButton("Moyen", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuMosaique);
      donnee.setTailleMosaique(donnee.MOYEN);
    }
  }
  );
  menuTailleMosaique.addButton("Grand", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuMosaique);
      donnee.setTailleMosaique(donnee.GRAND);
    }
  }
  );
}


void creeMenuMosaique() {
  menuMosaique.addButton("choix des formes", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuChoixForme);
    }
  }
  );
  menuMosaique.addButton("choix de la taille", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuTailleMosaique);
    }
  }
  );
  menuMosaique.addButton("choix de l'image", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuChoixImage);
    }
  }
  );
  menuMosaique.addButton("affiche : " + donnee.getAfficheImage(), new ButtonListener() {
    public void buttonListener() {
      donnee.setAfficheImage(!donnee.getAfficheImage());
      menuMosaique.renameButton(3, "affiche : " + donnee.getAfficheImage());
      afficheImage();
    }
  }
  );
  menuMosaique.addButton("lancer", new ButtonListener() {
    public void buttonListener() {
      for (int i = 0; i< donnee.getNbFormeMosaique(); i++) {
        dessineMosaique(donnee.getChoixFormeMosaique(), donnee.getTailleMosaique());
      }
    }
  }
  );
}


void creeMenuZone() {
  menuZone.addButton("ensemble de l'écran", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(0);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("gauche", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(1);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("centre", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(2);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("droite", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(3);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("haut gauche", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(4);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("haut centre", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(5);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("haut droite", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(6);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("centre gauche", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(7);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("centre", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(8);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("centre droite", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(9);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("bas gauche", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(10);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("bas centre", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(11);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuZone.addButton("bas droite", new ButtonListener() {
    public void buttonListener() {
      donnee.setZone(12);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
}
void creeMenuTailleForme() {
  menuTailleForme.addButton("Petit", new ButtonListener() {
    public void buttonListener() {
      donnee.setTailleForme(donnee.PETIT);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );

  menuTailleForme.addButton("Moyen", new ButtonListener() {
    public void buttonListener() {
      donnee.setTailleForme(donnee.MOYEN);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
  menuTailleForme.addButton("Grand", new ButtonListener() {
    public void buttonListener() {
      donnee.setTailleForme(donnee.GRAND);
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
}

void creeMenuDemarrage() {
  //menuDemarrage
  menuDemarrage.addButton("Start", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );

  menuDemarrage.addButton("Mosaique", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuMosaique);
    }
  }
  );
  menuDemarrage.addButton("Sauver", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuSauv);
    }
  }
  );
  menuDemarrage.addButton("Charger", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuChargement);
    }
  }
  );
  menuDemarrage.addButton("Quitter", new ButtonListener() {
    public void buttonListener() {
      exit();
    }
  }
  );
}


void creeMenuCouleurUnInte() {
  //menuCouleurUn
  menuCouleurUnInte.addTitle("R : " + donnee.getRougeInte());
  for (int i = 0; i<256; i=i+10) {
    final int j = i;
    menuCouleurUnInte.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setRougeInte(j);
        mtp.setMenuCurrent(menuCouleurChoixInte);
      }
    }
    );
  }
  menuCouleurUnInte.addTitle(""+donnee.getRougeInte());
}


void creeMenuCouleurDeuxInte() {
  //menuCouleurDeux
  menuCouleurDeuxInte.addTitle( "V : " + donnee.getVertInte());
  for (int i = 0; i<256; i=i+10) {
    final int j = i;
    menuCouleurDeuxInte.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setVertInte(j);
        mtp.setMenuCurrent(menuCouleurChoixInte);
      }
    }
    );
  }
  menuCouleurUnInte.addTitle(""+donnee.getVertInte());
}

void creeMenuCouleurTroisInte() {
  //menuCouleurTrois
  menuCouleurTroisInte.addTitle("B : " + donnee.getBleuInte());
  for (int i = 0; i<256; i=i+10) {
    final int j = i;
    menuCouleurTroisInte.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setBleuInte(j);
        mtp.setMenuCurrent(menuCouleurChoixInte);
      }
    }
    );
  }
  menuCouleurUnInte.addTitle(""+donnee.getBleuInte());
}


void creeMenuCouleurChoixInte() {
  //menuCouleurChoix
  menuCouleurChoixInte.addTitle("R : " + donnee.getRougeInte() + " V : " + donnee.getVertInte() + " B : " + donnee.getBleuInte());
  menuCouleurChoixInte.addButton("R", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurUnInte);
    }
  }
  );

  menuCouleurChoixInte.addButton("V", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurDeuxInte);
    }
  }
  );
  menuCouleurChoixInte.addButton("B", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurTroisInte);
    }
  }
  );
  menuCouleurChoixInte.addButton("Retour", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
}


void creeMenuCouleurUnExt() {
  //menuCouleurUn
  menuCouleurUnExt.addTitle("R : " + donnee.getRougeExt());

  for (int i = 0; i<256; i=i+10) {
    final int j = i;
    menuCouleurUnExt.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setRougeExt(j);
        mtp.setMenuCurrent(menuCouleurChoixExt);
      }
    }
    );
  }
  menuCouleurUnInte.addTitle(""+donnee.getRougeExt());
}


void creeMenuCouleurDeuxExt() {
  //menuCouleurDeux
  menuCouleurDeuxExt.addTitle("V : " + donnee.getVertExt());

  for (int i = 0; i<256; i=i+10) {
    final int j = i;
    menuCouleurDeuxExt.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setVertExt(j);
        mtp.setMenuCurrent(menuCouleurChoixExt);
      }
    }
    );
  }
  menuCouleurUnInte.addTitle(""+donnee.getVertExt());
}

void creeMenuCouleurTroisExt() {
  //menuCouleurTrois
  menuCouleurTroisExt.addTitle( "B : " + donnee.getBleuExt());

  for (int i = 0; i<256; i=i+10) {
    final int j = i;
    menuCouleurTroisExt.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setBleuExt(j);
        mtp.setMenuCurrent(menuCouleurChoixExt);
      }
    }
    );
  }
  menuCouleurUnInte.addTitle(""+donnee.getBleuExt());
}


void creeMenuCouleurChoixExt() {
  //menuCouleurChoix
  menuCouleurChoixExt.addTitle("R : " + donnee.getRougeExt() + " V : " + donnee.getVertExt() + " B : " + donnee.getBleuExt());
  menuCouleurChoixExt.addButton("R", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurUnExt);
    }
  }
  );

  menuCouleurChoixExt.addButton("V", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurDeuxExt);
    }
  }
  );
  menuCouleurChoixExt.addButton("B", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurTroisExt);
    }
  }
  );
  menuCouleurChoixExt.addButton("Retour", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
}
void creeMenuValeur() {
  menuValeur.addButton("Int : "+ "R : " + donnee.getRougeInte() + " V : " + donnee.getVertInte() + " B : " + donnee.getBleuInte(), new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuValeur.addButton("Ext : "+ "R : " + donnee.getRougeExt() + " V : " + donnee.getVertExt() + " B : " + donnee.getBleuExt(), new ButtonListener() {
    public void buttonListener() {
    }
  }
  );

  menuValeur.addButton("Epaisseur : " + donnee.getEpaisseur(), new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuValeur.addButton("taille : " + getNomTaille(), new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuValeur.addButton("zone: "+ donnee.getZone(), new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuValeur.addButton(donnee.getNomForme(), new ButtonListener() {
    public void buttonListener() {
    }
  }
  );

  menuValeur.addButton("Retour", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );
}



void creeMenuPinceau() {
  menuPinceau.addButton("Couleur Ext", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurChoixExt);
    }
  }
  );
  menuPinceau.addButton("Couleur Int", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurChoixInte);
    }
  }
  );
  menuPinceau.addButton("Epaisseur", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuEpaisseur);
    }
  }
  );
  menuPinceau.addButton("Taille", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuTailleForme);
    }
  }
  );
  menuPinceau.addButton("Forme", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuForme);
    }
  }
  );
  menuPinceau.addButton("Zone", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuZone);
    }
  }
  );
  menuPinceau.addButton("Valeurs", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuValeur);
    }
  }
  );
  menuPinceau.addButton("Menu", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuDemarrage);
    }
  }
  );
}
void creeMenuEpaisseur() {
  for (int i = 1; i < 36; i++) {
    final int j = i;
    menuEpaisseur.addButton(j+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setEpaisseur(j);
        mtp.setMenuCurrent(menuPinceau);

        /*stroke(donnee.getCouleur());
         fill(donnee.getCouleur());
         dessineForme(j, new Couleur(donnee.getCouleur()));
         */
      }
    }
    );
  }
}
void creeMenuForme() {
  //menuForme
  ArrayList<String> listeForme = creeListeDeForme();

  for (int i = 0; i < listeForme.size(); i++) {
    final int j = i;
    menuForme.addButton(listeForme.get(i), new ButtonListener() {
      public void buttonListener() {
        donnee.setForme(j);
        mtp.setMenuCurrent(menuPinceau);

        /*stroke(donnee.getCouleur());
         fill(donnee.getCouleur());
         dessineForme(j, new Couleur(donnee.getCouleur()));
         */
      }
    }
    );
  }
}

void creeMenuSauv() {
  //menuSauv
  menuSauv.addTitle(donnee.nomJoueur);
  for (int i = 65; i < 91; i++) {
    final int j = i;
    menuSauv.addButton(char(i) + "", new ButtonListener() {
      public void buttonListener() {
        donnee.setNomJoueur(donnee.getNomJoueur()+char(j));
        menuSauv.addTitle(donnee.getNomJoueur());
      }
    }
    );
  }
  menuSauv.addButton("retour", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuDemarrage);
    }
  }
  );
  menuSauv.addButton("SAUVER", new ButtonListener() {
    public void buttonListener() {
      save.save(donnee.nomJoueur);
    }
  }
  );
}

void creeMenuChargement() {
  //menuChargement
  String cheminFichier = getCheminDossier("saves");
  java.io.File dossierSaves = new java.io.File(dataPath(cheminFichier));
  String[] listeNomFichier= dossierSaves.list();
  menuChargement.addButton("menu", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuDemarrage);
    }
  }
  );

  if ( listeNomFichier.length > 0) {
    for (int i = 0; i < listeNomFichier.length; i++) {
      final String cour = listeNomFichier[i];
      menuChargement.addButton(listeNomFichier[i], new ButtonListener() {
        public void buttonListener() {
          save.load(cour);
        }
      }
      );
    }
  }
}

/*
  * retourne le chemin du dossier se trouvant dans le dossier sketch (en s'adaptant en fonction de l'OS)
 * dossier : dossier rechercher
 * retourne un String du chemin associé 
 */
private String getCheminDossier(String dossier) {
  String chemin = "";
  String cheminSketch = sketchPath();
  char separateur = '0';
  char sepMacos = '/';
  char sepWindows = '\\';
  for (int i = 0; i < cheminSketch.length(); i++) {
    char sep = cheminSketch.charAt(i);
    if (sep == sepMacos) {
      separateur = sepMacos;
    }
    if (sep == sepWindows) {
      separateur = sepWindows;
    }
  }
  if (separateur != '0') {
    chemin = cheminSketch + separateur + dossier;
  } else {
    chemin = "erreur, dossier \"" + dossier + "\" introuvable";
  }
  return chemin;
}
void changeMenu(int menuCour) {
  switch(menuCour) {

  case 0:
    mtp.setMenuCurrent(menuSauv);
    break;
  case 1:
    mtp.setMenuCurrent(menuChargement);
    break;
  case 2:
    mtp.setMenuCurrent(menuDemarrage);
    break;
  }
}

public class Donnee {
  public int MAXINT = 10, PETIT = 0, MOYEN = 1, GRAND = 2;
  private int[] inte, ext; 
  private int menu, forme, epaisseur, tailleForme, zone, tailleMosaique, choixFormeMosaique, nbFormeMosaique;
  private String nomJoueur;
  private Boolean afficheImage;
  public Donnee() {
    inte = new int[]{0, 0, 0};
    ext = new int[]{0, 0, 0};
    this.nomJoueur = "";
    this.menu = 0;
    this.forme = 0;
    this.epaisseur = 2;
    this.tailleForme = 1;
    this.zone = 0;
    this.tailleMosaique = 1;
    this.choixFormeMosaique = 6;//aléatoire
    this.afficheImage = false;
    this.nbFormeMosaique = 50;
  }
  public void setNbFormeMosaique(int cour) {
    this.nbFormeMosaique = cour;
  }
  public int getNbFormeMosaique() {
    return this.nbFormeMosaique;
  }
  public void setAfficheImage(Boolean cour) {
    this.afficheImage = cour;
  }
  public Boolean getAfficheImage() {
    return this.afficheImage;
  }

  public void setChoixFormeMosaique(int cour) {
    this.choixFormeMosaique = cour;
  }
  public int getChoixFormeMosaique() {
    return this.choixFormeMosaique;
  }

  public void setTailleMosaique(int cour) {
    this.tailleMosaique = cour;
  }
  public int getTailleMosaique() {
    return this.tailleMosaique;
  }

  public void setZone(int cour) {
    this.zone = cour;
    String texte = "";
    switch(cour) {
      case(0):
      texte = "ensemble de l'écran";
      case(1):
      texte = "gauche";

      case(2):
      texte = "centre";
      case(3):
      texte = "droite";
      case(4):
      texte = "haut gauche";
      case(5):
      texte = "haut centre";
      case(6):
      texte = "haut droite";
      case(7):
      texte = "centre gauche";
      case(8):
      texte = "centre";
      case(9):
      texte = "centre droite";
      case(10):
      texte = "bas gauche";
      case(11):
      texte = "bas centre";
      case(12):
      texte = "bas droite";
    }
    menuValeur.renameButton(4, "zone: "+ texte);
  }
  public int getZone() {
    return this.zone;
  }
  public void setTailleForme(int cour) {
    this.tailleForme = cour;
    menuValeur.renameButton(3, "taille forme : "+ donnee.getTailleForme());
  }
  public String getNomTaille(){
    switch (this.tailleForme){
      case(0):
      return "petit";
      case(1):
      return "moyen";
      case(2):
      return "grand";
    }
    return "";
  }
  public int getTailleForme() {
    return this.tailleForme;
  }
  public void setEpaisseur(int cour) {
    this.epaisseur = cour;
    menuValeur.renameButton(2, "epaisseur : "+ donnee.getEpaisseur());
  }
  public int getEpaisseur() {
    return this.epaisseur;
  }
  public color getCouleurInte() {
    return color(inte[0], inte[1], inte[2]);
  }

  public int getRougeInte() {
    return inte[0];
  }
  public void setRougeInte(int rouge) {
    this.inte[0] = rouge;
    menuValeur.renameButton(1, "Int : "+ "R : " + donnee.getRougeInte() + " V : " + donnee.getVertInte() + " B : " + donnee.getBleuInte());

    menuCouleurChoixInte.addTitle("R : " + donnee.getRougeInte() + " V : " + donnee.getVertInte() + " B : " + donnee.getBleuInte());
    menuCouleurUnInte.addTitle("R : " + donnee.getRougeInte());
  }
  public int getVertInte() {
    return inte[1];
  }
  public void setVertInte(int vert) {
    this.inte[1] = vert;
    menuValeur.renameButton(1, "Int : "+ "R : " + donnee.getRougeInte() + " V : " + donnee.getVertInte() + " B : " + donnee.getBleuInte());

    menuCouleurChoixInte.addTitle("R : " + donnee.getRougeInte() + " V : " + donnee.getVertInte() + " B : " + donnee.getBleuInte());
    menuCouleurDeuxInte.addTitle("V : " + donnee.getVertInte());
  }
  public int getBleuInte() {
    return inte[2];
  }
  public void setBleuInte(int bleu) {
    this.inte[2] = bleu;
    menuValeur.renameButton(1, "Int : "+ "R : " + donnee.getRougeInte() + " V : " + donnee.getVertInte() + " B : " + donnee.getBleuInte());
    menuCouleurChoixInte.addTitle("R : " + donnee.getRougeInte() + " V : " + donnee.getVertInte() + " B : " + donnee.getBleuInte());
    menuCouleurTroisInte.addTitle("B : " + donnee.getBleuInte());
  }

  public color getCouleurExt() {
    return color(ext[0], ext[1], ext[2]);
  }

  public int getRougeExt() {
    return ext[0];
  }
  public void setRougeExt(int rouge) {
    this.ext[0] = rouge;
    menuValeur.renameButton(0, "Ext : "+ "R : " + donnee.getRougeExt() + " V : " + donnee.getVertExt() + " B : " + donnee.getBleuExt());

    menuCouleurChoixExt.addTitle("R : " + donnee.getRougeExt() + " V : " + donnee.getVertExt() + " B : " + donnee.getBleuExt());
    menuCouleurUnExt.addTitle( "R : " + donnee.getBleuExt());
  }
  public int getVertExt() {
    return ext[1];
  }
  public void setVertExt(int vert) {
    this.ext[1] = vert;
    menuValeur.renameButton(0, "Ext : "+ "R : " + donnee.getRougeExt() + " V : " + donnee.getVertExt() + " B : " + donnee.getBleuExt());

    menuCouleurChoixExt.addTitle("R : " + donnee.getRougeExt() + " V : " + donnee.getVertExt() + " B : " + donnee.getBleuExt());
    menuCouleurDeuxExt.addTitle( "V : " + donnee.getVertExt());
  }
  public int getBleuExt() {
    return ext[2];
  }
  public void setBleuExt(int bleu) {
    this.ext[2] = bleu;
    menuValeur.renameButton(0, "Ext : "+ "R : " + donnee.getRougeExt() + " V : " + donnee.getVertExt() + " B : " + donnee.getBleuExt());
    menuCouleurChoixExt.addTitle("R : " + donnee.getRougeExt() + " V : " + donnee.getVertExt() + " B : " + donnee.getBleuExt());
    menuCouleurTroisExt.addTitle( "B : " + donnee.getBleuExt());
  }
  public String getNomJoueur() {
    return nomJoueur;
  }
  public void setNomJoueur(String nomJoueur) {
    this.nomJoueur = nomJoueur;
  }
  public void setForme(int forme) {
    this.forme = forme;
    menuValeur.renameButton(5, donnee.getNomForme());

    //renameforme
  }
  public int getForme() {
    return forme;
    //renameforme
  }
  public String getNomForme() {
    return creeListeDeForme().get(this.forme);
  }
  void gaucheCurseur() {
    this.menu--;
    if (menu < 0) {
      menu = this.MAXINT;
    }
    changeMenu(this.menu);
  }
  void droiteCurseur() {
    this.menu++;
    if (menu > this.MAXINT) {
      menu = 0;
    }
    println("menu numero : " + this.menu);
    changeMenu(this.menu);
  }
}
