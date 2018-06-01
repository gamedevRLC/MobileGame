import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import ketai.camera.*;
import ketai.cv.facedetector.*;
import ketai.data.*;
import ketai.net.*;
import ketai.net.bluetooth.*;
import ketai.net.nfc.*;
import ketai.net.nfc.record.*;
import ketai.net.wifidirect.*;
import ketai.sensors.*;
import ketai.ui.*;

Game SpaceShooter;

//ArrayList<Bullet> bullets;
void setup(){
  fullScreen();
  orientation(LANDSCAPE);
  //bullets = new ArrayList<Bullet>();
  SpaceShooter = new Game("Space Shooter");
}

void draw(){
  SpaceShooter.draw();
  
  //background(128);
    
  //if(bullets.size() > 0){
  //  for(int i = bullets.size() - 1; i >= 0; i--){
  //    Bullet b = bullets.get(i);
      
  //    if(b.isDead() == true){
  //      bullets.remove(b);
  //    }else{
  //      b.draw();
  //    }
  //  }
  //}
}

void mousePressed(){
  SpaceShooter.mousePressed();
  //bullets.add(new Bullet(mouseX, mouseY, 50, 50));
}

void onTap(float x, float y){
  SpaceShooter.onTap(x, y);
}

void onAccelerometerEvent(float x, float y, float z){
  SpaceShooter.onAccelerometerEvent(x, y, z);
}
