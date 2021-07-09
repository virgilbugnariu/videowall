class Sprite {
  String path;
  int speed;
  Animation animationFrames;
  
  Sprite(String path, int speed, int tileSize) {
    this.path = path;
    this.speed = speed;
    
    PImage spriteSheet = this.load();
    this.animationFrames = new Animation(spriteSheet, tileSize, speed);
  }
  
  PImage load() {
    return loadImage(this.path);  
  }
}
