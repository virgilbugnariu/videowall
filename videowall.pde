Wall wall;
int tileSize = 150;

int currentSpriteIndex;
int spritesCount = 0;

ArrayList<Sprite> sprites = new ArrayList<Sprite>();

void setup() {
  size(1200, 1200);
  
  sprites.add(new Sprite("assets/flower/flower.jpg", 8, tileSize));
  sprites.add(new Sprite("assets/eye/eye.jpg", 1, tileSize));
  sprites.add(new Sprite("assets/eye2/eye2.jpg", 20, tileSize));
  sprites.add(new Sprite("assets/output_20_evenlowerres.jpg", 10, tileSize));

  spritesCount = sprites.size();

  currentSpriteIndex = (int) random(0, spritesCount);

  Sprite sprite = sprites.get(currentSpriteIndex);  
  
  wall = new Wall(tileSize);
  wall.initialize(sprite);
  
}

void draw() {
  wall.render();  
  //noLoop();
}

void mouseClicked() {
  if(currentSpriteIndex < spritesCount - 1) {
    currentSpriteIndex += 1; 
  } else {
    currentSpriteIndex = 0;
  }
  
  wall.initialize(sprites.get(currentSpriteIndex));
}
