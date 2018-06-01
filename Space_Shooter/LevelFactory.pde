
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
      println("loaded " + lines.length + "lines of data");
      configLines = sanitizeConfigFile(levelNumber);
    }
    
    catch(Exception e){
      println("Failed to load config file for level " + levelNumber + ": " + e.getMessage());
      level.setTitle("Failed to load level #" +levelNumber + ".  Please check configs");
      return level;
    }
    
    
    //Sanitizes config file
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
      println("Creating failed level...");
      level = new FailedLevel(levelNumber, successTargetLevel, failureTargetLevel);
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
    
  }
}