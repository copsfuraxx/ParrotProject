
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


public class Donnee {
  private int rouge, vert, bleu;
  private String nomJoueur;
  public Donnee() {
    this.rouge = 0;
    this.vert = 0;
    this.bleu = 0;
    this.nomJoueur = "";
  }
  
  public color getCouleur(){
    return color(this.rouge,this.vert,this.bleu);
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
}
