
class Asteroid extends GameEntity{
  
  boolean destroyed;
  PVector location, size;
  PImage asteroid_pic;
  
  Asteroid(float _x, float _y, float _w, float _h){
    location = new PVector(_x/dw, _y/dh);
    size = new PVector(_w/dw, _h/dh);
    asteroid_pic = loadImage("images/enemies/Asteroid.png");
  }
  
  void draw(){
    imageMode(CORNER);
    location.x = location.x + (10)/dw;
    image(asteroid_pic, location.x, location.y, size.x, size.y);
  }
  
  boolean isDead(){
    return destroyed;
  }
}
