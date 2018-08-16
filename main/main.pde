int MAXUNITS = 10;
int winLength = 1024;
int winHeight = 576;

// BASE CLASS
class Base {
  
}

class Unit {
  int type; // 1 = MELEE | 2 = RANGED | 3 = HEAVY
  PVector pos;
  
  Unit() {
    pos = new PVector(0, 0);
  }
}

Base[] base = new Base[2];
Unit[] unit = new Unit[MAXUNITS];

void setup() {
  //fullScreen();
  size(1024, 576);  // IF WINDOW SIZE IS CHANGED, THIS AND THE TWO VARIABLES ON TOP HAVE TO BE MANUALLY CHANGED
  frameRate(60);
  background(100, 100, 255);
}

void draw() {
  for (int i = 0; i < winLength; i += 32) {
    line(i, 0, i, winHeight);
  }
  
  for (int i = 0; i < winHeight; i += 32) {
    line(0, i, winLength, i);
  }
}
