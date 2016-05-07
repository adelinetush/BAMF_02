class Glove {
  /********************
   Note- This assumes that sensor1 (AD0) is X axis (positioned along the axis of pointing index finger)
   sensor2 (AD1) is Y axis (positioned along the axis of a thumbs up)
   sensor3 (AD2) is Z axis (positioned along the axis of open palm and back of the hand)
   sensor4 (AD3) is force pressure sensor
   
   Additional note-
   ********************/

  //byte[] rawData; //to hold bytes straight from Xbee coordinator
  int s1Reading, s2Reading, s3Reading, s4Reading;  //to hold previous sensor readings
  int [] sensor1 = new int[100];  //to hold current sensor readings
  int [] sensor2 = new int[100];  //to hold current sensor readings
  int [] sensor3 = new int[100];  //to hold current sensor readings
  int [] sensor4 = new int[100];  //to hold current sensor readings
  int sCount; //counter to keep track of where in sensor array the data currently is
  byte[] address = {
    0, 0, 0, 0
  }; //empty array for address of xbee sending reading
  int addressID; //just adding address bytes up into an int for ID purposes
  boolean rightGlove; //flag for whether right glove has been identified

  Glove() {
    sCount = 0;
    addressID = 0; //just adding address bytes up into an int for ID purposes
  }
  void createGlove() {
    for (int i = 7; i <= 10; i++) {//read in address data from bytes 7,8,9,10
      address[i-7] = incoming[i]; //store address of glove in array
      addressID += (i-6)*int(incoming[i]); //store address of glove in int
    }
    print("NEW ADDRESS ");
    println(addressID);
  }
  void updateXbee() {
    s1Reading = (int(incoming[18])*256) + int(incoming[19]);//read in AD1 sensor data from bytes 18 and 19
    s2Reading = (int(incoming[20])*256) + int(incoming[21]);//read in AD2 sensor data from bytes 20 and 21
    s3Reading = (int(incoming[22])*256) + int(incoming[23]);//read in AD3 sensor data from bytes 22 and 23
    s4Reading = (int(incoming[24])*256) + int(incoming[25]);//read in AD4 sensor data from bytes 24 and 25
    //done reading into variable
    //now put values into the array for long term storage and change array counter
    sCount++; //increment counter for sensor reading array
    println(addressID);
    println("sCount is: " + sCount);
    println("s1Reading is: " + s1Reading);
    println("s2Reading is: " + s2Reading);
    println("s3Reading is: " + s3Reading);
    println("s4Reading is: " + s4Reading);
    sensor1[sCount] = s1Reading; //put readings into arrays
    sensor2[sCount] = s2Reading;
    sensor3[sCount] = s3Reading;
    sensor4[sCount] = s4Reading;
    println("sensors array at scount is: " + sensor1[sCount]);


    if (sCount == 99) { //counter has reached max of arrays
      sCount = 0; //reset counter
    }
    //reset update flags for punches
    rJab = false;
    lJab = false;
    rUppercut = false;
    lUppercut = false;
    //make it so it only tries to update when glove pulled back (save processing time)

    /* fill this in when I have testing with sensors
     if (sCount >=3 && going backwards for at least two sample after going forward) { //there is probably a smooth way to do this with a for loop and String variables that contain pointers to the data registers
     //also sCount >= is to make sure there is at least four readings in arrays
     //sensorAnalyze(); //look at data to see if it's a jab or possibly uppercut and then increment punch counter and empty sensor array
     if(punch){
     if(jab){
     if(this == rGlove){
     rJabcount ++;
     rJab = true;
     }
     if(this == lGlove){
     lJabcount ++;
     lJab = true;
     }
     }
     if(uppercut){
     if(this == rGlove){
     rUpcount ++;
     rUppercut = true;
     }
     if(this == lGlove){
     lUpcount ++;
     lUppercut = true;
     }
     }
     sCount = 0; //reset counter
     }  
     
     
     }
     */
  }
}