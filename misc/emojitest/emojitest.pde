PImage emoji;

void setup() {
  // Make the sketch the same size as the image for exact pixel matching.
  size(512, 512);      // if your image is a different size, change these to match
  emoji = loadImage("50459edc-464f-4d30-a767-e89b210a8a9e.png");
  // draw the image at full size (pixel-perfect)
  image(emoji, 0, 0, width, height);
  noLoop();
}
