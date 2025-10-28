PFont f;                          

void setup() {
  size(1200,800);
  f = loadFont("FranklinGothic-DemiCond-48.vlw");
}

void draw() {
  background(255, 0, 0);
  textFont(f,48);                
  fill(0);                         
  text("This is text!",10,100); 
  fill(157, 0, 255);
  text("This is more text!",700,500);
  fill(255, 255, 35);
  text("This is even more text!" , 100, 700);
}
