class Historique {
  private int id;
  private ArrayList arg;

  public Historique(int id, ArrayList arg) {
    this.id=id;
    this.arg=new ArrayList(arg);
  }

  public int getId() {
    return id;
  }

  public ArrayList getArg() {
    return new ArrayList(arg);
  }
  
  public void addCouleur(){
      arg.add(0,pinceau.getCouleur());
      arg.add(1,pinceau.getCouleur());
  }
}
