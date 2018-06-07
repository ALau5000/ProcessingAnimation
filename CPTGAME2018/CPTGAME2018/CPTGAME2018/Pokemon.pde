class Pokemon {
  float x, y, w, h;
  
  Pokemon(float startX, float startY) {
    x = startX;
    y = startY;
    w = 50;
    h = 50;
  }
  
  void display() {
    image(pokemoncard, x, y, w, h);
  }
  
}
    