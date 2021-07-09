// TODO: Gasit un mod de a determina si viteza in mod automat in functie de 
// TODO: nr de frame-uri si size


class Tile {
  int x, y;
  int position = 0;
  
  boolean isHovered;
  
  Animation animation;
  
  
  Tile(
    int x, 
    int y,
    Animation animation
  ) {
    this.x = x;
    this.y = y;
    this.animation = animation;
    this.position = 0;
  }
  
  
  void step() {
    this.updateHoverStatus();
    this.updatePosition();
  }
  
  void render() {
    this.step();
    
    int frameIndex = this.convertPositionToFrameIndex(this.position, animation.totalFrames);
    
    image(
      this.animation.get(frameIndex), 
      this.x, 
      this.y
    );
  }
  
  
  private int convertPositionToFrameIndex(
    int position,
    int totalFrames
  ) {
   return (int) map(
      position,
      0, 255,
      0, totalFrames
    );
  }
      
  private void updateHoverStatus() {
    if(
      mouseX >= this.x &&
      mouseX < this.x + animation.tileSize &&
      mouseY >= this.y &&
      mouseY < this.y + animation.tileSize
    ) {
      this.isHovered = true;
    } else {
      this.isHovered = false;
    }
  }
  
  private void updatePosition() {
    String direction = "backwards";
    
    if(this.isHovered) {
      direction = "forwards";
    }
    
    this.position = this.animation.getNextPosition(this.position, direction);
    
  }
  
}
