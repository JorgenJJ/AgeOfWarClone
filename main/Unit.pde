class Unit {
  int type; // 1 = MELEE | 2 = RANGED | 3 = HEAVY
  PVector pos;
  PImage img;
  
  Unit(int t) {
    pos = new PVector(0, 0);
    type = t;
    
    if (type == 1) img = loadImage("img/units/chad.png");
    //else if (type == 2)
    //else if (type == 3)
  }
}
