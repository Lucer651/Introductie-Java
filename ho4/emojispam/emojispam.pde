int faces = 10;

void setup() {
  size(800, 800);
  for(int i = 0; i<faces; i++) {
  drawFace((int) Math.floor(Math.random()*400), (int) Math.floor(Math.random()*400));
  }
}
  PImage emoji;
  
  int x = 40;
  int y = 40;
  int w = 200;
  int h = 200;
void drawFace(int x, int y) {

  emoji = loadImage("50459edc-464f-4d30-a767-e89b210a8a9e.png");
  image(emoji, x, y, w, h);
  noLoop();
}
