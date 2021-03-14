class Save {
  private ArrayList<Historique> historiques;

  public Save() {
    historiques=new ArrayList();
  }

  public void addHistorique(Historique historique) {
    historique.addCouleur();
    historiques.add(historique);
  }

  public void save(String nom) {
    String[] lines=new String[historiques.size()];
    for (int i=0; i<historiques.size(); i++) {
      Historique historique=historiques.get(i);
      lines[i]=historique.getType()+"/";
      lines[i]+=historique.getFonction()+"/";
      ArrayList arg=historique.getArg();
      for (int j=0; j<arg.size(); j++) {
        lines[i]+=arg.get(j);
        if (j!=arg.size()-1)lines[i]+="/";
      }
    }
    saveStrings("saves/"+nom+".save", lines);
  }

  public void load(String nom) {
    String[] lines = loadStrings("saves/"+nom+".save");
    for (int i=0; i<lines.length; i++) {
      String[] line=lines[i].split("/");
      pinceau.setCouleur(new Couleur(int(line[2])),new Couleur(int(line[3])));
      choixType(line);
    }
  }

  private void choixType(String [] line) {
    switch(int(line[0])) {
    case 1:
      choixFonctionPoly(line);
      break;
    case 2:
      choixFonctionMath(line);
      break;
    }
  }

  private void choixFonctionPoly(String [] line) {
    switch(int(line[1])) {
    case 1:
      dessineCarre(float(line[4]), float(line[5]), float(line[6]));
      break;
    case 2:
      dessineRectangle(float(line[4]), float(line[5]), float(line[6]), float(line[7]));
      break;
    case 3:
      dessineTriangle(float(line[4]), float(line[5]), float(line[6]), float(line[7]), float(line[8]), float(line[9]));
      break;
    case 4:
      dessineEllipse(float(line[4]), float(line[5]), float(line[6]), float(line[7]));
      break;
    case 5:
      dessineCercle(float(line[4]), float(line[5]), float(line[6]));
      break;
    case 6:
      loadPoly(line);
      break;
    }
  }

  private void loadPoly(String [] line) {
    float[][] coord=new float[int(line[4])][2];
    for (int i=0; i<int(line[4]); i++) {
      coord[i][0]=float(line[i*2+5]);
      coord[i][1]=float(line[i*2+6]);
    }
    dessinePoly(coord);
  }

  private void choixFonctionMath(String [] line) {
    switch(int(line[1])) {
    case 1:
      fractalKock(float(line[4]), float(line[5]), float(line[6]), float(line[7]), float(line[8]));
      break;
    case 2:
      spiralrOr(float(line[4]), float(line[5]));
    }
  }
}
