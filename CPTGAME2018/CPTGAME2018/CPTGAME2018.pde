//import java.awt.*;

Player p;
Portal po;
//Enemy e;
Platform[] platforms;  //make class Platform into an array
float platformSpeed;
Enemy[] enemies;       //make class Enemy into an array
Level l;
String screen;
boolean left, right, up, down;

void setup() {
  size(1366, 768);
  smooth();
  screen = "lvl1";
  p = new Player();
  l = new Level();
  //  e = new Enemy(1000, 600);
  platforms = new Platform[15];              //draw platforms
  platforms[0] = new Platform(200, 450, 200, 100);
  platforms[1] = new Platform(950, 500, 200, 200);
  platforms[2] = new Platform(0, 700, width, 200);
  platforms[3] = new Platform(500, 400, 200, 250);
  platforms[4] = new Platform(300, 640, 200, 10);        // lvl 1
  platforms[5] = new Platform(700, 640, 190, 10);
  platforms[6] = new Platform(750, 325, 100, 275);
  platforms[7] = new Platform(200, 200, 100, 50);
  //------------------------------------------------
  platforms[8] = new Platform(200, 630, 100, 70);
  platforms[9] = new Platform(375, 580, 100, 120);
  platforms[10] = new Platform(550, 350, 100, 400);      //tutorial
  platforms[11] = new Platform(0, 700, width, 68);
  platforms[12] = new Platform(375, 400, 100, 13);
  platforms[13] = new Platform(475, 695, 75, 10);
  platforms[14] = new Platform(80, 530, 130, 20);

  
  platformSpeed = 0;
  for(int i = 0; i < platforms.length; i++) {
    platforms[i].y += platformSpeed;
    platforms[i].x += platformSpeed;
  }
 
  
  
  enemies = new Enemy[3];
  enemies[0] = new Enemy(250, 410, 40, 40);
  enemies[1] = new Enemy(1100, 400, 100, 100);        //lvl 1
  //------------------------------------------------
  enemies[2] = new Enemy(575, 300, 50, 50);  
  
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
  background(127, 0, 0);
  l.tutorial();
  p.player();
  p.boundaries();
  p.move();
  p.enemyCollide();
  p.noFall();
}

void lvl1() {
  background(135,206,250);
  p.player();
  p.boundaries();
  p.move();
  l.lvl1();
  p.enemyCollide();
  p.noFall();
 // enemies[0].move();
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
  
  if (p.x >= pl.x+pl.w && p.x <= pl.x+pl.w+5) {
    if (p.y > pl.y-p.h && p.y < pl.y+pl.h) {
    return true;
    }
  }
  return false;
}

/*boolean enemyTopCollide(Enemy e, Platform pl) {
  
  if (enemies[0].x > pl.x-enemies[0].w && enemies[0].x < pl.x+pl.w) { // if enemy touches the top of a platform
    if (enemies[0].y >= pl.y-enemies[0].h && enemies[0].y <= pl.y-enemies[0].h+6){  // return true
      return true;
    }
  }
  return false;
}*/ 

boolean intersectEnemy(Player p, Enemy e) {  
  
  float distanceX = (p.x + p.w/2) - (e.x + e.w/2);
  
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

//boolean intersectPortal(Player p, Portal po) {
  
//}
  

void mouseClicked() {
  p.x = mouseX;
  p.y = mouseY;
  p.g = 0;
  p.g = 0.3;
}
