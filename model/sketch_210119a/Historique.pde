class Historique{
  private int type, fonction;
  private ArrayList<Float> arg;
  
  public Historique(int type, int fonction, ArrayList<Float> arg){
  this.type=type;
  this.fonction=fonction;
  this.arg=new ArrayList(arg);
  }
  
  public int getType(){return type;}
  
  public int getFonction(){return fonction;}
  
  public ArrayList<Float> getArg(){return new ArrayList(arg);}
  
}
