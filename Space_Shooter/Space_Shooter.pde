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
import android.view.MotionEvent;
import ketai.ui.*;

float dw, dh;

KetaiGesture gesture;
KetaiSensor sensor;
Game SpaceShooter;

//ArrayList<Bullet> bullets;
void setup(){
  fullScreen();
  orientation(LANDSCAPE);
  dw = 1280.0/float(width);
  dh = 720.0/float(height);
  //bullets = new ArrayList<Bullet>();
  SpaceShooter = new Game("Space Shooter");
  gesture = new KetaiGesture(this);
  sensor = new KetaiSensor(this);
  sensor.start();
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
  SpaceShooter.mousePressed(mouseX, mouseY);
  //bullets.add(new Bullet(mouseX, mouseY, 50, 50));
}

void onTap(float x, float y){
  SpaceShooter.onTap(x, y);
}

void onAccelerometerEvent(float x, float y, float z){
  SpaceShooter.onAccelerometerEvent(x, y, z);
}

public boolean surfaceTouchEvent(MotionEvent event){
  //call to keep mouseX, mouseY, etc updated
  super.surfaceTouchEvent(event);

  //forward event to class for processing
  return gesture.surfaceTouchEvent(event);
}
