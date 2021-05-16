void creeMenu() {
  Settings reglageLightThemeWithTitle = new Settings(Settings.LIGHTTHEMEWITHTITLE);
  Settings reglageLightTheme = new Settings(Settings.LIGHTTHEME);

  menuDemarrage = new Menu(reglageLightTheme);
  menuDessin = new Menu(reglageLightTheme);
  menuCouleurUn = new Menu(reglageLightTheme);
  menuCouleurDeux = new Menu(reglageLightTheme);
  menuCouleurTrois = new Menu(reglageLightTheme);
  menuCouleurChoix = new Menu(reglageLightTheme);
  menuResume = new Menu(reglageLightTheme);
  menuForme = new Menu(reglageLightTheme);
  menuSauv = new Menu(reglageLightThemeWithTitle);
  menuChargement = new Menu(reglageLightTheme);
}



void creeMenuDemarrage() {
  //menuDemarrage
  menuDemarrage.addButton("start->", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuDessin);
    }
  }
  );
  menuDemarrage.addButton("quitter", new ButtonListener() {
    public void buttonListener() {
      exit();
    }
  }
  );
  menuDemarrage.addButton("sauver", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuSauv);
    }
  }
  );
  menuDemarrage.addButton("<-charger", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuChargement);
    }
  }
  );
}

void creeMenuDessin() {
  //menuDessin
  menuDessin.addButton("couleur->", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurChoix);
    }
  }
  );
  menuDessin.addButton("forme", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuForme);
    }
  }
  );
  menuDessin.addButton("<-menu", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuDemarrage);
    }
  }
  );
}

void creeMenuCouleurUn() {
  //menuCouleurUn
  for (int i = 0; i<256; i++) {
    final int j = i;
    menuCouleurUn.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setRouge(j);
      }
    }
    );
  }
  menuCouleurUn.addButton("<-couleur", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurChoix);
    }
  }
  );
  menuCouleurUn.addButton("vert->", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurDeux);
    }
  }
  );
}


void creeMenuCouleurDeux() {
  //menuCouleurDeux
  for (int i = 0; i<256; i++) {
    final int j = i;
    menuCouleurDeux.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setVert(j);
      }
    }
    );
  }
  menuCouleurDeux.addButton("<-rouge", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurUn);
    }
  }
  );
  menuCouleurDeux.addButton("bleu->", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurTrois);
    }
  }
  );
}

void creeMenuCouleurTrois() {
  //menuCouleurTrois
  for (int i = 0; i<256; i++) {
    final int j = i;
    menuCouleurTrois.addButton(i+"", new ButtonListener() {
      public void buttonListener() {
        donnee.setBleu(j);
      }
    }
    );
  }
  menuCouleurTrois.addButton("<-vert", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurDeux);
    }
  }
  );
  menuCouleurTrois.addButton("forme->", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuForme);
    }
  }
  );
}


void creeMenuCouleurChoix() {
  //menuCouleurChoix
  menuCouleurChoix.addButton("noir", new ButtonListener() {
    public void buttonListener() {
      donnee.setRouge(0);
      donnee.setVert(0);
      donnee.setBleu(0);
    }
  }
  );
  menuCouleurChoix.addButton("bleu", new ButtonListener() {
    public void buttonListener() {
      donnee.setRouge(0);
      donnee.setVert(0);
      donnee.setBleu(255);
    }
  }
  );
  menuCouleurChoix.addButton("rouge", new ButtonListener() {
    public void buttonListener() {
      donnee.setRouge(255);
      donnee.setVert(0);
      donnee.setBleu(0);
    }
  }
  );
  menuCouleurChoix.addButton("vert", new ButtonListener() {
    public void buttonListener() {
      donnee.setRouge(0);
      donnee.setVert(255);
      donnee.setBleu(0);
    }
  }
  );

  menuCouleurChoix.addButton("R", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurUn);
    }
  }
  );

  menuCouleurChoix.addButton("G", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurDeux);
    }
  }
  );


  menuCouleurChoix.addButton("<-B", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurTrois);
    }
  }
  );

  menuCouleurChoix.addButton("forme->", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuForme);
    }
  }
  );
}

void creeMenuResume() {
  //menuResume
  menuResume.addButton("couleurActu", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurChoix);
    }
  }
  );
  menuResume.addButton("forme", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuForme);
    }
  }
  );
  menuResume.addButton("<-forme", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuForme);
    }
  }
  );
  menuResume.addButton("sauver->", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuSauv);
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
        stroke(donnee.getCouleur());
        fill(donnee.getCouleur());
        dessineForme(j, new Couleur(donnee.getCouleur()));
      }
    }
    );
  }
  menuForme.addButton("<-B", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuCouleurTrois);
    }
  }
  );
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
  menuSauv.addButton("charger->", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuChargement);
    }
  }
  );

  menuSauv.addButton("<-resume", new ButtonListener() {
    public void buttonListener() {
      mtp.setMenuCurrent(menuResume);
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
  case 3:
    mtp.setMenuCurrent(menuDessin);
    break;
  case 4:
    mtp.setMenuCurrent(menuCouleurUn);
    break;
  case 5:
    mtp.setMenuCurrent(menuCouleurDeux);
    break;
  case 6:
    mtp.setMenuCurrent(menuCouleurTrois);
    break;
  case 7:
    mtp.setMenuCurrent(menuCouleurChoix);
    break;
  case 8:
    mtp.setMenuCurrent(menuForme);
    break;
  case 9:
    mtp.setMenuCurrent(menuResume);
    break;
  }
}

public class Donnee {
  public int MAXINT = 10;
  private int rouge, vert, bleu;
  private int menu;
  private String nomJoueur;
  public Donnee() {
    this.rouge = 0;
    this.vert = 0;
    this.bleu = 0;
    this.nomJoueur = "";
  }

  public color getCouleur() {
    return color(this.rouge, this.vert, this.bleu);
  }

  public int getRouge() {
    return rouge;
  }
  public void setRouge(int rouge) {
    this.rouge = rouge;
  }
  public int getVert() {
    return vert;
  }
  public void setVert(int vert) {
    this.vert = vert;
  }
  public int getBleu() {
    return bleu;
  }
  public void setBleu(int bleu) {
    this.bleu = bleu;
  }
  public String getNomJoueur() {
    return nomJoueur;
  }
  public void setNomJoueur(String nomJoueur) {
    this.nomJoueur = nomJoueur;
  }
  void gaucheCurseur() {
    this.menu--;
    if (menu == 0) {
      menu = this.MAXINT;
    }
    changeMenu(this.menu);
  }
  void droiteCurseur() {
    this.menu++;
    if (menu == this.MAXINT) {
      menu = 0;
    }
    changeMenu(this.menu);
  }
}
