class Animation {
  Sprite sprite;

  int totalFrames;
  
  int tileSize;
  int _speed;
  int _spriteSize;
  
  PImage spriteSheet;
  
  ArrayList<PImage> frames;
    
  Animation(
    Sprite sprite,
    int tileSize
  ) {
    this.sprite = sprite;
    this.spriteSheet = sprite.load();

    this._spriteSize = this.spriteSheet.width;
    
    this.totalFrames = this.spriteSheet.height / this._spriteSize - 1;

    this.tileSize = tileSize;
    this.prepareFrames();
  }
  
  void prepareFrames() {
    this.frames = new ArrayList<PImage>();
    
    for(int i = 0; i <= this.totalFrames; i++) {
        PImage currentFrame = this.extractFrame(i);
        
        this.resizeFrame(currentFrame);
        
        this.frames.add(currentFrame);
    }
    
    
    this._speed = this.sprite.speed;
    println(this._speed);
  }
  
  PImage get(int index) {
    return this.frames.get(index);   
  }
  
  int getNextPosition(int currentPosition, String direction) {
    int newPosition;

    if (direction.equals("forwards") && currentPosition < 255){
      newPosition = currentPosition + this._speed;
      
      if(newPosition > 255) {
        int diff = newPosition - 255;
        newPosition = currentPosition + diff;
      }
      
    } else if(direction.equals("backwards") && currentPosition > 0) {
      newPosition = currentPosition - this._speed;
      
      if(newPosition < 0) {
        newPosition = 0;
      }
    } else {
      newPosition = currentPosition;
    }
    
    return newPosition;
  }
  
  PImage extractFrame(int frameIndex) {
    PImage _frame = this.spriteSheet.get(
      0,
      frameIndex * this._spriteSize,
      this._spriteSize,
      this._spriteSize
    );
    
    return _frame;
  }
  
  /*
   * This will modify the frame reference directly
   */
  void resizeFrame(PImage frame) {
    frame.resize(
      this.tileSize,
      this.tileSize
    );
  }  
}
