
class SpaceLevel extends GameLevel{
  Ship p1;
  ArrayList<Bullet> bullets = new ArrayList<Bullet>();
  
  SpaceLevel(int _levelNumber, int _successTarget, int _failureTarget){
    super(_levelNumber, _successTarget, _failureTarget);
  }
  
  void draw(){
    background(0);
    
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
    
    if(p1.location.y <= 0){
      p1.location.y = 0;
    }else{
      if(p1.location.y >= height - p1.size.y){
        p1.location.y = height - p1.size.y;
      }
    }
  }
  
  void onTap(float x, float y){
    bullets.add(new Bullet(p1.location.x - 15, p1.location.y + (p1.size.y * .5), 50/dw, 50/dh));
  }
  
  void onAccelerometerEvent(float x, float y, float z){
    p1.onAccelerometerEvent(x, y, z);
  }
  
  void addShip(Ship ship){
    p1 = ship;
  }
}
