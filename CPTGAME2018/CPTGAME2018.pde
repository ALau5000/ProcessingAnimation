//import java.awt.*;

Player p;
Platform[] platforms;  //make class Platform into an array
Level l;
String screen;
boolean left, right, up, down;

void setup() {
  fullScreen();
  smooth();
  screen = "lvl1";
  p = new Player();
  l = new Level();
  platforms = new Platform[4];              //draw platforms
  platforms[0] = new Platform(0, 700, width, 200);
  platforms[1] = new Platform(300, 650, 199, 10);
  platforms[2] = new Platform(200, 500, 180, 100);
  platforms[3] = new Platform(500, 400, 200, 240);
}

void draw() {
  if (screen == "lvl1") {      
    lvl1();
  }
}

void lvl1() {
  background(0, 0, 255);
  p.player();
  p.boundaries();
  p.move();
  l.lvl1();
  println(p.topCollide);
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
  
  if (p.x >= pl.x+pl.w && p.x <= pl.x+pl.w) {
    if (p.y > pl.y-p.h && p.y < pl.y+pl.h) {
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