
void Tutorial(){
  background(0);
  
  //Runs the time in the tutorial
  tutorial_time = (millis() - tutorial_starttime)/1000;
  
  //Displays the text based on time
  if(tutorial_time >= 0 && tutorial_time <= 8){
    textSize(75);
    text("You are the white circle\nFlick the screen to move", width * .5, height * .25);
  }
  
  //Draws the player
  p1.draw();
  
  //Constraints the player to the screen horizontally
  if(p1.location.x <= (p1.size)/2){
    p1.location.x = (p1.size/2);
  }else{
    if(p1.location.x >= width - (p1.size)/2){
      p1.location.x = width - (p1.size/2);
    }
  }
  
  //Constraints the player to the screen vertically
  if(p1.location.y <= 0){
    p1.location.y = height * .038;
  }else{
    if(p1.location.y >= height){
      p1.location.y = height * .927;
    }
  }
}
