/*
 * Imaginile trebuie sa fie de 100x100 pixeli. Otherwise, trebuie modificata valoarea SPRITE_FRAME_SIZE
 */

class Frames {
  PImage sprite;
  
  int usableFrames;
  int allFrames;
  int tileSize;
  int speed;
  
  static final int SPRITE_FRAME_SIZE = 100;
  
  ArrayList<PImage> frames;
    
  Frames(
    PImage sprite,
    int tileSize
  ) {
    this.sprite = sprite;
    this.allFrames = this.sprite.height / Frames.SPRITE_FRAME_SIZE;
    
    this.usableFrames = this.allFrames % 2 == 0 ? this.allFrames - 1 : this.allFrames - 2; //<>//

    this.tileSize = tileSize; //<>//
    this.prepareFrames(); //<>//
  }
  
  void prepareFrames() {
    this.frames = new ArrayList<PImage>();
    
    for(int i = 0; i <= this.usableFrames; i++) {
        PImage _frame = this.sprite.get(
          0,
          i * Frames.SPRITE_FRAME_SIZE,
          Frames.SPRITE_FRAME_SIZE,
          Frames.SPRITE_FRAME_SIZE
        );
        
        _frame.resize(
          this.tileSize,
          this.tileSize
        );
        
        this.frames.add(_frame);
    }
    
    // TODO: De vazut la viteza aici cum fac sa nu mai flickere.
    
    //this.speed = this.allFrames % 2 == 0 ? 3 : 4;
    this.speed = 21;
  }
  
  PImage get(int index) {
    this.frames.get(index);
    return this.frames.get(index);    //<>//
  }
}
