class Tile {
  PVector pos;
  PImage img;
  String imgUrl = "img/tiles/";
  String type;
  
  Tile(float x, float y) {
    pos = new PVector(x, y);
  }
  
  void setType(String t) {
    type = t;
    String temp = imgUrl + type + ".png";
    print("(" + int(pos.x) / 32 + ", " + int(pos.y) / 32 + "): " + type + "\n");
    img = loadImage(temp);
  }
  
  void drawTile() {
    image(img, pos.x, pos.y);
  }
}
