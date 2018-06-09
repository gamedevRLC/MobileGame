
class Bullet extends GameEntity{
  
  boolean offscreen = false;
  boolean destroyed = false;
  PImage bullet_pic;
  
  Bullet(float _x, float _y, float _w, float _h){
    location = new PVector(_x, _y);
    size = new PVector(_w, _h);
    bullet_pic = loadImage("images/players/Bullet.png");
  }
  
  void draw(){
    location.x = location.x - (10/dw);
    imageMode(CORNER);
    image(bullet_pic, location.x, location.y, size.x, size.y);
    if(location.x <= 0 - (size.x * .25)){
      offscreen = true;
    }
  }
  
  boolean isDead(){
    return offscreen;
  }
  
  boolean collided(){
    return destroyed;
  }
}
