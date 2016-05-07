import processing.serial.*; //serial library to handle serial ports
Serial usbPort; //instance of a serial port
byte [] incoming = new byte[28]; //array to hold first data
String inBuffer = ""; //string read from serial port

int moduloSum; //variable that should equal 255 (FF) if checksum is correct
int checkingSum; //variable to hold check sum data
boolean goodData = false; //flag to verify good data
int introCounter = 0; //counter for waiting for xbee data to fully propogate

boolean rightGloveIdentified; //keeps track of whether right glove has been identified yet
boolean leftGloveIdentified; //keeps track of whether left glove has been identified yet
int rGloveIDGlobal; //global ID with added up int that is right glove ID (this is a little lazy, may need to change)
boolean bothGloves = false; //flag for both gloves ID'd
int tempID = 0; //var to hold current XBee data ID value (to check against existing glove IDs) (this is a little lazy, may need to change)

//start variables to keep track of punches (made global just to be simple)
boolean rJab;
boolean lJab;
boolean rUppercut;
boolean lUppercut;
int rJabCount = 0;
int lJabCount = 0;
int rUpcutCount = 0;
int lUpcutCount = 0;
//end variables to keep track of punches

//create first two empty gloves
Glove rGlove = new Glove(); //create new glove object (right)
Glove lGlove = new Glove(); //create new glove object (left)

//vars for work with serial port
int correctSerialPort; //used to find the new serial port
String loadedPorts[]; //string loaded in from saved file that is name of a saved serial port
boolean newPort; //flag to indicate new port found
int newPortCounter; //counter to go through serial port arrays when finding new one
boolean portNotFound = true; //flag to indicate new port has not been found yet

//vars for Dev work********************
//boolean oneGlove = false; //comment out all ifs for oneGlove when working with two xbees/gloves
//end vars for Dev work****************

void setup() {
  size(1000, 800); //create window

  
  
  //*****************************************************************************INTERFACE SETUP 
   timerGraph = new TimerGraph(1000);
  timerGraph.start();
  
   timeCountdown = new ControlP5(this);
   
   List list = Arrays.asList("5 Seconds", "10 Seconds", "20 Seconds", "30 Seconds", "1 Minute", "5 Minutes", "10 Minutes", "20 Minutes", "30 Minutes");  // for the dropdown of countdown time
  //add a scrollable list
  timeCountdown.addScrollableList("dropdown")
    .setPosition(displayWidth*0.6, displayHeight*0.3)
    .setSize(200, 100)
    .setBarHeight(20)
    .setItemHeight(20)
    .addItems(list)
    ;

  timer = new Timer(displayWidth*0.47, displayHeight*0.18) ;     // define position for the main timer (seconds)
  timer.start() ;
  
  minuteTimer = new MinuteTimer(displayWidth*0.42, displayHeight*0.18) ; // define position for the main timer (minutes)
  minuteTimer.start() ;
  
  secondsCountdownTimer = new SecondsCountdownTimer(displayWidth*0.5, displayHeight*0.5);  // define position for the countdown timer (seconds)
  secondsCountdownTimer.start();
  
  minutesCountdownTimer = new MinutesCountdownTimer(displayWidth*0.4, displayHeight*0.5);  // define position for the countdown timer (minutes)
  minutesCountdownTimer.start();
  
  start = new Button(displayWidth*0.2, displayHeight*0.2, "START/RESTART");
  pause = new Button(displayWidth*0.2, displayHeight*0.4, "PAUSE");
  cont = new Button(displayWidth*0.2, displayHeight*0.6, "CONTINUE");
  
  
  background = color(#000000);
  font = loadFont("AgencyFB-Bold-48.vlw");

  mainMenu = new ControlP5(this);

  List menuList = Arrays.asList("About", "Instructions", "Pair");

  mainMenu.addScrollableList("dropdown")
    .setPosition(displayWidth*0.12, displayHeight*0.087)
    .setSize(400, 300)
    .setBarHeight(75)
    .setItemHeight(75)
    .addItems(menuList);
  
  //**********************************************************************END INTERFACE SETUP
  
  for (int i = 0; i < 28; i++) { //populate empty array which will be incoming data
    incoming[i] = byte(' ');
  }
}

void draw() {
  
    //********************************************INTERFACE STUFF 
    
   
  background(#000000);
  stroke(0);
  
  button = color(#345678);
  
    drawStopButton();
  
  mainMenu.setFont(new ControlFont(createFont("AgencyFB-Bold-48", 40), 40));

  

  if (setPage) {
    //about.draw();
    //drawWhite();
    //drawWhite();
    //draw();
    mouseHandler();
  } else {
    mp.draw();
    
  }

  //mousePressed();


  if (aboutBool == true) {
    aboutPage.draw();
    mainMenu.hide();
    
    if (backBool == true) {
    mp.draw();
    mainMenu.show();
    
    }
  }
  if (helpBool == true) {
    drawOther();
  }
  if (pairBool == true) {
    drawWhite();
  } else {
    //mp.draw();
  }
  
  //*********************************************END INTERFACE STUFF
  if (newPortCounter == 500) { //if we found the new port cycle through once (these counter numbers can be lowered to speed up port finding process
    connectSerialPort();
  } 
  if (newPortCounter <= 1000) {
    newPortCounter++; 
  }
  if (newPortCounter == 999) {
    usbPort.clear();
    usbPort.bufferUntil('~');
  }

  while (newPort != true) {
    findSerialPort();
  }

  if (newPortCounter >= 1000) { //if we got a new port, went through draw once (so we get to serial event handler and can connect) and then connected then start doing this stuff
    readXbee(); //reads in data from serial port and does checksum
    if (bothGloves == false && goodData) {
      println("New Glove");
      newGlove();
    } else if (goodData) {
      updateGloves();
      println("updating gloves");
    }


    //below is for testing purposes
    for (int i = 0; i <28; i++) {
      print(hex(incoming[i]));
      print(" ");
    }
    println();
    if (!goodData) {
      println("ERROR in XBEE DATA");
    }
    else{
     println("right glove sensor 1 = " + rGlove.sensor1[rGlove.sCount]);
     println("right s1 reading = "+ rGlove.s1Reading);
     println("left glove sensor 1 = " + lGlove.sensor1[lGlove.sCount]);
     println("left s1 reading = "+ lGlove.s1Reading);
    }
    //end code for testing purposes
  }
  

}