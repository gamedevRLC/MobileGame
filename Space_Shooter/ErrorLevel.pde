
class ErrorLevel extends GameLevel{
  
  ErrorLevel(){
    super(-1, 0, 0);
  }
  
  void draw(){
    background(0);
    fill(255);
    textSize(50);
    text("Error", width * .5, height * .5);
  }
}
