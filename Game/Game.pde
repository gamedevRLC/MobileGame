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

//Finite State Machine--------------------------------------------
String state;

//The floats of the game------------------------------------------
float tutorial_time, tutorial_starttime;

//The Font of the game
PFont font;

//Objects---------------------------------------------------------
Player p1;

//The special libraries---------------------------------------------------
KetaiGesture gesture;

void setup(){
  //Sets size to full screen, orientation horizontal, and loads kentai library
  size(displayWidth, displayHeight);
  orientation(LANDSCAPE);
  gesture = new KetaiGesture(this);
  
  //Loads the zelda font and uses it for all of the text
  font = createFont("ZeldaDXTTBRK.otf", height * .00092);
  textFont(font);
  
  //establishes the player---------------------------------------------
  p1 = new Player(width * .45, height * .75, width * .1);
  
  //Starts the time for the tutorial levels
  tutorial_starttime = millis();
  
  //Starts the game at the title screen------------------------------
  state = "Title Screen";
}

void draw(){
  if(state == "Title Screen"){
    TitleScreen();
  }
  
  if(state == "Tutorial"){
    Tutorial();
  }
}

void mousePressed(){
  //Goes from the title screen to screen 1----------------------------------
  if(state == "Title Screen"){
    state = "Tutorial";
  }
}

void onFlick(float x, float y, float px, float py, float v){
  //If not on the title screen, always move the player on screen flicking-------- 
  if(state != "Title Screen"){
    p1.onFlick(x, y, px, py, v);
  }
}

//Important for the processing of kentai gestures
public boolean surfaceTouchEvent(MotionEvent event) {

  //call to keep mouseX, mouseY, etc updated
  super.surfaceTouchEvent(event);

  //forward event to class for processing
  return gesture.surfaceTouchEvent(event);
}
