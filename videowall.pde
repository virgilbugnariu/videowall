Wall wall;

Sprite[] sprites = {
  new Sprite("assets/flower/flower.jpg", 8),
  new Sprite("assets/eye/eye.jpg", 1),
  new Sprite("assets/eye2/eye2.jpg", 20),
  new Sprite("assets/output_20_evenlowerres.jpg", 10),
};

void setup() {
  size(1200, 1200);
  
  Sprite sprite = sprites[3];
  
  wall = new Wall(sprite);
  
}

void draw() {
  wall.render();  
  //noLoop();
}
