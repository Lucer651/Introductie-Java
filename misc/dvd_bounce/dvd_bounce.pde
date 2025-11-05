int rad = 60; //width shape
float xpos, ypos; //starting pos

float xspeed = 1.5; //speed shape
float yspeed = 1.2; //speed shape

int xdirection = 1; //Horizontal direction
int ydirection = 1; //Vertical direction

  PImage emoji;
  
  int x = 100;
  int y = 40;
  int w = 80;
  int h = 30;

  
//Change colour variables
int currentR = 0;
int currentG = 154;
int currentB = 204;

//corner hit easter egg
boolean cornerHit = false;
int cornerFlashTimer = 0;

void drawFace(float x, float y) {
  emoji = loadImage("dvd_white.png");
  tint(currentR, currentG, currentB);
  image(emoji, x, y, w, h);
  noTint();

}

void setup()
{
  size(640,360);
  noStroke();
  frameRate(60);
  ellipseMode(RADIUS);
  // Starting pos
  xpos = width/2;
  ypos = height/2;
}
//Change colour upon hitting bounds
void changeColor() {
  currentR = int(random(100, 255));
  currentG = int(random(100, 255));
  currentB = int(random(100, 255));
}
void draw()
{
  if (cornerFlashTimer > 0) {
    background(255);
    cornerFlashTimer--;
  } else {
  background(0);
  }
  
  //update pos
  xpos = xpos + (xspeed * xdirection);
  ypos = ypos + (yspeed * ydirection);
  
  //check bounce
  boolean hitHorizontal = false;
  boolean hitVertical = false;
  
  //see if shape exceed bounds
  if (xpos > width-w || xpos < w-w) {
    xdirection *= -1;
    hitHorizontal = true;
  }
  if (ypos > height-h || ypos < h-h) {
    ydirection *= -1;
    hitVertical = true;
}
//check corner bounce
if (hitHorizontal && hitVertical) {
  cornerHit = true;
  cornerFlashTimer = 30; 
  println("CORNER HIT");
}

if (hitHorizontal || hitVertical) {
  changeColor();
}
//Shape
drawFace(xpos,ypos);
//ellipse(xpos,ypos, rad, rad);
if (cornerFlashTimer > 0) {
  fill(255, 0, 0);
  textAlign(CENTER, CENTER);
  textSize(48);
  text("CORNER HIT!", width/2, height/2);
}
}
