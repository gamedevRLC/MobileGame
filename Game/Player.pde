
//The entire player class---------------------------------------
class Player{
  //The variables: PVector is the location, float is the size. Booleans are movement----
  float size;
  PVector location;
  boolean up, down, left, right;
  //The following are for flicking screen to move
  float xdiff, ydiff;
  
  //The constructor of the player class
  Player(float _x, float _y, float _size){
    location = new PVector(_x, _y);
    size = _size;
  }
  
  //Draws the player as a white circle
  void draw(){
    fill(255);
    ellipse(location.x, location.y, size, size);
  }
  
  //Moves the player when flicking on the screen
  void onFlick(float x, float y, float px, float py, float v){
    //Difference between starting positions and final positions are absolute values
    xdiff = abs(x - px);
    ydiff = abs(y - py);
    
    //If xdistance is greater than the ydistance prioritize xmovement
    if(xdiff > ydiff){
      //If final is greater move right
      if(x > px){
        location.x = location.x + 192;
      }else{
        //If initial is greater move left
        if(x < px){
          location.x = location.x - 192;
        }
      }
    }else{
      //If ydistance is greater than the xdistance prioritize ymovement
      if(xdiff < ydiff){
        //If final is greater move down
        if(y > py){
          location.y = location.y + 192;
        }else{
          //If initial is greater move up
          if(y < py){
            location.y = location.y - 192;
          }
        }
      }
    }
  }
}
