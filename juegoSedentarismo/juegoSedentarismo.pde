    import processing.serial.*;
    
    Serial port; // Recibe del arduino
    int leer; // Variable se convierta en el sensor
    
    PImage fondo;
    PImage win;
    PImage finLose;
    PImage monstruo;
    PImage monstruo1;
    PImage monstruo2;
    PImage monstruo3;
  
    int led = 1;
    
   
    
    //----------------------------------BICHOS_____________________
   float x,y,z;
   float x1,y1,z1;
   float x2,y2,z2;
   float x3,y3,z3;
    
    
    
    //-----------------------PUNTAJE------------------------------
    float dist=0;
    int puntaje =0;
    int puntaje1 =0;
        //-----------------------VIDA------------------------------

    int vida = 10;
    int levelCounter = 0;
        //-----------------------ESTADOS DE REPETICION------------------------------

    boolean unaVez = false;
    boolean unaVez2 = false;
     boolean unaVez3 = false;
    boolean unaVez4 = false;
    
    boolean unaVezBtn = false;
    boolean unaVezBtn2 = false;
    boolean unaVezBtn3 = false;
    boolean unaVezBtn4 = false;
        //-----------------------VENTANAS------------------------------

    
    boolean gameOver = false;
    boolean gamewin = false;
    
    boolean mostroCorrer = false;
        //-----------------------TIPOGRAFIAS Y SONIDOS------------------------------

    PFont f;
    
    
    void setup(){
       size (1920,1080);
       
    
       port = new Serial (this, "COM5", 9600);
     
      
       
      fondo  = loadImage("8.png");
      win = loadImage("10.png");
      finLose = loadImage("11.png");
      monstruo  = loadImage("monstruov.png");
      monstruo1  = loadImage("monstruoa.png");
    
    
     
    f = loadFont("ComicSansMS-Bold-48.vlw");
    
    
    //--------------
    x= width/2;
    y=height/2;
    z=0;
    
    x1= width/2;
    y1=height/2;
    z1=0;
    
     x3= width/2;
    y3=height/2;
    z3=0;
    
     x2= width/2;
    y2=height/2;
    z2=0;
    
   // x2=500;
   // y2=800;
   // z2=5;
    
    
    
    
      
    }
    
    void draw(){
    
      if(0 < port.available())
  {
    leer = port.read();
  }
  
  
  
  
  //println(leer);
    //background(0);
    image(fondo,0,0);
    
        //---------------------------------puntaje jugador 2
    
    
    //---------------------- PERSONAJE UNO AZUL ---------------------
    
    
    if(unaVez==false)
    {
      x = random(10,960);
      unaVez = true;
      // Enviar a arduino para prender leds
      
      port.write(1);
    }
    
    image(monstruo1,x,y,z,z);
    
    
    z+=random(0.1,2);
    
        for (int i=0; i<20; i++)
        {
          /*if (leer == 1)
          {
            dist = dist(mouseX, mouseY, x,y);
            
            if (dist <=50)
            {
              unaVez = false;
              z=0;*/
              
              if (unaVezBtn == false){
                if(leer == 1)
                {
                  unaVez = false;                  
                  unaVezBtn = true;
                  // Enviar a arduino para prender leds
      
                  port.write(0);                  
                  z=0;
                  int led = (int) random(1,3);
                  port.write(led);
                }
              }
              if (unaVezBtn == true){
                if(leer == 0)
                {
                  unaVezBtn = false;
                }

              }
              
             
             
            }
            
          
         
        //}
      
        
         fill (0);
        text ( puntaje,620, 1032 );
       
            
             if (unaVez == false)
          {
            puntaje = puntaje +2;
          }
          
            
             if (z >550)
          {
           vida--;
           fill(#02A0F2);
            rect(0,0,2000,2000);
            unaVez=false;
            z=0;
            
          }
          //---------------------- PERSONAJE DOS AZUL---------------------
    
    
    if(unaVez3==false)
    {
      x3 = random(10,960);
      unaVez3 = true;
      
      port.write(4);
    }
    
    image(monstruo1,x3,y3,z3,z3);
    
    
    z3+=random(0.1,2);
    
        for (int i=0; i<20; i++)
        {
          /*if (mousePressed)
          {
            dist = dist(mouseX, mouseY, x3,y3);
            
            if (dist <=50)
            {
              unaVez3 = false;
              z3=0;
              
                
            } 
        }*/
        if (unaVezBtn2 == false){
                if(leer == 2)
                {
                  unaVez = false;
                  
                  unaVezBtn2 = true;
                  port.write(3);                  
                  z3=0;
                  int led = (int) random(4,6);
                  port.write(led);
                }
              }
              if (unaVezBtn2 == true){
                if(leer == 0)
                {
                  unaVezBtn2 = false;
                }

              }
      
        }
        
            
             if (unaVez3 == false)
          {
            puntaje = puntaje +2;
          }
          
            // Mostrar vidas restantes-------------------------------------------------------
        textFont(f, 45);
        fill(#FCFCFC);
        text("Vidas: " + vida, 828, 60);
        //rect(818, 64,vida-9* 30, 40);
        rect(818, 64,vida*23, 20);
        // rect(818, 84,vida=vida*3, 30);
        // rect(818, 94,vida=2, 30);
        
         textFont(f, 25);
         
         text("Sedentarius destruidos jugador Uno: " + puntaje/2, 300, 50);
         text("Sedentarius destruidos jugador Dos: " + puntaje1/2, 1200, 50);
    
     //-----------------------------------------------------------------------------
            
             if (z3 >550)
          {
           vida--;
           fill(#02A0F2);
            rect(0,0,2000,2000);
            unaVez3=false;
            z3=0;
            
          }
         
         
                   //---------------------- PERSONAJE DOS Verde---------------------
    
    
    if(unaVez2==false)
    {
      x2 = random(970,1900);
      unaVez2 = true;
    }
    
    image(monstruo,x2,y2,z2,z2);
    
    
    z2+=random(0.1,2);
    
        for (int i=0; i<20; i++)
        {
          /*if (mousePressed)
          {
            dist = dist(mouseX, mouseY, x2,y2);
            
            if (dist <=50)
            {
              unaVez2 = false;
              z2=0;
              
             
             
            }
            
          
           
         
        }*/
        
        if (unaVezBtn3 == false){
                if(leer == 3)
                {
                  unaVez = false;
                  
                  unaVezBtn3 = true;
                  z2=0;
                }
              }
              if (unaVezBtn3 == true){
                if(leer == 0)
                {
                  unaVezBtn3 = false;
                }

              }
        
      
        }
         fill (0);
        text ( puntaje,620, 1032 );
       
            
             if (unaVez2 == false)
          {
            puntaje1 = puntaje1 +2;
          }
          
            
             if (z2 >550)
          {
           vida--;
           fill(#0CE531);
            rect(0,0,2000,2000);
            unaVez2=false;
            z2=0;
            
          }
          
        
        //---------------------------perssonaje dos VERDE----------------
        if(unaVez4==false)
    {
      x1 = random(970,1900);
      unaVez4 = true;
    }
    
    image(monstruo,x1,y1,z1,z1);
    
    z1+=random(0.1,2);
    
    
    
        for (int i=0; i<100; i++)
        {
         /* if (mousePressed)
          {
            dist = dist(mouseX, mouseY, x1,y1);
            
            if (dist <=80)
            {
              unaVez4 = false;
              z1=0;
              
              
            }
           
          }*/
          if (unaVezBtn4 == false){
                if(leer == 4)
                {
                  unaVez = false;
                  
                  unaVezBtn4 = true;
                  z1=0;
                }
              }
              if (unaVezBtn4 == true){
                if(leer == 0)
                {
                  unaVezBtn4 = false;
                }

              }
        }
    
           fill (0);
        text ("" + puntaje1,1350, 1032);
       
            
             if (unaVez4 == false)
          {
            puntaje1 = puntaje1 +2;
          }
          
    
      
       
            
             if (z1 >550)
          {
           vida--;
            unaVez4=false;
            fill(#0CE531);
            rect(0,0,2000,2000);
            z1=0;
            
          }
         
               //-----------------------ventana Perder ----------------------------
  
          if (vida <= 0) {
                gameOver = true;
              }
             //-----------------------ventana pantalla ganar----------------------------
  
              if (puntaje1 >= 60) {
                gamewin = true;
              }
               if (puntaje >= 60) {
                gamewin = true;
              }
              
              //-----------------------ventana mostro correr----------------------------
               if (puntaje1 >= 70) {
                mostroCorrer = true;
              }
                if (puntaje >= 70) {
                mostroCorrer = true;
              }
        //--------------------------------GameOver-------------------------------------   
            if (gameOver) {
        background(30);
        image(finLose,0,0);
        textFont(f, 30);
        textAlign(CENTER);
        fill(200, 160, 43);
        text(" ", width/2, height/2);
        text("puntaje jugador Uno:  "+puntaje, 300, 600);
        text("puntaje jugador Dos:  "+puntaje1, 1650, 600);
        
        text("bichos destruidos  :  " + puntaje/2, 300, 650);
        text("bichos destruidos :  " + puntaje1/2, 1650, 650);
      
    
      }
            //--------------------------------GameWin-------------------------------------   
  
       if (gamewin) {
        background(30);
        image(win,0,0);
        textFont(f, 25);
        textAlign(CENTER);
        fill(200, 160, 43);
        text(" ", width/2, height/2);
        text("puntaje jugador Uno:  "+puntaje, 600, 1035 );
        text("puntaje jugador Dos:  "+puntaje1, 1300, 1035);
        
         text("bichos destruidos  :  " + puntaje/2, 300, 650);
        text("bichos destruidos :  " + puntaje1/2, 1650, 650);
     
       
    
      }
         //--------------------------------mostroCorrer-------------------------------------   
  
  
     
       if (mostroCorrer) {
        background(30);
        image(fondo,0,0);
   
        image(monstruo,x2,y2,z2,z2);
    
    z2-=3;
    
      }
      if(z2>=100){
        
        unaVez= true;
      
      }
    
    
    
    }
    
     
     
     
       
     
     
     
       
