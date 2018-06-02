
class Ship extends GameEntity{
  
  boolean up, down;
  PImage ship_pic;
  
  Ship(int _x, int _y, int _w, int _h){
    location = new PVector(_x/dw, _y/dh);
    size = new PVector(_w/dw, _h/dh);
    ship_pic = loadImage("images/players/Space Ship.png");
  }
  
  void draw(){
    imageMode(CORNER);
    image(ship_pic, location.x, location.y, size.x, size.y);
  }
  
  void movement(){
    if(up == true){
      location.y = location.y - 10;
    }
    
    if(down == true){
      location.y = location.y + 10;
    }
  }
  
  void onAccelerometerEvent(float x, float y, float z){
    if(x > 1.5){
      up = false;
      down = true;
    }else{
      if(x < -1.5){
        up = true;
        down = false;
      }      
    }
    
    if(x < 1.5 && x > -1.5){
      up = false;
      down = false;
    }
  }
}
