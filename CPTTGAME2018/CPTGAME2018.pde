//import java.awt.*;

Player p;
//Enemy e;
Platform[] platforms;  //make class Platform into an array
Enemy[] enemies;       //make class Enemy into an array
Level l;
String screen;
boolean left, right, up, down;

void setup() {
  fullScreen();
  smooth();
      screen = "lvl1";
      p = new Player();
      l = new Level();
    //  e = new Enemy(1000, 600);
  platforms = new Platform[8];              //draw platforms
  platforms[0] = new Platform(0, 700, width, 200);
  platforms[1] = new Platform(950, 550, 200, 100);
  platforms[2] = new Platform(200, 500, 200, 100);
  platforms[3] = new Platform(750, 650, 190, 10);
  platforms[4] = new Platform(300, 640, 200, 10);
  platforms[5] = new Platform(500, 400, 200, 250);
  platforms[6] = new Platform(200, 200, 100, 50);
  platforms[7] = new Platform(750, 500, 250, 100);
  
  
  enemies = new Enemy[1];
  enemies[0] = new Enemy(1100, 600, 100, 100);
}
  
void draw() {
  if (screen == "tutorial") {
    tutorial();
  } if (screen == "lvl1") {      
    lvl1();
  } else if (screen == "gameover") {
    gameover();
  } 
}

void tutorial() {
  background(255, 0, 0);
  l.tutorial();
}

void lvl1() {
  background(135,206,250);
  p.player();
  p.boundaries();
  p.move();
  l.lvl1();
  p.enemyCollide();
  println(p.topCollide, p.ySpeed, p.leftCollide);
}

void gameover() {
  background(0);
  fill(255, 0, 0);
  textSize(100);
  text("GAME OVER!", 350, 200);
}

void keyPressed() {
  switch (keyCode) {
  case 37: //left arrow key
    left = true;                  
    break;
  case 39://right arrow key
    right = true;
    break;
  case 38://up arrow key
    up = true;
    break;
  case 40://down arrow key
    down = true;
    break;
  }
}

void keyReleased() {
  switch (keyCode) {
  case 37://left arrow key
    left = false;
    break;
  case 39://right arrow key
    right = false;
    break;
  case 38://up arrow key
    up = false;
    break;
  case 40://down arrow key
    down = false;
    break;
  }
}

boolean topCollide(Player p, Platform pl) {
  
  if (p.x > pl.x-p.w && p.x < pl.x+pl.w) { // if player touches the top of a platform
    if (p.y >= pl.y-p.h && p.y <= pl.y-p.h+6){  // return true
      return true;
    }
  }
  return false;
} 

boolean botCollide(Player p, Platform pl) {
  
  if (p.x > pl.x-p.w && p.x < pl.x+pl.w) {
    if(p.y > pl.y+pl.h && p.y < pl.y+pl.h+5) {
      return true;
    }
  }
  return false; 
}

boolean leftCollide(Player p, Platform pl) {
  
 if (p.x >= pl.x-p.w && p.x <= pl.x) {
   if (p.y > pl.y-p.h && p.y < pl.y+pl.h) {
    return true;
   }
 }
  return false;
}

boolean rightCollide(Player p, Platform pl) {
  
  if (p.x >= pl.x+pl.w && p.x <= pl.x+pl.w+1) {
    if (p.y > pl.y-p.h && p.y < pl.y+pl.h) {
    return true;
    }
  }
  return false;
}

boolean intersectEnemy(Player p, Enemy e) {  
  //distance of x-axis
  float distanceX = (p.x + p.w/2) - (e.x + e.w/2);
  //distance of y-axis
  float distanceY = (p.y + p.h/2) - (e.y + e.h/2);

  float halfW = p.w/2 + e.w/2;

  float halfH = p.h/2 + e.h/2;

  if (abs(distanceX) < halfW) {

    if (abs(distanceY) < halfH) {
      return true;
    }
  }
  return false;
}

void mouseClicked() {
  p.x = mouseX;
  p.y = mouseY;
  p.g = 0;
  p.g = 0.3;
}
