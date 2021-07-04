// TODO: Extras frame-urile intr-un ArrayList ca sa faca
// TODO: resize-u si restul calculelor o singura data.
// TODO: Ar merge determinat numaru de frame-uri si frame size-u automat
// TODO: Gasit un mod de a determina si viteza in mod automat in functie de 
// TODO: nr de frame-uri si size

class Tile {
  int x, y;
  int _color = 0;
  boolean isHovered;
  PImage sprite;
  PImage frame;
  
  static final int SIZE = 100;
  static final int SPRITE_FRAME_SIZE = 100; 
  static final int SPRITE_TOTAL_FRAMES = 25;
  static final int SPEED = 5;
  
  Tile(int x, int y, PImage sprite) {
    this.x = x;
    this.y = y;
    this.sprite = sprite;
    
  }
  
  void updateParams() {
    this.updateHoverStatus();
    this.updateColor();
  }
  
  private void updateHoverStatus() {
    if(
      mouseX >= this.x &&
      mouseX < this.x + Tile.SIZE &&
      mouseY >= this.y &&
      mouseY < this.y + Tile.SIZE
    ) {
      this.isHovered = true;
    } else {
      this.isHovered = false;
    }
  }
  
  private void updateColor() {
    if(this.isHovered && this._color <= 255) {
      this._color += Tile.SPEED;
    } else if(this._color >= 0) {
      this._color -= Tile.SPEED; 
    }
  }
  
  void render() {
    this.updateParams();
    
    int frameIndex = (int) map( //<>//
      this._color,
      0, 255,
      0, SPRITE_TOTAL_FRAMES
    );
    
    frame = this.sprite.get(
      0,
      frameIndex * Tile.SPRITE_FRAME_SIZE,
      SPRITE_FRAME_SIZE,
      SPRITE_FRAME_SIZE
    );
    
    //frame.resize(
    //  Tile.SIZE,
    //  Tile.SIZE
    //);
    
    image(frame, this.x, this.y);
  }
}
