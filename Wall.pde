class Wall {
  ArrayList<Tile> tiles;
  Sprite sprite;
  static final int TILE_SIZE = 150;
  
  /*
   * The Wall class will receive the sprite to be
   * used by all Tiles.
   * The animation frames will be sent to the Animation
   * class to process the sprite and extract all the frames 
   * of the animation along the TILE_SIZE constant so it can 
   * do the appropriate processing (resize, crop).
   * 
   * The Animation class will be instanced only once and every
   * Tile class will use the same reference of the animation frames.
   */
  Wall(Sprite sprite) {
    this.sprite = sprite;
    
   int numberOfTilesPerWidth = (int) width / Wall.TILE_SIZE;
   int numberOfTilesPerHeight = (int) height / Wall.TILE_SIZE;
   
   this.tiles = new ArrayList<Tile>();
   
   Animation animationFrames = new Animation(
     sprite, 
     Wall.TILE_SIZE
   );
   
   for(int i = 0; i <= numberOfTilesPerHeight; i++) {
     for(int j = 0; j <= numberOfTilesPerWidth; j++) {
       Tile tile = new Tile(
         j * Wall.TILE_SIZE, 
         i * Wall.TILE_SIZE,
         animationFrames
       );
       
       this.tiles.add(tile);
     }
   }
  }
  
  void updateSprite(PImage sprite) {
    // Maybe implement
  }
  
  void render() {
    for(Tile tile : tiles) {
      tile.render();
    }
  }
}
