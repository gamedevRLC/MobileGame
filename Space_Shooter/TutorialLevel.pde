
class TutorialLevel extends GameLevel{
  
  float accelerometerx, tutorial_time, tutorial_starttime;  
  Ship p1;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  PImage check;
  
  
  TutorialLevel(int _levelNumber, int _successTarget, int _failureTarget){
    super(_levelNumber, _successTarget, _failureTarget);
    check = loadImage("misc./Check.png");
    tutorial_starttime = millis();
  }
  
  void draw(){
    background(0);
    
    tutorial_time = (millis() - tutorial_starttime)/1000;
    
    if(tutorial_time > 0 && tutorial_time < 5){
      textSize(50/dw);
      text("Tilt up and\ndown to move", width * .25, height * .4);
    }
    
    if(tutorial_time > 7 && tutorial_time < 12){
      textSize(50/dw);
      text("Tap the screen\nto shoot bullets", width * .25, height * .4);
    }
    
    
    
    if(bullets.size() > 0){
      for(int i = bullets.size() - 1; i >= 0; i--){
        Bullet b = bullets.get(i);
        if(b.isDead() == true){
          bullets.remove(b);
        }else{
          b.draw();
        }
      }
    }
    
    p1.draw();
    p1.movement();
    //println("Player x: " + p1.location.x);
    
    if(p1.location.y <= 0){
      p1.location.y = 0;
    }else{
      if(p1.location.y >= height - p1.size.y){
        p1.location.y = height - p1.size.y;
      }
    }
    
    textSize(40/dw);
    text("Range:", width * .4, height * .1);
    
    if(accelerometerx >= 4 && accelerometerx <= 8){
      image(check, width * .5, height * .05, 100/dw, 100/dh);
    }
  }
  
  void onTap(float x, float y){
    if(tutorial_time > 7){
      bullets.add(new Bullet(p1.location.x, p1.location.y + (p1.size.y * .5), 50/dw, 50/dh));
    }
  }
  
  void onAccelerometerEvent(float x, float y, float z){
    p1.onAccelerometerEvent(x, y, z);
    accelerometerx = x;
  }
  
  boolean isDone(){
    return false;
  }
  
  boolean Lost(){
    return false;
  }
  
  void addShip(Ship ship){
    p1 = ship;
  }
  
}
