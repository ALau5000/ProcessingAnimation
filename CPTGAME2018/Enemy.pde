class Enemy extends Level {
  float x, y, w, h;
  float enemySpeed;
 
  Enemy(float startX, float startY) {
    x = startX;
    y = startY;
    w = 50;
    h = 50;
    
    enemySpeed = 0;
  }
  
  void display() {
    noStroke();
    fill(0, 128, 143);
    rect(x, y, w, h);
  }
}