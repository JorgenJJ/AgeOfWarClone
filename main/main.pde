// VARIABLES
int maxUnits = 20;
int tileSize = 32;
int winLength = 1024;
int winHeight = 576;
int tileLength = winLength / tileSize;
int tileHeight = winHeight / tileSize;
int groundLevel = 10;
boolean showGrid = false;

int lastUnit = 0;
PImage menu;
float td;
float temptd;
float lastTime = 0;
int frame = 0;
int totEnemies = 0;

Base[] base = new Base[2];
Unit[] unit = new Unit[maxUnits];
Tile[][] tile = new Tile[32][18];

void setup() {
  //fullScreen();
  size(1024, 576);  // IF WINDOW SIZE IS CHANGED, THIS AND THE TWO VARIABLES ON TOP HAVE TO BE MANUALLY CHANGED
  frameRate(60);
  //background(100, 100, 255);
  
  // GENERATES WORLD
  for (int i = 0; i < tileLength; i++) {
    for (int j = 0; j < tileHeight; j++) {
      tile[i][j] = new Tile(i * tileSize, j * tileSize);
      if (j < groundLevel) tile[i][j].setType("air");
      else if (j == groundLevel) tile[i][j].setType("grass");
      else tile[i][j].setType("dirt"); 
    }
  }
  menu = loadImage("img/hud/menu.png");
}

void draw() {
  frame++;
  
  float td = millis();
  temptd = td;
  td -= lastTime;
  lastTime = temptd;
  
  for (int i = 0; i < tileLength; i++) { 
    for (int j = 0; j < tileHeight; j++) {
      tile[i][j].drawTile();
    }
  }
  
  for (int i = 0; i < lastUnit; i++) {
    unit[i].update(td);
    if (unit[i].isEnemy()) totEnemies++;
  }
  
  if (frame % 60 == 0) {
    if (totEnemies < 5) {
      float rand = random(10);
      if (rand > 8) {
        if (lastUnit != maxUnits) unit[lastUnit++] = new Unit(1, 2);
      }
    }
  }

  totEnemies = 0;
  image(menu, winLength - 512, 0);
  
  // GRID FOR TESTING
  if (showGrid) {
    for (int i = 0; i < winLength; i += tileSize) {
      line(i, 0, i, winHeight);
    }
    
    for (int i = 0; i < winHeight; i += tileSize) {
      line(0, i, winLength, i);
    }
  }
}

void keyTyped() {
  if (key == 'G' || key == 'g') {
    if (showGrid) showGrid = false;
    else showGrid = true;
  }
  
  if (key == '1') {
    if (lastUnit != maxUnits) unit[lastUnit++] = new Unit(1, 1);
  }
}
