int pwm_speed = 255;
//trig of ultrasonic sensor
int trig = 12;
//echo of ultrasonic sensor
int echo = 13; 

void setup() {

  //pins for motor controller
pinMode(11, OUTPUT);
pinMode(10, OUTPUT);
pinMode(9, OUTPUT);
pinMode(6, OUTPUT);
pinMode(5, OUTPUT);
pinMode(3, OUTPUT);
//set trig as output and echo as input for ultrasonic sensor
pinMode(trig, OUTPUT);
pinMode(echo,INPUT);

}

void loop() {

digitalWrite(trig, LOW);
delayMicroseconds(2);
digitalWrite(trig, HIGH);
delayMicroseconds(5);
digitalWrite(trig, LOW);

int duration = pulseIn(echo, HIGH);
int distance = duration / 29 / 2;

if(distance > 10){
   //move forward by 100 ms
   forward(100);
}else if(distance < 10){
  //backward by 1000ms = 1 second
  backward(1000);
  //left by 1000ms = 1 second
   left(1000);
}
}

// function for driving straight
void forward(int delay_time){
  digitalWrite(11, HIGH);
  digitalWrite(10, LOW);
  
  digitalWrite(9, HIGH);
  digitalWrite(6, LOW);

  analogWrite(5, pwm_speed);
  analogWrite(3, pwm_speed);
  delay(delay_time);
}

//function for reversing
void backward(int delay_time){
  digitalWrite(11, LOW);
  digitalWrite(10, HIGH);
  
  digitalWrite(9, LOW);
  digitalWrite(6, HIGH);

  analogWrite(5, pwm_speed);
  analogWrite(3, pwm_speed);
  delay(delay_time);
}

//function for turning left
void left(int delay_time){
  digitalWrite(11, HIGH);
  digitalWrite(10, LOW);
  
  digitalWrite(9, LOW);
  digitalWrite(6, LOW);

  analogWrite(5, pwm_speed);
  analogWrite(3, 0);
  delay(delay_time);
}

//function for turning right
void right(int delay_time){
  digitalWrite(11, LOW);
  digitalWrite(10, LOW);
  
  digitalWrite(9, HIGH);
  digitalWrite(6, LOW);

  analogWrite(5, 0);
  analogWrite(3, pwm_speed);
  delay(delay_time);
}

//function for stopping motors
void motors_stop(int delay_time){
  
  digitalWrite(11, LOW);
  digitalWrite(10, LOW);
  
  digitalWrite(9,LOW);
  digitalWrite(6, LOW);

  analogWrite(5, 0);
  analogWrite(3, 0);
  delay(delay_time);
}
