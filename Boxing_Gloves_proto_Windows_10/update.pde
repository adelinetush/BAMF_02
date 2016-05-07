void updateGloves() {
  if (tempID == rGlove.addressID) { //then update right glove
    rGlove.updateXbee();
  } else if (tempID == lGlove.addressID) { //then update left glove
    lGlove.updateXbee();
  } else { //ID does not match left OR right glove
    println("UNIDENTIFIED GLOVE"); //dunno what glove to update
  }
}