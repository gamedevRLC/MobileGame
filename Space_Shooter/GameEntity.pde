
class GameEntity{
  PVector location, size;
  
  GameEntity(){
    this(0, 0, 10, 10);
  }
  
  GameEntity(int _x, int _y, int _w, int _h){
    location = new PVector(_x, _y);
    size = new PVector(_w, _h);
  }
  
  void draw(){
    
  }
}
