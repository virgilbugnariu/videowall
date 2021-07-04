class Wall {
  ArrayList<Tile> tiles; //<>//
  
  Wall(PImage sprite) {
   int numberOfTilesPerWidth = (int) width / Tile.SIZE;
   int numberOfTilesPerHeight = (int) height / Tile.SIZE;
   
   this.tiles = new ArrayList<Tile>();
   
   for(int i = 0; i <= numberOfTilesPerHeight; i++) {
     for(int j = 0; j <= numberOfTilesPerWidth; j++) {
       Tile _tile = new Tile(
         j * Tile.SIZE, 
         i * Tile.SIZE, 
         sprite
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
