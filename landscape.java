PVector[] birds, rain;

void setup() {
  size(800, 500);

  rain = new PVector[100];
  for(int i = 0; i < rain.length; i++) {
    float x = random(0, width);
    float y = random(0, 425);
    rain[i] = new PVector(x, y);
  }
  birds = new PVector[10];
  for (int i = 0; i < birds.length; i++) {
    float x = random(0, width);
    float y = random(0, 400);
    birds[i] = new PVector(x, y);
  }
}

void draw() {
  background(#7B68EE);
  
  // sun
  noStroke();
  fill(#FF4500);
  ellipse(700, 80, 100, 100);
  
  // ground
  fill(#EE82EE);
  rect(0, 425, 800, 100);
  
  // loop through birds  
  for (int i = 0; i < birds.length; i++) {
    // move each bird
    birds[i].add(10, 0);

    // reset if they go too far
    if (birds[i].x - 75 > width) {
      birds[i].x = -75;
      birds[i].y = (int) random(50, 400);
    }
     
    // BIRD
    // bird tail
    rect(birds[i].x-80, birds[i].y+13, 50, 10);
    
    // bird body
    fill(#FFB6C1);
    ellipse(birds[i].x, birds[i].y+20, 100, 50);
    fill(#ADFF2F);
  
    // bird head
    ellipse(birds[i].x+40, birds[i].y, 40, 40);
    fill(#FFFF00);
    ellipse(birds[i].x+50, birds[i].y, 10, 10);
    
    // bird legs
    for (int l = 0; l < 100; l += 25) {
    ellipse(birds[i].x-35 + l, birds[i].y+40, 20, 20);
    }
  }
  
  for(int i = 0; i < rain.length; i++) {
    // move each raindrop
    rain[i].add(0, 10);

    // reset if they go too far
    if (rain[i].y - 100 > height) {
      rain[i].x = -75;
      rain[i].y = (int) random(0, 0);
    }
    
    //draw rain
    fill(#FF0000);
    rect(rain[i].x, rain[i].y, 5, 20);
  }
}
