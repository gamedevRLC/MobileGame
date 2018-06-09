
class LevelFactory{
  IGameLevel getLevel(int _levelNumber){
    IGameLevel level = new ErrorLevel();
    
    String basePath = "";
    String levelTitle;
    int levelNumber = _levelNumber;
    
    println("-------------------------------------------");
    println("Creating Level: " + _levelNumber);
    
    //intiailize with invalid level IDs.
    int levelType = -1;
    int successTargetLevel = -1;
    int failureTargetLevel = -1;
    
    basePath = "levels/" + _levelNumber + "/";
    println(basePath + _levelNumber + ".cfg");
    String[] lines;
    ArrayList<String> configLines = new ArrayList<String>();
    
    //tries to locate the config file for the level
    try{
      lines = loadStrings(basePath + levelNumber + ".cfg");
      println("loaded " + lines.length + " lines of data");
      configLines = sanitizeConfigFile(levelNumber);
    }
    
    catch(Exception e){
      println("Failed to load config file for level " + levelNumber + ": " + e.getMessage());
      level.setTitle("Failed to load level #" +levelNumber + ".  Please check configs");
      return level;
    }
    
    
    //Analyzes config file
    levelTitle = configLines.get(0);
    println("Found level title: " + levelTitle);
    
    levelType = int(configLines.get(1).trim());
    
    println("Processing level pass/fail targets..");
    String[] pieces = split(configLines.get(2).trim(), ',');
    if(pieces.length == 2){
      successTargetLevel = int(pieces[0]);
      failureTargetLevel = int(pieces[1]);
      println("success level: " + successTargetLevel);
      println("failure level: " + failureTargetLevel);
    }
    
    if(levelType == 0){
      println("Creating tutorial level...");
      level = new CalibrateLevel(levelNumber, successTargetLevel, failureTargetLevel);
    }
    
    if(levelType == 1){
      println("Creating space level...");
      level = new SpaceLevel(levelNumber, successTargetLevel, failureTargetLevel);
      configureSpaceLevel(configLines, (SpaceLevel)level);
    }
    
    if(levelType == 2){
      println("Creating failed level...");
      level = new FailedLevel(levelNumber, successTargetLevel, failureTargetLevel);
    }
    
    if(levelType == 3){
      println("Creating tutorial Level...");
      level = new TutorialLevel(levelNumber, successTargetLevel, failureTargetLevel);
      configureTutorialLevel(configLines, (TutorialLevel)level);
    }
    
    return level;
  }
  
  private ArrayList<String> sanitizeConfigFile(int levelNumber){
    ArrayList<String> config = new ArrayList<String>();
    String _basePath = "levels/" + levelNumber + "/";
    
    String[] lines = loadStrings(_basePath + levelNumber + ".cfg");
    println("loaded " + lines.length + " lines of data while sanitizing");
    
    for(String l : lines){
      if(!l.startsWith("#")){
        config.add(l);
      }
    }
    
    return config;
  }
  
  private void configureSpaceLevel(ArrayList<String> config, SpaceLevel slevel){
    println("Processing entities from config file...");
    
    for(int i = 3; i < config.size(); i++){
      String[]line = split(config.get(i).trim(), ',');
      if(line.length == 5){
        int type = int(line[0]);
        int ex = int(line[1]);
        int ey = int(line[2]);
        int ew = int(line[3]);
        int eh = int(line[4]);
        if(type == 1){
          slevel.addShip(new Ship(ex,ey, ew, eh));
        }
      }
    }
  }
  
  private void configureTutorialLevel(ArrayList<String> config, TutorialLevel tlevel){
    println("Creating entities from the config file...");
    
    String[] line = split(config.get(3).trim(), ',');
    if(line.length == 5){
      int type = int(line[0]);
      int ex = int(line[1]);
      int ey = int(line[2]);
      int ew = int(line[3]);
      int eh = int(line[4]);
      if(type == 1){
        tlevel.addShip(new Ship(ex, ey, ew, eh));
      }
    }
    
    for(int i = 4; i <config.size(); i++){
      String[]line2 = split(config.get(i).trim(),',');
      if(line2.length == 5){
        int type = int(line2[0]);
        int ex = -1 * int(line2[1]);
        int ey = int(line2[2]);
        int ew = int(line2[3]);
        int eh = int(line2[4]);
        if(type == 2){
          tlevel.addAsteroid(new Asteroid(ex, ey, ew, eh));
        }
      }
    }
  }
}
