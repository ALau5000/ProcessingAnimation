class Level { 
  
  void tutorial() {
    for(int i = 8  ; i < platforms.length; i++) {    // show the visual of the level
      platforms[i].display();
    }
    
    for(int i = 2; i < 3; i++) {
      enemies[i].mediocre();
    }
    
    for(int i = 0; i < 1; i++) {
      pokemons[i].display();
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
    
    if (topCollide(p, platforms[14])) {
      if (platforms[14].y >= 200) {        //platform movement
        platforms[14].y -= 2;              //move up if on top of platform
      }    
    } if (!topCollide(p, platforms[14])) {
      if (platforms[14].y <= 530) {
        platforms[14].y += 3;        //move down if not on top of platform
      } 
    } if (topCollide(p, platforms[13])) {
      if (platforms[13].y >= 581) {
        platforms[13].y -= 5;
      }
    } if (!topCollide(p, platforms[13])) {
        if (platforms[13].y <= 690) {
          platforms[13].y += 1;
        }
    }
    
    /*if (platforms[11].y <= 530 && platforms[11].y >= 200) {
      platformSpeed = 2;
      platforms[11].y -= platformSpeed;
    } else if (platforms[11].y <= 200) {
      platformSpeed = -platformSpeed;
    }*/
    
  } 
    
  void lvl1() {
    for(int i = 0; i < 7; i++) {    // show the visual of the level
      platforms[i].display();
    }
    
    for (int i = 0; i < 1; i++) {
      enemies[i].weak();
    }
    
    for (int i = 1; i < 2; i++) {
      enemies[i].mediocre();
    }
    
    for(int i = 0; i < 7; i++) {    // apply collisions
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
    
   /* for(int i = 0; i < 2; i++) {
      if (enemyTopCollide(enemies[i], platforms[i])) {
        enemies[i].touchPlatformTop(enemies[i].y);
      }
    } */
    

  /*  enemies[0].x -= 5;
    if (enemies[0].x <= 900) {
      enemies[0].x += 20;
    } else if (enemies[0].x >= 1000) {
      enemies[0].x -= 5;
    }
    */
  }
}