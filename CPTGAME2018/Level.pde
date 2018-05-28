class Level { 
  
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
        p.touchPlatformLeft();
        break;
      } if (rightCollide(p, platforms[i])) {
        p.touchPlatformRight();
        break;
      } else {
        p.topCollide = false;
      }
    }
  }
  
}