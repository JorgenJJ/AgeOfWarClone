class Unit {
  int type; // 1 = MELEE | 2 = RANGED | 3 = HEAVY
  int team;
  PVector pos;
  PImage img;
  float vel;
  
  Unit(int t, int te) {
    pos = new PVector(0, 0);
    type = t;
    team = te;
    
    if (type == 1) {
      img = loadImage("img/units/chad.png");
      vel = 5;
    }
    //else if (type == 2)
    //else if (type == 3)
    
    if (team == 1) {
      pos.x = 100;
      pos.y = (groundLevel * tileSize) - (tileSize * 2);
    }
    else if (team == 2) {
      vel *= -1;
      pos.x = winLength - 100 - tileSize;
      pos.y = (groundLevel * tileSize) - (tileSize * 2);
    }
    
  }
  
  void update(float td) {
    pos.x += td * (vel / 100);
    
    if (pos.x > winLength - 32) pos.x = winLength - 32;
    else if (pos.x < 0) pos.x = 0;
    image(img, pos.x, pos.y);
  }
  
  boolean isEnemy() {
    if (team == 2) return true;
    else return false;
  }
}
