class Sprite {
  String path;
  int speed;
  
  Sprite(String path, int speed) {
    this.path = path;
    this.speed = speed;
  }
  
  PImage load() {
    return loadImage(this.path);  
  }
}
