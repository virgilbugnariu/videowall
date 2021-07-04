// TODO: Extras frame-urile intr-un ArrayList ca sa faca
// TODO: resize-u si restul calculelor o singura data.
// TODO: Ar merge determinat numaru de frame-uri si frame size-u automat
// TODO: Gasit un mod de a determina si viteza in mod automat in functie de 
// TODO: nr de frame-uri si size


class Tile {
  int x, y;
  int _color = 0;
  
  boolean isHovered;
  
  Frames frames;
  
  
  Tile(
    int x, 
    int y,
    Frames frames
  ) {
    this.x = x;
    this.y = y;
    this.frames = frames;
  }
  
  void updateParams() {
    this.updateHoverStatus();
    this.updateColor();
  }
  
  private void updateHoverStatus() {
    if(
      mouseX >= this.x &&
      mouseX < this.x + frames.tileSize &&
      mouseY >= this.y &&
      mouseY < this.y + frames.tileSize
    ) {
      this.isHovered = true;
    } else {
      this.isHovered = false;
    }
  }
  
  private void updateColor() {
    if(this.isHovered && this._color <= 255) {
      // TODO: Probabil aici inainte sa fac adunarile/scaderile
      // TODO: trebuie vazut cat mai trebuie adunat din viteza ca sa nu dea peste.
      this._color += this.frames.speed;
    } else if(this._color > 0) {
      this._color -= this.frames.speed; 
    }
  }
  
  void render() {
    this.updateParams();
    
    int frameIndex = (int) map( //<>//
      this._color,
      0, 255,
      0, frames.usableFrames //<>//
    );
    
    image(
      this.frames.get(frameIndex),  //<>//
      this.x, 
      this.y
    );
  }
}
