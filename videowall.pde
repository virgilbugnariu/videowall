Wall wall;

void setup() {
  size(1200, 1200);
  //PImage sprite = loadImage("assets/flower/flower.jpg");
  //PImage sprite = loadImage("assets/eye/eye.jpg");
  PImage sprite = loadImage("assets/eye2/eye2.jpg");
  //PImage sprite = loadImage("assets/output_20_evenlowerres.jpg");
  
  wall = new Wall(sprite);
  
}

void draw() {
  wall.render();  
  //noLoop();
}
