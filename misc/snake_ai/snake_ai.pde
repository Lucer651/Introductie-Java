// Snake Game for Processing

ArrayList<PVector> snake;
PVector food;
PVector direction;
int gridSize = 20;
int score = 0;
boolean gameOver = false;
boolean gameStarted = false;

void setup() {
  size(600, 600);
  resetGame();
}

void draw() {
  background(20);
  
  if (!gameStarted) {
    drawStartScreen();
  } else if (gameOver) {
    drawGameOverScreen();
  } else {
    drawGame();
    updateGame();
  }
}

void drawStartScreen() {
  fill(255);
  textAlign(CENTER);
  textSize(48);
  text("SNAKE", width/2, height/2 - 50);
  
  textSize(18);
  text("Use WASD or Arrow Keys to move", width/2, height/2 + 20);
  text("Press SPACE to start", width/2, height/2 + 50);
}

void drawGame() {
  // Draw grid
  stroke(40);
  strokeWeight(1);
  for (int i = 0; i <= width; i += gridSize) {
    line(i, 0, i, height);
  }
  for (int j = 0; j <= height; j += gridSize) {
    line(0, j, width, j);
  }
  
  // Draw food
  fill(255, 50, 50);
  noStroke();
  rect(food.x * gridSize, food.y * gridSize, gridSize, gridSize);
  
  // Draw snake
  for (int i = 0; i < snake.size(); i++) {
    PVector segment = snake.get(i);
    if (i == 0) {
      // Head
      fill(100, 255, 100);
    } else {
      // Body
      fill(50, 200, 50);
    }
    rect(segment.x * gridSize, segment.y * gridSize, gridSize, gridSize);
  }
  
  // Draw score
  fill(255);
  textAlign(LEFT);
  textSize(20);
  text("Score: " + score, 10, 25);
}

void drawGameOverScreen() {
  drawGame(); // Draw the final game state
  
  // Semi-transparent overlay
  fill(0, 150);
  rect(0, 0, width, height);
  
  fill(255, 50, 50);
  textAlign(CENTER);
  textSize(48);
  text("GAME OVER", width/2, height/2 - 30);
  
  fill(255);
  textSize(24);
  text("Final Score: " + score, width/2, height/2 + 20);
  textSize(18);
  text("Press SPACE to restart", width/2, height/2 + 60);
}

void updateGame() {
  // Move snake every 8 frames (adjust for speed)
  if (frameCount % 8 == 0) {
    moveSnake();
    checkCollisions();
    checkFood();
  }
}

void moveSnake() {
  // Get current head position
  PVector head = snake.get(0).copy();
  
  // Move head in current direction
  head.add(direction);
  
  // Add new head
  snake.add(0, head);
  
  // Remove tail (unless we just ate food)
  if (!foodEaten) {
    snake.remove(snake.size() - 1);
  } else {
    foodEaten = false;
  }
}

boolean foodEaten = false;

void checkFood() {
  PVector head = snake.get(0);
  if (head.equals(food)) {
    score++;
    foodEaten = true;
    generateFood();
  }
}

void checkCollisions() {
  PVector head = snake.get(0);
  
  // Check wall collisions
  if (head.x < 0 || head.x >= width/gridSize || head.y < 0 || head.y >= height/gridSize) {
    gameOver = true;
    return;
  }
  
  // Check self collision
  for (int i = 1; i < snake.size(); i++) {
    if (head.equals(snake.get(i))) {
      gameOver = true;
      return;
    }
  }
}

void generateFood() {
  boolean validPosition = false;
  while (!validPosition) {
    food = new PVector(floor(random(width/gridSize)), floor(random(height/gridSize)));
    validPosition = true;
    
    // Make sure food doesn't spawn on snake
    for (PVector segment : snake) {
      if (segment.equals(food)) {
        validPosition = false;
        break;
      }
    }
  }
}

void resetGame() {
  snake = new ArrayList<PVector>();
  snake.add(new PVector(10, 10)); // Starting position
  direction = new PVector(1, 0);  // Moving right
  score = 0;
  gameOver = false;
  foodEaten = false;
  generateFood();
}

void keyPressed() {
  if (!gameStarted) {
    if (key == ' ') {
      gameStarted = true;
    }
  } else if (gameOver) {
    if (key == ' ') {
      resetGame();
      gameOver = false;
    }
  } else {
    // Game controls
    if ((key == 'w' || key == 'W' || keyCode == UP) && direction.y != 1) {
      direction = new PVector(0, -1);
    } else if ((key == 's' || key == 'S' || keyCode == DOWN) && direction.y != -1) {
      direction = new PVector(0, 1);
    } else if ((key == 'a' || key == 'A' || keyCode == LEFT) && direction.x != 1) {
      direction = new PVector(-1, 0);
    } else if ((key == 'd' || key == 'D' || keyCode == RIGHT) && direction.x != -1) {
      direction = new PVector(1, 0);
    }
  }
}
