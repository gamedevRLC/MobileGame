
class CalibrateLevel extends GameLevel{
  
  boolean calibrated = false;
  int calibrated_time, calibrated_starttime, calibrated_tminus, calibrated_countdown;
  PImage check;
  float accelerometerx;
  
  CalibrateLevel(int _levelNumber, int _successTarget, int _failureTarget){
    super(_levelNumber, _successTarget, _failureTarget);
    check = loadImage("misc./Check.png");
    calibrated_tminus = 15;
    calibrated_starttime = millis();
  }
  
  void draw(){
    background(0);
    textSize(40/dw);
    
    calibrated_time = (millis() - calibrated_starttime)/1000;
    calibrated_countdown = calibrated_tminus - calibrated_time;
    
    text("Please take time to\ncalibrate your device before playing", width * .5, height * .15);
    if(accelerometerx < 4){
      text("Slowly tilt the screen down", width * .5, height * .5);
    }
    
    if(accelerometerx > 8.5){
      text("Slowly tilt the screen up", width * .5, height * .5);
    }
    
    if(accelerometerx > 4 && accelerometerx < 8.5){
      imageMode(CENTER);
      text("You are in the reconmended range", width * .5, height * .5);
      image(check, width * .5, height * .75, 300/dw, 300/dh);
    }
    
    textSize(80/dw);
    text(calibrated_countdown, width * .5, height * .4);
    if(calibrated_countdown <= 0){
      calibrated = true;
    }
  }
  
  void onAccelerometerEvent(float x, float y, float z){
    accelerometerx = x;
  }
  
  boolean isDone(){
    return calibrated;
  }
  
  boolean Lost(){
    return false;
  }

  int getNextLevel(){
    return successTargetLevel;
  }
  
  int getFailureLevel(){
    return failureTargetLevel;
  }
  
  void setTitle(String t){
    title = t;
  }
}
