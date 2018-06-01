
class Bullet{
  PVector location, size;
  
  Bullet(float _x, float _y, float _w, float _h){
    location = new PVector(_x, _y);
    size = new PVector(_w, _h);
  }
  
  void draw(){
    location.x = location.x + 10;
    fill(255);
    ellipse(location.x, location.y, size.x, size.y);
  }
  
  boolean isDead(){
    return(location.x >= width + (size.x * .5));
  }
}
