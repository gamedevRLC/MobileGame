
class TutorialLevel extends GameLevel{
  
  float accelerometerx, accelerometerz, tutorial_time, tutorial_starttime, ba_dist;  
  Ship p1;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  ArrayList<Asteroid> asteroids;
  PImage check, space;
  
  TutorialLevel(int _levelNumber, int _successTarget, int _failureTarget){
    super(_levelNumber, _successTarget, _failureTarget);
    check = loadImage("misc./Check.png");
    space = loadImage("images/backgrounds/Space.png");
    tutorial_starttime = millis();
    asteroids = new ArrayList<Asteroid>();
  }
  
  void draw(){
    background(0);
    imageMode(CORNER);
    image(space, 0, 0, width, height);
    
    tutorial_time = (millis() - tutorial_starttime)/1000;
    
    fill(255);
    if(tutorial_time > 0 && tutorial_time < 5){
      textSize(50/dw);
      text("Tilt up and\ndown to move", width * .25, height * .4);
    }
    
    if(tutorial_time > 7 && tutorial_time < 12){
      textSize(50/dw);
      text("Tap the screen\nto shoot bullets", width * .25, height * .4);
    }
    
    if(tutorial_time > 14 && tutorial_time < 19){
      textSize(50/dw);
      text("Shoot\nthe asteroids!!!!", width * .25, height * .4);
    }
    
    for(Asteroid a : asteroids){
      a.draw();
    }
    
    if(bullets.size() > 0){
      for(int i = bullets.size() - 1; i >= 0; i--){
        Bullet b = bullets.get(i);
        if(b.isDead() == true || b.collided() == true){
          bullets.remove(b);
        }else{
          b.draw();
        }
      }
    }
    
    if(asteroids.size() > 0){
      
      for(int i = asteroids.size() - 1; i >= 0; i--){
        Asteroid a = asteroids.get(i);
        if(a.isDead() == true){
          asteroids.remove(a);
        }
        
        if(bullets.size() > 0){
          for(int c = bullets.size() - 1; c >= 0; c--){
            Bullet b = bullets.get(c);
            ba_dist = dist(a.location.x, a.location.y, b.location.x, b.location.y);
            if(ba_dist <= (a.size.x * .5) + (b.size.x * .5)){
              a.destroyed = true;
              b.destroyed = true;
            }
          }
        }
      }
    }
    
    p1.draw();
    p1.movement();
    
    if(p1.location.y <= 0){
      p1.location.y = 0;
    }else{
      if(p1.location.y >= height - p1.size.y){
        p1.location.y = height - p1.size.y;
      }
    }
    
    textSize(40/dw);
    fill(255);
    text("Range:", width * .4, height * .1);
    
    if(accelerometerx >= 4 && accelerometerx <= 8 && accelerometerz > 0){
      image(check, width * .5, height * .05, 100/dw, 100/dh);
    }
  }
  
  void onTap(float x, float y){
    if(tutorial_time > 7){
      bullets.add(new Bullet(p1.location.x - (50/dw), p1.location.y + (p1.size.y * .35), 50/dw, 50/dh));
    }
  }
  
  void onAccelerometerEvent(float x, float y, float z){
    p1.onAccelerometerEvent(x, y, z);
    accelerometerx = x;
    accelerometerz = z;
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
  
  void addAsteroid(Asteroid asteroid){
    asteroids.add(asteroid);
  }
}
