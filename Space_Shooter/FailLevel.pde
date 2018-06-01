
class FailedLevel extends GameLevel{
  
  boolean restart = false;
  
  FailedLevel(int _levelNumber, int _successTarget, int _failTarget){
    super(_levelNumber, _successTarget, _failTarget);
  }
  
  void draw(){
    background(0);
    
    fill(255);
    textSize(150);
    textAlign(CENTER);
    text("You Lost", width * .5, height * .5);
    textSize(70);
    text("Tap the screen to Restart the level", width * .5, (height * .5) + 200);    
  }
  
  boolean isDone(){
    return restart;
  }
  
  void onTap(float x, float y){
    restart = true;
  }
}
