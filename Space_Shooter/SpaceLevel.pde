
class SpaceLevel extends GameLevel{
  Ship p1;
  
  SpaceLevel(int _levelNumber, int _successTarget, int _failureTarget){
    super(_levelNumber, _successTarget, _failureTarget);
  }
  
  void draw(){
    background(0);
    
    
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
    
  }
  
  void onAccelerometerEvent(float x, float y, float z){
    p1.onAccelerometerEvent(x, y, z);
  }
  
  void addShip(Ship ship){
    p1 = ship;
  }
}
