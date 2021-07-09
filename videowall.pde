Wall wall;
int tileSize = 150;

void setup() {
  size(1200, 1200);
  Sprite[] sprites = {
    new Sprite("assets/flower/flower.jpg", 8, tileSize),
    new Sprite("assets/eye/eye.jpg", 1, tileSize),
    new Sprite("assets/eye2/eye2.jpg", 20, tileSize),
    new Sprite("assets/output_20_evenlowerres.jpg", 10, tileSize),
  };

  Sprite sprite = sprites[2];
  
  wall = new Wall(sprite, tileSize);
  
}

void draw() {
  wall.render();  
  //noLoop();
}
