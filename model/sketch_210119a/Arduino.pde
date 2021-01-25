import processing.serial.*;

Serial myPort;
float val;
int bval;

void setup(){
  //size(450, 100);
  myPort = new Serial(this, Serial.list()[1], 9600);
  printArray(Serial.list());
}

public void settings() {
  size(450, 100);
}
void draw(){
  while (myPort.available() > 0) {
    String sb = myPort.readStringUntil('\n');
    if (sb != null){
      val = float(sb);
      bval = int(val);
    }
  }
  
  background(#C1C1C1);
  noFill();
  rect(30, 20, 360, 55);
  
  if(bval >= 0 && bval < 120){
    fill(0, 255, 0);
  }

  if(bval >= 120 && bval < 240){
    fill(255, 204, 51);
  }

  if(bval >= 240 && bval <= 360){
    fill(255, 0, 0);
  }
  rect(30, 20, bval, 55);
  
  float aval = map(bval, 0, 359, 0, 100);
  int cval = int(aval);
  translate(145, 45);
  fill(0);
  textSize(32);
  text(cval+"%", 10, 20);
}

  
