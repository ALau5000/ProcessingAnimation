class Player {
  float x, y, w, h, g;
  float xSpeed, ySpeed, maxSpeed;
  boolean topCollide, botCollide, leftCollide, rightCollide;
  
  Player() {
    x = 0;
    y = 600;
    w = 35;
    h = 35;
    g = 0.1;      //gravity
    
    xSpeed = 0;
    ySpeed = 0;
    maxSpeed = 10;
   
  }
  
  void player() {
    noStroke();
    fill(255, 0, 0);
    rect(x, y, w, h);
  }
  
  
  void move() {
    if (left) {        //move left
      xSpeed = -5;
    } if (right) {     //move right
      xSpeed = 5;
    } else if (!left && !right) {   //no movement in x-axis if left and right isn't pressed
      xSpeed = 0;
    } if (up && topCollide) {  // only jump once when on platform
      ySpeed = -7;
    } if (!topCollide) {
      ySpeed += g;
    } 
    
    x += xSpeed;      
    y += ySpeed;
    
    if (ySpeed >= maxSpeed) {
      g = 0;
    } else {
      g = 0.3;
    }
   
  }
  
  void boundaries() {     //boundaries for player so he cant move out of screen
    if (x >= width-50) {
      x = width-50;        //player stays in place if he touches boundaries
    } if (x <= 0) {
      x = 0;
    } if (y <= 0) {
      y = 0;
    } if (y >= height-50) {
      y = height-50;
    }
  }
  
   void touchPlatformTop(float locY) {
     ySpeed = 0;      // if player touches platform, he stops moving down
     topCollide = true;  
     y = locY-h; //player's location at y always stays -50 from platform when touching
   }              // any platform. So player will always be standing on platform
   
   void touchPlatformBot() { // when player jumps and hits the bottom of a platform
    ySpeed = 0;
    botCollide = true;      // he won't go through
    
  }
  
  void touchPlatformLeft(float locX) {  // player can't jump through left side of platforms
    
    leftCollide = true;
    x = locX-w;
  }
  
  void touchPlatformRight() { // player can't jump through right side of platforms
    x+=5;
    rightCollide = true;
  }
  
  void enemyCollide() {
    for (int i = 0; i < enemies.length; i++) {
      if (intersectEnemy(p, enemies[i])) {
        screen = "gameover";
      }
    }
  }
}
      
    