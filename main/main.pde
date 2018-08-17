// VARIABLES
int MAXUNITS = 10;
int tileSize = 32;
int winLength = 1024;
int winHeight = 576;
int tileLength = winLength / tileSize;
int tileHeight = winHeight / tileSize;
int groundLevel = 10;
boolean showGrid = false;

Base[] base = new Base[2];
Unit[] unit = new Unit[MAXUNITS];
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
}

void draw() {
  for (int i = 0; i < tileLength; i++) { 
    for (int j = 0; j < tileHeight; j++) {
      tile[i][j].drawTile();
    }
  }
  
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
  if (key == 'G') {
    if (showGrid) showGrid = false;
    else showGrid = true;
  }
}
