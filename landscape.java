PVector[] birds, rain;
boolean[] keys = new boolean[128];  
float playerX;
float playerY;

void setup() {
  size(800, 500);

  playerX = 400;
  playerY = 400;
  
  rain = new PVector[100];
  for(int i = 0; i < rain.length; i++) {
    float x = random(0, width);
    float y = random(0, 400);
    rain[i] = new PVector(x, y);
  }
  birds = new PVector[10];
  for (int i = 0; i < birds.length; i++) {
    float x = random(0, width);
    float y = random(0, 400);
    birds[i] = new PVector(x, y);
  }
}

void draw() {
  background(#7B68EE);
  
  // gravity
  playerY += 3;
  
  move();
  
  // sun
  noStroke();
  fill(#FF4500);
  ellipse(700, 80, 100, 100);
  
  // ground
  fill(#EE82EE);
  rect(0, 425, 800, 100);
  
  // loop through birds  
  for (int i = 0; i < birds.length; i++) {
    // move each bird
    float xSpeed = random(0, 20);
    birds[i].add(xSpeed, 0);

    // reset if they go too far
    if (birds[i].x - 75 > width) {
      birds[i].x = -75;
      birds[i].y = (int) random(50, 400);
    }
     
    // BIRD
    // bird tail
    rect(birds[i].x-80, birds[i].y+13, 50, 10);
    
    // bird body
    fill(#FFB6C1);
    ellipse(birds[i].x, birds[i].y+20, 100, 50);
    fill(#ADFF2F);
  
    // bird head
    ellipse(birds[i].x+40, birds[i].y, 40, 40);
    fill(#FFFF00);
    ellipse(birds[i].x+50, birds[i].y, 10, 10);
    
    // bird legs
    for (int l = 0; l < 100; l += 25) {
    ellipse(birds[i].x-35 + l, birds[i].y+40, 20, 20);
    }
  }
  
  for(int i = 0; i < rain.length; i++) {
    float ySpeed = random(0, 30);
    // move each raindrop
    rain[i].add(0, ySpeed);

    // reset if they go too far
    if (rain[i].y > height-80) {
      rain[i].x = (int) random(0, width);
      rain[i].y = 0;
    }
    
    //draw rain
    fill(#FF0000);
    rect(rain[i].x, rain[i].y, 3, 10);
  }
   
  // Player 
  fill(#7FFF00);
  arc(playerX, playerY, 70, 70, PI, TWO_PI);
  fill(#20B2AA);
  ellipse(playerX, playerY, 150, 30);
  
  //Player boundaries
  if (playerX <= 75) {
    playerX = 75;
  } else if (playerX > width - 75) {
    playerX = width - 75;
  } if (playerY < 35) {
    playerY = 35; 
  } if (playerY > height-100) {
    playerY = height-100;
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

//The buttons you press become true 
//multiple keys pressed can be true, 
//able to apply y and x movement at the same time
void keyPressed() {
  keys[key] = true;
}

//Buttons you release become false
void keyReleased() {
  keys[key] = false;
}
