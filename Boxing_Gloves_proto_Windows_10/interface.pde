//Adeline might want to put her code here

//Adeline is putting her code here

import controlP5.*;
import java.util.*;

float[] numbers = new float[400];
TimerGraph timerGraph;

boolean setPage = false;

boolean drawStop;

ControlP5 mainMenu;

ControlP5 timeCountdown;

Button start, pause, cont;

MainPage mp = new MainPage();

Timer timer ;
MinuteTimer minuteTimer;
SecondsCountdownTimer secondsCountdownTimer;
MinutesCountdownTimer minutesCountdownTimer;    // I made different two timers, one counts upwards normally, and the other one counts down. They each have classes for minutes and seconds.


int publicCounter = 0;

int publicMinuteCounter = 0;


PFont font;

boolean f_move = false;
color button, background, text;

boolean aboutBool = false;
boolean pairBool = false;
boolean helpBool = false;
boolean backBool = false;




void dropdown(int n) {
  //request the selected item based on index n 
  println(n, mainMenu.get(ScrollableList.class, "dropdown").getItem(n));


  CColor c = new CColor();
  c.setBackground(color(255, 0, 0));
  mainMenu.get(ScrollableList.class, "dropdown").getItem(n).put("color", c);



  //Depending on the selection from the dropbox, change the amount of time on the countdown
  //and then start the countdown

  if (n == 0) {
    //background = color(#ffffff);
    //about.draw();
    aboutBool = true;
  }
  if (n == 1) {
    helpBool = true;
  }
  if (n == 2) {
    pairBool = true;
  }
}

void dropdown2(int n) {
  /* request the selected item based on index n */
  println(n, timeCountdown.get(ScrollableList.class, "dropdown").getItem(n));


  CColor c = new CColor();
  c.setBackground(color(255, 0, 0));
  timeCountdown.get(ScrollableList.class, "dropdown").getItem(n).put("color", c);


  //Depending on the selection from the dropbox, change the amount of time on the countdown
  //and then start the countdown
 
  if (n == 0) {
    publicCounter = 5;
    secondsCountdownTimer.countdown();
  }
  if (n == 1) {
    publicCounter = 10;
    publicMinuteCounter = 1;
    secondsCountdownTimer.countdown();
  }
  if (n == 2) {
    publicCounter = 20;
    secondsCountdownTimer.countdown();
  }
  if (n == 3) {
    publicCounter = 30;
    secondsCountdownTimer.countdown();
  }
  if (n == 4) {
    publicCounter = 59;
    publicMinuteCounter = 0;
    if(publicMinuteCounter >= 0) {
      publicCounter = 59;
    }
    secondsCountdownTimer.countdown();
  }
  if (n == 5) {
    publicCounter = 59;
    publicMinuteCounter = 4;
    if(publicMinuteCounter >= 0) {
      publicCounter = 59;
    }
    secondsCountdownTimer.countdown();
  }
  if (n == 6) {
    publicCounter = 59;
    publicMinuteCounter = 9;
    secondsCountdownTimer.countdown();
    if (n == 7) {
      publicCounter = 59;
      publicMinuteCounter = 19;
      secondsCountdownTimer.countdown();
    }
    if (n == 8) {
      publicCounter = 59;
    publicMinuteCounter = 29;
      secondsCountdownTimer.countdown();
    } else {
    }
  }
}


void drawWhite() {
  background(#FFFFFF);
}

void drawOther() {
  background(#ffbbbb);
}

//void mousePressed() {
//  setPage = !setPage;
//}

void mousePressed() {
  mouseHandler();
}

void mouseHandler () {
  if (mouseX > displayWidth*0.02 && mouseY > displayHeight*0.10 && mouseX < displayWidth*0.08 && mouseY < displayHeight*0.12) {
    mousePressed = !mousePressed;
    mainMenu.hide();
  } 
  
  if (mouseX > 760 && mouseY > 75.6 && mouseX < 940 && mouseY < 162) {
    mousePressed = !mousePressed; 
   println("hmmm");
    timer.restart();
    secondsCountdownTimer.restart();
    minuteTimer.restart();
    minutesCountdownTimer.restart();
    
    drawStop = true;
   
    drawStopButton();
  } else {
  }
  

} 

void drawStopButton () {
      if (drawStop == true) {
      fill(#ff0000);
      rect (800, 100, 100, 100);
  }
}
//Create a separate class for each page
class MainPage {



  void setup() {
    font = loadFont("AgencyFB-Bold-48.vlw");
  }



  void changeBackground() {
  }


  void draw() {
    font = loadFont("AgencyFB-Bold-48.vlw");
    
    if (!f_move) {
      background(background);

      mainMenu.setFont(font, 40);


      if (mousePressed == true) {
        mouseHandler();
        mainMenu.show();
        println("Mouse Press seen");
      } else {
        mainMenu.hide();    //comment to show menu
      }


      //mainMenu.setFont(new ControlFont(createFont("AGENCYB.TTF", 150), 40));

      fill(#313140);
      rect(0, 0, displayWidth, displayHeight*0.06);
      //textFont(font, 140);

      //Top Part/Title
      fill(#000000);
      textSize(40);
      textAlign(CENTER);
      text("BAMF/Beastly", 500, displayHeight*0.04);

      //Menu
      fill(#9797A6);
      rect(displayWidth*0.01, displayHeight*0.10, displayWidth*0.04, displayHeight*0.005);

      fill(#9797A6);
      rect(displayWidth*0.01, displayHeight*0.11, displayWidth*0.04, displayHeight*0.005);

      fill(#9797A6);
      rect(displayWidth*0.01, displayHeight*0.12, displayWidth*0.04, displayHeight*0.005);

      //Text after
      fill(#9797A6);
      textSize(60);
      textAlign(CENTER);
      text("SOME Text", displayWidth*0.14, displayHeight*0.125);
      
      fill(#345678);
      rect(displayWidth*0.4, displayHeight*0.07, displayWidth*0.1, displayHeight*0.06 );

      fill(#9797A6);
      textSize(60);
      text("START", displayWidth*0.45, displayHeight*0.125);
      
      fill(#9797A6);
      textSize(60);
      textAlign(CENTER);
      timer.DisplayTime();
      text(":", displayWidth*0.45, displayHeight*0.18);
      minuteTimer.DisplayMinutes();
      //text("00:00", displayWidth*0.8, displayHeight*0.17);

      fill(#313140);
      rect(20, 180, displayWidth*0.20, displayHeight*0.3);

      fill(#ff0000);

      textSize(170);
      text("19", displayWidth*0.3, displayHeight*0.4 );

      textSize(70);
      text("Jabs/sec", displayWidth*0.3, displayHeight*0.46 );

      fill(#31313F);
      textSize(40);
      textAlign(LEFT);
      text("YOUR STREAK", displayWidth*0.01, displayHeight*0.51);

      fill(#9797A5 );
      textSize(20);
      textAlign(LEFT);
      text("DAILY", displayWidth*0.01, displayHeight*0.54);

      fill(#535362);
      rect(displayWidth*0, displayHeight*0.541, displayWidth, displayHeight*0.03);

      fill(#9797A5 );
      textSize(16);
      text("9 jabs/sec", displayWidth*0.05, displayHeight*0.56);

      fill(#9797A5 );
      textSize(20);
      textAlign(LEFT);
      text("WEEKLY", displayWidth*0.01, displayHeight*0.59);

      fill(#9797A5);
      rect(displayWidth*0, displayHeight*0.591, displayWidth, displayHeight*0.03);

      fill(#000000);
      textSize(16);
      text("4 jabs/sec", displayWidth*0.05, displayHeight*0.61);

      fill(#9797A5 );
      textSize(20);
      textAlign(LEFT);
      text("MONTHLY", displayWidth*0.01, displayHeight*0.64);

      fill(#D6D6D6);
      rect(displayWidth*0, displayHeight*0.645, displayWidth, displayHeight*0.03);

      fill(#160C0C);
      textSize(16);
      text("1 jabs/sec", displayWidth*0.05, displayHeight*0.665);
    }
    
     stroke(#ff0000);
  beginShape();
  for (int i = 21; i<numbers.length; i++) {
    vertex(i, 480-numbers[i]);
    
  }
  endShape();
  for (int i = 1; i<numbers.length; i++) {
    numbers[i-1] = numbers[i];
  }
  if (timerGraph.isFinished()) {
    
    println("I'm drawing a graph");

    numbers[numbers.length-1]=random(280);
    timerGraph = new TimerGraph(1000);
    timerGraph.start();
    
  }
  
  }

  void keyPressed() {
    switch(key) {
      case('1'):
      // make the ScrollableList behave like a ListBox 
      mainMenu.get(ScrollableList.class, "dropdown").setType(ControlP5.LIST);
      break;
      case('2'):
      // make the ScrollableList behave like a DropdownList 
      mainMenu.get(ScrollableList.class, "dropdown").setType(ControlP5.DROPDOWN);
      break;
      case('3'):
      //change content of the ScrollableList 
      List l = Arrays.asList("a-1", "b-1", "c-1", "d-1", "e-1", "f-1", "g-1", "h-1", "i-1", "j-1", "k-1");
      mainMenu.get(ScrollableList.class, "dropdown").setItems(l);
      break;
      case('4'):
      // remove an item from the ScrollableList 
      mainMenu.get(ScrollableList.class, "dropdown").removeItem("k-1");
      break;
      case('5'):
      // clear the ScrollableList 
      mainMenu.get(ScrollableList.class, "dropdown").clear();
      break;
    }
  }
}

class Timer {   //---------------------------------------------------Default Seconds
  long startTime ;     
  long timeSoFar ;      
  boolean running ;   
  float x, y ;         
  Timer(float inX, float inY) {     
    x = inX ;     
    y = inY ;     
    running = false ;     
    timeSoFar = 0 ;
  }    

  int currentTime() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 1000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 1000.0) ) ;
    }
  }

  void start() {     
    running = true ;     
    startTime = millis() ;
  }

  void restart() {     
    start() ;
  }      
  void pause() {     
    if (running) {       
      timeSoFar =   millis() - startTime  ;       
      running = false ;
    }
  }      
  void continueRunning() {     
    if (!running) {         
      startTime = millis() - timeSoFar ;       
      running = true ;
    }
  }      
  void DisplayTime() {    
    int theTime ; 
    String output = "";     
    theTime = currentTime() ;
    if (theTime > 59) {
      running = true ;     
      startTime = millis() ;
    }

    output = output + theTime ;
    //println("output = " + output) ;    
    //ﬁll(150, 0, 200) ;    
    //PFont font ;    
    //font = loadFont("Arial-Black-48.vlw") ;    
    //textFont(font) ;    
    text(output, x, y) ;
  }
  
}



class MinuteTimer {   // -------------------------------- default minutes
  long startTime ;     
  long timeSoFar ;      
  boolean running ;   
  float x, y ;         
  MinuteTimer(float inX, float inY) {     
    x = inX ;     
    y = inY ;     
    running = false ;     
    timeSoFar = 0 ;
  }    

  int currentTime() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 1000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 1000.0) ) ;
    }
  }

  int minutes() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 60000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 60000.0) ) ;
    }
  }


  void start() {     
    running = true ;     
    startTime = millis() ;
  }

  void restart() {     
    start() ;
  }      
  void pause() {     
    if (running) {       
      timeSoFar =   millis() - startTime  ;       
      running = false ;
    }
  }      
  void continueRunning() {     
    if (!running) {         
      startTime = millis() - timeSoFar ;       
      running = true ;
    }
  }      


  void DisplayMinutes() {    
    int theTime ;    
    String output = "";     
    theTime = minutes() ;    
    output = output + theTime ;       
    //println("output = " + output) ;    
    //ﬁll(150, 0, 200) ;    
    //PFont font ;    
    //font = loadFont("Arial-Black-48.vlw") ;    
    //textFont(font) ;    
    text(output, x, y) ;
  }

}



class SecondsCountdownTimer {   //--------------------------------------------------- Countdown Seconds
  long startTime ;     
  long timeSoFar ;      
  boolean running ;   
  float x, y ;         
  SecondsCountdownTimer(float inX, float inY) {     
    x = inX ;     
    y = inY ;     
    running = false ;     
    timeSoFar = 0 ;
  }    

  int currentTime() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 1000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 1000.0) ) ;
    }
  }

  void start() {     
    running = true ;     
    startTime = millis() ;
  }

  void restart() {     
    start() ;
  }      
  void pause() {     
    if (running) {       
      timeSoFar =   millis() - startTime  ;       
      running = false ;
    }
  }      
  void continueRunning() {     
    if (!running) {         
      startTime = millis() - timeSoFar ;       
      running = true ;
    }
  }      
  void DisplayTime() {    
    int theTime ; 
    String output = "";     
    theTime = currentTime() ;
    //if (theTime > 59) {
    //  running = true ;     
    //  startTime = millis() ;
    //}

    output = output + theTime ;
    //println("output = " + output) ;    
    //ﬁll(150, 0, 200) ;    
    //PFont font ;    
    //font = loadFont("Arial-Black-48.vlw") ;    
    //textFont(font) ;    
    text(output, x, y) ;
  }
  void setToZero(){
    text(0, x, y);
  }
  void countdown () {

    int theTime;
    int newCounter = publicCounter;

    theTime = currentTime();

    newCounter= newCounter - theTime;

    //when counter is below 0, stop running
    if (newCounter < 0) {
      running = false;
    }
    
    //if (!(newCounter == 0) && publicMinuteCounter > 0 && mousePressed == true){
    //  newCounter = 59;
    //  running = true;
    //}
    
    
    fill(#000000);
    text(newCounter, x, y);
  }
}



class MinutesCountdownTimer {   //--------------------------------------------------- Countdown Minutes
  long startTime ;     
  long timeSoFar ;      
  boolean running ;   
  float x, y ;         
  MinutesCountdownTimer(float inX, float inY) {     
    x = inX ;     
    y = inY ;     
    running = false ;     
    timeSoFar = 0 ;
  }    

  int currentTime() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 60000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 60000.0) ) ;
    }
  }
  
  int minutes() {     
    if ( running ) {    
      return (  (int)   ( (millis() - startTime) / 60000.0) ) ;
    } else {
      return ( (int) (timeSoFar / 60000.0) ) ;
    }
  }

  void start() {     
    running = true ;     
    startTime = millis() ;
  }

  void restart() {     
    start() ;
  }      
  void pause() {     
    if (running) {       
      timeSoFar =   millis() - startTime  ;       
      running = false ;
    }
  }      
  void continueRunning() {     
    if (!running) {         
      startTime = millis() - timeSoFar ;       
      running = true ;
    }
  }      
  void DisplayMinutes() {    
    int theTime ;    
    String output = "";     
    theTime = minutes() ;    
    output = output + theTime ;       
    //println("output = " + output) ;    
    //ﬁll(150, 0, 200) ;    
    //PFont font ;    
    //font = loadFont("Arial-Black-48.vlw") ;    
    //textFont(font) ;    
    text(output, x, y) ;
  }
  void countdown () {

    int theTime;
    int newCounter = publicMinuteCounter;
    theTime = currentTime();

    newCounter= newCounter - theTime;
    if (newCounter < 0) {
      running = false;
    }
    fill(#000000);
    text(newCounter, x, y);
    
  }
    
     
  }
  
  class Button {
  float x, y;
  String buttonName;

  Button(float x, float y, String buttonName) {
    this.x = x;
    this.y = y;
    this.buttonName = buttonName;
  }

  void draw() {
    rectMode(CENTER);
    fill(button);
    rect(x, y, textWidth(buttonName+100), 120, 20);
    fill(#455455);

    textSize(40);

    switch (buttonName.length()) {
    case 1:
      break;
    case 2:
      break;
    case 3:
      break;
    case 4:
      break;
    case 5:
      text(buttonName, x-85, y+30);
      break;
    case 6:
      text(buttonName, x-140, y+30);
      break;
    case 7:
      break;
    case 8:
      text(buttonName, x-200, y+30);
      break;
    case 9:
      break;
    case 10:
      break;
    case 11:
      break;
    case 12:
      break;
    case 13:
      text(buttonName, x-300, y+30);
      break;


    default:
      break;
    }
  }
}