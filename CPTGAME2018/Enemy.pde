class Enemy extends Level {
  float x, y, w, h;
  float enemySpeed;
 
  Enemy(float startX, float startY, float startW, float startH) {
    x = startX;
    y = startY;
    w = startW;
    h = startH;
    
    enemySpeed = 0;
  }
  
  void display() {
    noStroke();
    fill(0, 128, 143);
    rect(x, y, w, h);
  }
}