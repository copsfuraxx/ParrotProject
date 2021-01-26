
//Code pour potentiometre
int analogPin = 0;
int val  = 0;

void setup() {
  Serial.begin(9600); 
}

void loop() {
  
  val = analogRead(analogPin);
  val = map(val, 0, 1024, 0, 360);
  Serial.println(val); // permet a processing de lire la valeur dans la console
}
