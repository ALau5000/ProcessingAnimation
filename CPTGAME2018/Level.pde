class Level { 
  
  void tutorial() {
    
  }
    
  void lvl1() {
    for(int i = 0; i < platforms.length; i++) {    // show the visual of the level
      platforms[i].display();
    }
    
    for(int i = 0; i < platforms.length; i++) {    // apply collisions
      if (topCollide(p, platforms[i])) {
        p.touchPlatformTop(platforms[i].y);
        break;
      } if (botCollide(p, platforms[i])) {
        p.touchPlatformBot();
        break;
      } if (leftCollide(p, platforms[i])) {
        p.touchPlatformLeft(platforms[i].x);
        break;
      } if (rightCollide(p, platforms[i])) {
        p.touchPlatformRight();
        break;
      //} if (p.y >= platforms[0].y) {
        //p.y = platforms[0].y-p.h;
      } else {
        p.topCollide = false;
      }
    }
    
    for (int i = 0; i < enemies.length; i++) {
      enemies[i].display();
    }
    

    enemies[0].x -= 5;
    if (enemies[0].x <= 900) {
      enemies[0].x += 20;
    } else if (enemies[0].x >= 1000) {
      enemies[0].x -= 5;
    }
  }
  
}