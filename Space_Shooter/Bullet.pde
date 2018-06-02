
class Bullet extends GameEntity{
  
  Bullet(float _x, float _y, float _w, float _h){
    location = new PVector(_x/dw, _y/dh);
    size = new PVector(_w/dw, _h/dh);
  }
  
  void draw(){
    location.x = location.x - 10;
    fill(255);
    ellipse(location.x, location.y, size.x, size.y);
  }
  
  boolean isDead(){
    return(location.x <= 0 - (size.x * .5));
  }
}
