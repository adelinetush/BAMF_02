void newGlove() {
  if (goodData &&(!rightGloveIdentified || !leftGloveIdentified) && introCounter >=10) { //if we got a good reading
    //if we've thrown away enuf data and not yet identified gloves do the stuff below
    if (!rightGloveIdentified) { //if right glove not yet identified
      rGlove.createGlove();//update right Glove with new data
      rightGloveIdentified = true; //turn off flag for right glove
      rGloveIDGlobal = rGlove.addressID;
      println("RIGHT GLOVE ID'D");
      introCounter = 0;//reset counter
      //bothGloves = true;//comment out this if oneGlove is false (hence using two gloves for testing)
      
    }
    
    
    //if(oneGlove == false){ //comment out this oneGlove if using two gloves for testing
    
    
    if (rightGloveIdentified && !leftGloveIdentified) {//if right glove HAS been identified but left has not
      if (tempID != rGloveIDGlobal) { //check temporary left ID int against permanent rGlove ID
        lGlove.createGlove(); //update left glove with new data
        leftGloveIdentified = true; //turn off flag for left glove
        println("LEFT GLOVE ID'D");
        bothGloves = true; //set flag for both gloves identified
        introCounter = 0; //reset counter
      }
    
  }
    //}//Comment this out along with above oneGlove if for two glove testing
    
  } else if(!rightGloveIdentified ||!leftGloveIdentified){ //we have not thrown away enough data yet to make a new glove
    introCounter++;  //this counter throws away initial bad data
  }
}