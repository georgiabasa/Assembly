#define PIN13 13

void setup( ) {
 pinMode(PIN13, OUTPUT); // αρχικοποίηση του LED_BUILTIN ως OUTPUT
}
int halftime = 1000;
int count = 0;


void loop() {
 digitalWrite(PIN13, HIGH); // Θέτουμε το LED σε ΟΝ (HIGH είναι η τάση)
 delay(halftime); // Αναμονή για halftime ms
 digitalWrite(PIN13, LOW); // Θέτουμε το LED off (LOW είναι η τάση)
 delay(halftime); // Αναμονή για halftime ms
 count +=1;
 if (count==5){
  halftime=500;
 }
 else if (count==10){
  halftime=1000;
  count=0;}
}
