About aboutPage = new About();

class About {
  
  void setup() {
    size(displayWidth, displayHeight);
  background = color(#000000);
  font = loadFont("AgencyFB-Bold-48.vlw");
  }
  
  void draw() {
  
  background(#000000);
  font = loadFont("AgencyFB-Bold-48.vlw");
  
  if (mouseX > displayWidth*0.1 && mouseY > displayHeight*0.0 && mouseX < displayWidth*0.2 && mouseY < displayHeight*0.05) {
      backBool = true;
    }
  
  // rectMode(CENTER);
  fill(#125678);
  rect(0, 0, displayWidth, displayHeight*0.04); 
  
  textSize(40);
  fill(#000000);
 // textAlign(CENTER);
  text("About", 500, displayHeight*0.03);
  text("Back", displayWidth*0.01, displayHeight*0.03);
  
  textSize(30);
  fill(#125678);
  text("BAMF", displayWidth*0.1, displayHeight*0.15);
  
  textSize(25);
  textAlign(LEFT);
  fill(#848484);
  text("Some BS about the product", displayWidth*0.05, displayHeight*0.2);
  text("A lot more BS about the product... and then some more BS...", displayWidth*0.05, displayHeight*0.22);
  text("Some BS about the product.. and then a lot more", displayWidth*0.05, displayHeight*0.24);
  
  //fill(#8B8970);
  //rect(350, 155, 150,5); 
  
  textSize(30);
  fill(#125678);
  text("Introducing the team", displayWidth*0.05, displayHeight*0.3);
  
  textSize(22);
  fill(#125678);
  text("Lorem Ipsum", displayWidth*0.05, displayHeight*0.33);
  
  //fill(#8B8970);
  //rect(350, 280, 150,5); 
 
  textSize(25);
  fill(#848484);
  text("Some BS about the team", displayWidth*0.05, displayHeight*0.35);
  text("A lot more BS about the product... and then some more BS...", displayWidth*0.05, displayHeight*0.37);
  text("Some BS about the product.. and then a lot more", displayWidth*0.05, displayHeight*0.39);
  
  //fill(#8B8970);
  //rect(350, 370, 150,5); 
  
  textSize(22);
  fill(#125678);
  text("Lorem Ipsum", displayWidth*0.05, displayHeight*0.42);
  
  textSize(25);
  fill(#848484);
  text("Some BS about the team", displayWidth*0.05, displayHeight*0.44);
  text("A lot more BS about the product... and then some more BS...", displayWidth*0.05, displayHeight*0.46);
  text("Some BS about the product.. and then a lot more", displayWidth*0.05, displayHeight*0.48);
  
  //fill(#8B8970);
  //rect(350, 460, 150,5); 
  
  textSize(22);
  fill(#125678);
  text("Lorem Ipsum", displayWidth*0.05, displayHeight*0.51);
  
  textSize(25);
  fill(#848484);
  text("Some BS about the team", displayWidth*0.05, displayHeight*0.53);
  text("A lot more BS about the product... and then some more BS...", displayWidth*0.05, displayHeight*0.55);
  text("Some BS about the product.. and then a lot more", displayWidth*0.05, displayHeight*0.57);
  
  
  //fill(#8B8970);
  //rect(350, 550, 150,5); 
  
  textSize(22);
  fill(#125678);
  text("Lorem Ipsum", displayWidth*0.05, displayHeight*0.6);
  
  textSize(25);
  fill(#848484);
  text("Some BS about the team", displayWidth*0.05, displayHeight*0.62);
  text("A lot more BS about the product... and then some more BS...", displayWidth*0.05, displayHeight*0.64);
  text("Some BS about the product.. and then a lot more", displayWidth*0.05, displayHeight*0.66);
  
  textSize(22);
  fill(#125678);
  text("Lorem Ipsum", displayWidth*0.05, displayHeight*0.69);
  
  textSize(25);
  fill(#848484);
  text("Some BS about the team", displayWidth*0.05, displayHeight*0.71);
  text("A lot more BS about the product... and then some more BS...", displayWidth*0.05, displayHeight*0.73);
  text("Some BS about the product.. and then a lot more", displayWidth*0.05, displayHeight*0.75);
  
}

}