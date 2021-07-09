class Wall {
  ArrayList<Tile> tiles;
  Sprite sprite;
  int tileSize;
  
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
  Wall(int tileSize) {

    this.tileSize = tileSize;
   
  }
  
  void initialize(Sprite sprite) {
    this.sprite = sprite;
   
    int numberOfTilesPerWidth = (int) width / tileSize;
    int numberOfTilesPerHeight = (int) height / tileSize;
   
    this.tiles = new ArrayList<Tile>();
   
    for(int i = 0; i <= numberOfTilesPerHeight; i++) {
      for(int j = 0; j <= numberOfTilesPerWidth; j++) {
        Tile tile = new Tile(
          j * this.tileSize, 
          i * this.tileSize,
          this.sprite.animationFrames
        );
       
        this.tiles.add(tile);
      }
    }
  }
  
  void render() {
    for(Tile tile : tiles) {
      tile.render();
    }
  }
}
