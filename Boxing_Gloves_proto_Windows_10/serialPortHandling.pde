void findSerialPort() {

  println("Please make sure your Xbee coordinator is NOT plugged in."); //make this a nice interface
  //click or press button to continue here for future dev?
  printArray(Serial.list()); //optional
  if(Serial.list().length > 0){
  saveStrings("boxerPorts.txt", Serial.list());
  }
  else{
    String[] emptySArray = new String[1];
   saveStrings("boxerPorts.txt", emptySArray); 
  }
  println("Now, please plug in your Xbee coordinator."); //make this a nice interface ******ATTENTION ADELINE******** add a button that pauses everything and instructs user to first plug in coordinator and then turn on gloves, click button to continue
  //add a button to pause here
  //start cycle through ports
  loadedPorts=loadStrings("boxerPorts.txt"); //load in strings from saved file to array loadedPorts
  //make pause here
  while (newPort != true) {
    for (int i = 0; i < Serial.list ().length; i++) { //look through current serial ports one at a time
      portNotFound = true;
      for (int j = 0; j < loadedPorts.length; j++) { //for each current serial port look through each saved serial port
        if (Serial.list()[i].equals(loadedPorts[j])) {
          portNotFound = false;
        } else if (j == loadedPorts.length - 1 && portNotFound == true) {
         // String currentPort = Serial.list()[i]; //uncomment for mac
         // if (currentPort.charAt(5) == 't') {//if 5th character is a 't' then it's a tty connection (for mac) (tty is correct connection type)
            newPort = true; //set flag to exit finding serial port loop & for current serial port does not match saved serial ports 
            correctSerialPort = i; //set correct serial port array position
            print("NEW PORT IS: " + i);
            println(" FOUND NEW PORT");
          //} //uncomment for mac
        }
      }
    }
  }
}

void connectSerialPort() {
  usbPort = new Serial (this, Serial.list()[correctSerialPort], 9600); //actually open the serial port
  usbPort.clear(); //throw away garbage data
  usbPort.bufferUntil('~'); //read in data until start byte byte
}