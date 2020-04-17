int btn1 = 6;
int btn2 = 7;
int btn3 = 8;
int btn4 = 9;


int ledPin = 13;

int led1 = 2;
int led2 = 3;
int led3 = 4;
int led4 = 5;
int led5 = 10;
int led6 = 11;


int estado = 0;
int estado2 = 0;
int estado3 = 0;
int estado4 = 0;

int sensor = 0;

int prueba = 0;

void setup() {


  pinMode(led1,OUTPUT);
  pinMode(led2,OUTPUT);
  pinMode(led3,OUTPUT);
  pinMode(led4,OUTPUT);
  
  pinMode(btn1,INPUT);
  pinMode(btn2,INPUT);
  pinMode(btn3,INPUT);
  pinMode(btn4,INPUT);

  Serial.begin(9600); // Pasar información de arduino a otro programa / 9600v
  
}

void loop() {
  // put your main code here, to run repeatedly:
  estado = digitalRead(btn1); // Leea lo que hay en el puerto 6, guardela en estado
  estado2 = digitalRead(btn2);
  estado3 = digitalRead(btn3);
  estado4 = digitalRead(btn4);

  


  // Leds
  //digitalWrite(led1,HIGH);
  //digitalWrite(led2,HIGH);
  //digitalWrite(led3,HIGH);
  //digitalWrite(led4,HIGH);
  // Leds


// Agarra datos que le estamos enviando desde arduino
  if (Serial.available() > 0) {
    prueba = Serial.read();
    Serial.println(prueba);
    if (prueba == 1){      
      digitalWrite(led1,HIGH);
      }
     else if (prueba == 2){
      digitalWrite(led2,HIGH);
      }
      else if (prueba == 3){
      digitalWrite(led5,HIGH);
      }
      else if (prueba == 4){
      digitalWrite(led6,HIGH);
      }
      else if (prueba == 6){      
      digitalWrite(led3,HIGH);
      }
     else if (prueba == 7){
      digitalWrite(led4,HIGH);
      }
     else if (prueba == 0) {
      digitalWrite(led1,LOW);
      digitalWrite(led2,LOW);
      digitalWrite(led5,LOW);
      digitalWrite(led6,LOW);
      }
      else if (prueba == 5) {        
      digitalWrite(led3,LOW);
      digitalWrite(led4,LOW);
        }
  }
   
  if(estado == HIGH)
  {
    digitalWrite(ledPin, HIGH); // Emitir una funcion
    sensor = 1;
  }
  else if(estado2 == HIGH)
  {
    digitalWrite(ledPin, HIGH); // Emitir una funcion
    sensor = 2; // Dato enviado a processing al oprimir un boton
  }
  else if (estado3 == HIGH){
    digitalWrite(ledPin, HIGH); // Emitir una funcion
    sensor = 3; // Dato enviado a processing al oprimir un boton
  }
  else if (estado4 == HIGH){
    digitalWrite(ledPin, HIGH); // Emitir una funcion
    sensor = 4; // Dato enviado a processing al oprimir un boton
  }
  else {
    digitalWrite(ledPin, LOW); // Emitir una funcion / Si ninguno esta oprimido el led apagado
    sensor = 0; // Dato enviado a processing al oprimir un boton    
  }
  
  Serial.write(sensor);

  delay(100);

}
