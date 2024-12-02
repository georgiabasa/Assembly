unsigned long counter = 0; // to be used later!
unsigned long myTime_previous = 0;
unsigned long myTime_after;
void setup() {
 Serial.begin(9600);
}
void loop() {
 myTime_after = millis();
 if(myTime_after-myTime_previous==2000){
 Serial.println(counter);
 myTime_previous = myTime_after;
 }
 counter++ ;
}
