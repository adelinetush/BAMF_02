void readXbee() {
    usbPort.bufferUntil('~');
  usbPort.readBytesUntil('~', incoming); //needs a try here with null pointer exceptions

  if (incoming[27] != '~' && incoming [0] != 00 && incoming[1] != 18 && incoming[2] == 92) {//check to make sure array holds all data with last (28th byte) as delimiter and first two as frame size and third as API type
    goodData = false; //data is not correct since no delimiter or frame size doesn't match
    println("No Delimit");
  } else { //if array appears correct so far do checksum
    checkSumXbee();
  }
}

void checkSumXbee() {
  checkingSum = 0; //clear checksum value
  for (int i = 2; i < 27; i++) { //add all bytes in array except first two (length) and last (delimiter)
    checkingSum += int(incoming[i]); //store in checksum var
  }
  moduloSum = checkingSum%256; //divide by two bytes worth of info
  if ( moduloSum == 255) { //last two bytes are FF (255) so checksum is correct
    goodData = true;// first point where we know data is definitely good
      //get ID
      tempID = 0; //clear ID int (using this instead of the array is a little lazy, might need to change)
      for (int i = 7; i <= 10; i++) {//read in address data from bytes 7,8,9,10
        tempID += (i-6)*int(incoming[i]); //create temporary left ID int
      }
      //end check ID address
  } else {
    goodData = false;
  }
}