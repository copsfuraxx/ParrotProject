void creeMenu() {
  Settings reglageLightThemeWithTitle = new Settings(Settings.LIGHTTHEMEWITHTITLE);
  Settings reglageLightTheme = new Settings(Settings.LIGHTTHEME);

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
}



void creeMenuDemarrage() {
  //menuDemarrage
  menuDemarrage.addButton("start", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuPinceau);
    }
  }
  );

  menuDemarrage.addButton("mosaique", new ButtonListener() {
    public void buttonListener() {
      //to do
    }
  }
  );
  menuDemarrage.addButton("sauver", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuSauv);
    }
  }
  );
  menuDemarrage.addButton("charger", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuChargement);
    }
  }
  );
  menuDemarrage.addButton("quitter", new ButtonListener() {
    public void buttonListener() {
      exit();
    }
  }
  );
}


void creeMenuCouleurUnInte() {
  //menuCouleurUn
   menuCouleurUnInte.addTitle("R : " + donnee.getRougeInte());
  for (int i = 0; i<256; i++) {
    final int j = i;
    menuCouleurUnInte.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setRougeInte(j);
      }
    }
    );
  }
  menuCouleurUnInte.addTitle(""+donnee.getRougeInte());
}


void creeMenuCouleurDeuxInte() {
  //menuCouleurDeux
   menuCouleurDeuxInte.addTitle( "V : " + donnee.getVertInte());
  for (int i = 0; i<256; i++) {
    final int j = i;
    menuCouleurDeuxInte.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setVertInte(j);
      }
    }
    );
  }
  menuCouleurUnInte.addTitle(""+donnee.getVertInte());
}

void creeMenuCouleurTroisInte() {
  //menuCouleurTrois
   menuCouleurTroisInte.addTitle("B : " + donnee.getBleuInte());
  for (int i = 0; i<256; i++) {
    final int j = i;
    menuCouleurTroisInte.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setBleuInte(j);
      }
    }
    );
  }
  menuCouleurUnInte.addTitle(""+donnee.getBleuInte());
}


void creeMenuCouleurChoixInte() {
  //menuCouleurChoix
  menuCouleurChoixInte.addTitle("R : " + donnee.getRougeInte() + "V : " + donnee.getVertInte() + "B : " + donnee.getBleuInte());
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

  for (int i = 0; i<256; i++) {
    final int j = i;
    menuCouleurUnExt.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setRougeExt(j);
      }
    }
    );
  }
menuCouleurUnInte.addTitle(""+donnee.getRougeExt());
}


void creeMenuCouleurDeuxExt() {
  //menuCouleurDeux
    menuCouleurDeuxExt.addTitle("V : " + donnee.getVertExt());

  for (int i = 0; i<256; i++) {
    final int j = i;
    menuCouleurDeuxExt.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setVertExt(j);
      }
    }
    );
  }
menuCouleurUnInte.addTitle(""+donnee.getVertExt());
}

void creeMenuCouleurTroisExt() {
  //menuCouleurTrois
    menuCouleurTroisExt.addTitle( "B : " + donnee.getBleuExt());

  for (int i = 0; i<256; i++) {
    final int j = i;
    menuCouleurTroisExt.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setBleuInte(j);
      }
    }
    );
  }
menuCouleurUnInte.addTitle(""+donnee.getBleuExt());
}


void creeMenuCouleurChoixExt() {
  //menuCouleurChoix
  menuCouleurChoixExt.addTitle("R : " + donnee.getRougeExt() + "V : " + donnee.getVertExt() + "B : " + donnee.getBleuExt());
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
}
void creeMenuValeur() {
  menuValeur.addButton("couleurInt", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuValeur.addButton("couleurExt", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );

  menuValeur.addButton("eppai", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuValeur.addButton("tail", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );

  menuValeur.addButton("formeActu", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuValeur.addButton("choix", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuValeur.addButton("Retour", new ButtonListener() {
    public void buttonListener() {
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
    }
  }
  );
  menuPinceau.addButton("Taille", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuPinceau.addButton("Forme", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuPinceau.addButton("Zone", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuPinceau.addButton("Valeurs", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
  menuPinceau.addButton("Menu", new ButtonListener() {
    public void buttonListener() {
    }
  }
  );
}

void creeMenuForme() {
  //menuForme
  ArrayList<String> listeForme = creeListeDeForme();

  for (int i = 0; i < listeForme.size(); i++) {
    final int j = i;
    menuForme.addButton(listeForme.get(i), new ButtonListener() {
      public void buttonListener() {
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
  menuChargement.addButton("menu->", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuDemarrage);
    }
  }
  );
  menuChargement.addButton("<-sauver", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuSauv);
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
  public int MAXINT = 10;
  private int[] inte, ext; 
  private int menu, forme;
  private String nomJoueur;
  public Donnee() {
    inte = new int[]{0, 0, 0};
    ext = new int[]{0, 0, 0};
    this.nomJoueur = "";
    this.menu = 0;
    this.forme = 0;
  }

  public color getCouleurInte() {
    return color(inte[0], inte[1], inte[2]);
  }

  public int getRougeInte() {
    return inte[0];
  }
  public void setRougeInte(int rouge) {
    this.inte[0] = rouge;
  }
  public int getVertInte() {
    return inte[1];
  }
  public void setVertInte(int vert) {
    this.inte[1] = vert;
  }
  public int getBleuInte() {
    return inte[2];
  }
  public void setBleuInte(int bleu) {
    this.inte[2] = bleu;
  }

  public color getCouleurExt() {
    return color(ext[0], ext[1], ext[2]);
  }

  public int getRougeExt() {
    return ext[0];
  }
  public void setRougeExt(int rouge) {
    this.ext[0] = rouge;
  }
  public int getVertExt() {
    return ext[1];
  }
  public void setVertExt(int vert) {
    this.ext[1] = vert;
  }
  public int getBleuExt() {
    return ext[2];
  }
  public void setBleuExt(int bleu) {
    this.ext[2] = bleu;
  }
  public String getNomJoueur() {
    return nomJoueur;
  }
  public void setNomJoueur(String nomJoueur) {
    this.nomJoueur = nomJoueur;
  }
  public void setForme(int forme) {
    this.forme = forme;
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
