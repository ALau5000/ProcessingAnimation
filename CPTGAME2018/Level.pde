class Level { 
  
  void tutorial() {
    for(int i = 8  ; i < platforms.length; i++) {    // show the visual of the level
      platforms[i].display();
    }
    
    for(int i = 8; i < platforms.length; i++) {    // apply collisions
      if (topCollide(p, platforms[i])) {
        p.touchPlatformTop(platforms[i].y);
        break;
      } if (botCollide(p, platforms[i])) {
        p.touchPlatformBot();
        break;
      } if (leftCollide(p, platforms[i])) {
        p.touchPlatformLeft();
        break;
      } if (rightCollide(p, platforms[i])) {
        p.touchPlatformRight();
        break;
      //} if (p.y >= platforms[0].y) {
        //p.y = platforms[0].y-p.h;
      } else {
        p.topCollide = false;
        p.botCollide = false;
        p.leftCollide = false;
        p.rightCollide = false;
      }
    }
    
    if (platforms[11].y <= 530 && platforms[11].y >= 200) {
      platformSpeed = 2;
      platforms[11].y -= platformSpeed;
    } else if (platforms[11].y <= 200) {
      platformSpeed = -platformSpeed;
    }
    
  } 
    
  void lvl1() {
    for(int i = 0; i < 7; i++) {    // show the visual of the level
      platforms[i].display();
    }
    
    for (int i = 0; i < 1; i++) {
      enemies[i].display();
    }
    
    for (int i = 1; i < enemies.length; i++) {
      enemies[i].bigEnemy();
    }
    
    for(int i = 0; i < platforms.length; i++) {    // apply collisions
      if (topCollide(p, platforms[i])) {
        p.touchPlatformTop(platforms[i].y);
        break;
      } if (botCollide(p, platforms[i])) {
        p.touchPlatformBot();
        break;
      } if (leftCollide(p, platforms[i])) {
        p.touchPlatformLeft();
        break;
      } if (rightCollide(p, platforms[i])) {
        p.touchPlatformRight();
        break;
      //} if (p.y >= platforms[0].y) {
        //p.y = platforms[0].y-p.h;
      } else {
        p.topCollide = false;
        p.botCollide = false;
        p.leftCollide = false;
        p.rightCollide = false;
        
      }
    }
    

  /*  enemies[0].x -= 5;
    if (enemies[0].x <= 900) {
      enemies[0].x += 20;
    } else if (enemies[0].x >= 1000) {
      enemies[0].x -= 5;
    }
    */
  }
}