
abstract class GameLevel implements IGameLevel{
  ArrayList<GameEntity> entities;
  String title;
  int levelNumber;
  int successTargetLevel;
  int failureTargetLevel;
  String basePath;
  PImage backgroundimg;
  
  GameLevel(int _levelNumber, int _successTarget, int _failTarget){
    levelNumber = _levelNumber;
    successTargetLevel = _successTarget;
    failureTargetLevel = _failTarget;
    entities = new ArrayList<GameEntity>();
    basePath = "levels/" + levelNumber + "/";
  }
  
  void update(){
    
  }
  
  void draw(){
    
  }
  
  void mousePressed(){
    
  }
  
  void onTap(float x, float y){
    
  }
  
  void onFlick(float x, float y, float px, float py, float v){
    
  }
  
  void onAccelerometerEvent(float x, float y, float z){
    
  }
  
  void addEntity(GameEntity entity){
    entities.add(entity);
  }

  boolean isDone(){
    return false;
  }
  
  boolean Lost(){
    return false;
  }

  int getNextLevel(){
    return successTargetLevel;
  }
  
  int getFailureLevel(){
    return failureTargetLevel;
  }
  
  void setTitle(String t){
    title = t;
  }  
}
