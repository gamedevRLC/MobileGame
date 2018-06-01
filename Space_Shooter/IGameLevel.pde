
interface IGameLevel{
  void update();
  void draw();
  void mousePressed();
  void onTap(float x, float y);
  void onFlick(float x, float y, float px, float py, float v);
  void onAccelerometerEvent(float x, float y, float z);
  boolean isDone();
  boolean Lost();
  int getNextLevel();
  int getFailureLevel();
  void setTitle(String t);
  void addEntity(GameEntity e);
}
