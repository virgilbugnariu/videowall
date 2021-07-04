Wall wall;

void setup() {
  size(1200, 1200);
  //PImage sprite = loadImage("flower/flower.jpg");
  PImage sprite = loadImage("eye/eye.jpg");
  //PImage sprite = loadImage("output_20_evenlowerres.jpg");
  
  wall = new Wall(sprite);
  
}

void draw() {
  wall.render();  
}
