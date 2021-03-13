class Historique {
  private int type, fonction;
  private ArrayList arg;

  public Historique(int type, int fonction, ArrayList arg) {
    this.type=type;
    this.fonction=fonction;
    this.arg=new ArrayList(arg);
  }

  public int getType() {
    return type;
  }

  public int getFonction() {
    return fonction;
  }

  public ArrayList getArg() {
    return new ArrayList(arg);
  }
  
  public void addCouleur(){
      arg.add(0,pinceau.getCouleur());
      arg.add(1,pinceau.getCouleur());
  }
}
