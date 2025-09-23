
int Y_AXIS = 1;
int X_AXIS = 2;
color b1 = color(255,0,0);
color b2 =color(105, 170, 255);
void setup(){
size(400,300);
background(84, 167, 255);
setGradient(0, 0, width, height, b2 ,b1 ,Y_AXIS);
strokeWeight(0);

//sun
strokeWeight(4);
stroke(255, 157, 0);
fill(255, 200, 0);
ellipse(200, 200, 200, 200);

//water
strokeWeight(0);
fill(0, 51, 105);
rect(0, 200, 400, 100);
}

void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) {

  noFill();

  if (axis == Y_AXIS) {  // Top to bottom gradient
    for (int i = y; i <= y+h; i++) {
      float inter = map(i, y, y+h, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(x, i, x+w, i);
    }
  }  
  else if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) {
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}
