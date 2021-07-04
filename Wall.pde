class Wall {
  ArrayList<Tile> tiles; //<>//
  
  static final int TILE_SIZE = 50;
  
  Wall(PImage sprite) {
   int numberOfTilesPerWidth = (int) width / Wall.TILE_SIZE;
   int numberOfTilesPerHeight = (int) height / Wall.TILE_SIZE;
   
   this.tiles = new ArrayList<Tile>();
   
   Frames _frames = new Frames(sprite, Wall.TILE_SIZE);
   
   for(int i = 0; i <= numberOfTilesPerHeight; i++) {
     for(int j = 0; j <= numberOfTilesPerWidth; j++) {
       Tile _tile = new Tile(
         j * Wall.TILE_SIZE, 
         i * Wall.TILE_SIZE,
         _frames
       );
       
       this.tiles.add(_tile);
     }
   }
  }
  
  void render() {
    for(Tile tile : tiles) {
      tile.render();
    }
  }
}
