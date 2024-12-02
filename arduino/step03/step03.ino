#define LEDPIN 13
#define TIMERINIT (65535 - 2*15625) // For use with 16-bit Timer1
unsigned long myTime_previous = 0;
unsigned long myTime_after;
byte state = LOW;
void setup() {
 Serial.begin(9600);
 pinMode(LEDPIN, OUTPUT);
 noInterrupts();
 // Set values of Timer/Counter Control Registers for Timer1
 TCCR1A = 0;
 TCCR1B = bit(CS12) | bit(CS10); // Prescaler set to 1024 =>
 // 16 MHz clk divided by 1024
 TIMSK1 |= bit(TOIE1); // enable overflow interrupt
 // by setting on the corresponding bit at the
 // Timer/Counter Interrupt Mask Register
// when timer overflows,
// an interrupt is generated
 TCNT1 = TIMERINIT; // initialize counter
 interrupts();
}
void loop() {
 digitalWrite(LEDPIN, state);
 }
 
ISR(TIMER1_OVF_vect) {
 state = !state;
 TCNT1 = TIMERINIT; // start again from value TIMERINIT
 myTime_after = millis();
 Serial.println(myTime_after - myTime_previous);
 myTime_previous = myTime_after;
 myTime_after = millis();
}
