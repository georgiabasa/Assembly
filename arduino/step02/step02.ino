#define LEDPIN 13
#define INTERRUPTPIN 2
unsigned long myTime_previous = 0;
unsigned long myTime_after;
byte state = LOW;
void setup() {
 Serial.begin(9600);
 pinMode(LEDPIN, OUTPUT);
 pinMode(INTERRUPTPIN, INPUT_PULLUP);
 attachInterrupt(digitalPinToInterrupt(INTERRUPTPIN), buttonhit, CHANGE);
}
void loop() {
 digitalWrite(LEDPIN, state);
}
void buttonhit() {
 myTime_after = millis();
 if(myTime_after-myTime_previous>=200){
  Serial.println("interrupt button hit");
  state = !state;
  myTime_previous = myTime_after;
 }
}
