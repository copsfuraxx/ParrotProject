
int analogPin = 0;
int val;

void setup() {
  Serial.begin(9600); 
}

void loop() {
  
  val = analogRead(analogPin);
  val = map(val, 0, 1024, 0, 360);
  Serial.println(val);
}
