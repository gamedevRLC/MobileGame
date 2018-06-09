
class Ship extends GameEntity{
  
  boolean up, down, died;
  float HP, HP2;
  PImage ship_pic;
  
  Ship(int _x, int _y, int _w, int _h){
    location = new PVector(_x/dw, _y/dh);
    size = new PVector(_w/dw, _h/dh);
    HP = 500;
    died = false;
    ship_pic = loadImage("images/players/Space Ship.png");
  }
  
  void draw(){
    imageMode(CORNER);
    image(ship_pic, location.x, location.y, size.x, size.y);
    rectMode(CORNER);
    fill(0, 255, 61);
    rect(location.x, location.y + (size.y) + 10, HP, 20);
  }
  
  void movement(){
    if(up == true){
      location.y = location.y - 10/dh;
    }
    
    if(down == true){
      location.y = location.y + 10/dh;
    }
  }
  
  void onAccelerometerEvent(float x, float y, float z){
    if(x > 6.5){
      up = false;
      down = true;
    }else{
      if(x < 6.5){
        up = true;
        down = false;
      }      
    }
  }
  
  boolean isDead(){
    return died;
  }
}
