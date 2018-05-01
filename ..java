PVector[] boxes;
boolean[] keys = new boolean[128];  
float playerX;
float playerY;

void setup() {
  size(800, 500);

  playerX = 400;
  playerY = 400;
  
  boxes = new PVector[3];
  for (int i = 0; i < boxes.length; i++) {
    float x = random(0, width-150);
    float y = random(0, height);
    boxes[i] = new PVector(x, y);
  }
}

void draw() {
  background(238,130,238);
  
  playerY += 2;
  
  move();
  
  // Player 
  fill(#7FFF00);
  arc(playerX, playerY, 70, 70, PI, TWO_PI);
  fill(#20B2AA);
  ellipse(playerX, playerY, 150, 30);
  
  //Player boundaries
  if (playerX <= 75) {
    playerX = 75;
  } else if (playerX >= width - 75) {
    playerX = width - 75;
  } if (playerY <= 35) {
    playerY = 35; 
  } if (playerY >= height-20) {
    playerY = height-20;
  }
  
  fill(230,230,250);
  for (int i = 0; i < boxes.length; i++) {
    rect(boxes[i].x, boxes[i].y, 200, 75);
  }
}

// player movement
void move() {
  if (keys['a']) {
    playerX -= 10;
  } if (keys['d']) {
     playerX += 10;
  } if (keys['w']) {
    playerY -= 10;
  } if (keys['s']) {
    playerY += 10;
  }
}

void keyPressed() {
  keys[key] = true;
}

//Buttons you release become false
void keyReleased() {
  keys[key] = false;
}

void boxCollision() {
  if (playerY >= boxes[1].y) {
    playerY = 0;
  }
}
