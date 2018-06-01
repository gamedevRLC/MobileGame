
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
    }
  }
  
  void showMenu(){
    background(0);
    textAlign(CENTER);
    fill(255);
    textSize(100);
    text("Tap the screen to start the game", width * .5, height * .5);
  }
  
  void mousePressed(){
    if(currentLevel == null){
      currentLevel = levelMaker.getLevel(1);
    }else{
      currentLevel.mousePressed();
    }
  }
  
  void onTap(float x, float y){
    
  }
  
  void onAccelerometerEvent(float x, float y, float z){
    
  }
}
