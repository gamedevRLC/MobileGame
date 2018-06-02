
class Game{
  IGameLevel currentLevel;
  GameSettings settings;
  String title;
  LevelFactory levelMaker;
  
  Game(String _title){
    title = _title;
    settings = new GameSettings();
    levelMaker = new LevelFactory();
  }
  
  void draw(){
    if(currentLevel == null){
      showMenu();
    }else{
      currentLevel.update();
      currentLevel.draw();
      if(currentLevel.isDone()){
        println("level has been completed. loading next level: " + currentLevel.getNextLevel());
        currentLevel = levelMaker.getLevel(currentLevel.getNextLevel());
      }else{
        if(currentLevel.Lost()){
          println("level has been failed. loading next level: " + currentLevel.getNextLevel());
          currentLevel = levelMaker.getLevel(currentLevel.getFailureLevel());
        }
      }
    }
  }
  
  void showMenu(){
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(50);
    text("Tap the screen to start the game", width * .5, height * .5);
  }
  
  void mousePressed(int mx, int my){
    if(currentLevel == null){
      currentLevel = levelMaker.getLevel(1);
    }else{
      currentLevel.mousePressed();
    }
  }
  
  void onTap(float x, float y){
    
  }
  
  void onAccelerometerEvent(float x, float y, float z){
    if(currentLevel != null){
      currentLevel.onAccelerometerEvent(x, y, z);
    }
  }
}
