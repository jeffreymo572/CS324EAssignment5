class Drop {
  PVector position;
  float velocity;
  float hvelocity;
  float gravity;
  Drop originalState;
  
  Drop() {
    position = new PVector();
    velocity = 0;
    gravity = 0.3;
  }
  
  boolean offScreen() {
    if (position.y > height) {
      return true;
    }
    return false;
  }
  
  void push() {
    originalState = new Drop();
    originalState.position = position.copy();
    originalState.velocity = velocity;
  }
  
  void update() {
    position.x += hvelocity;
    position.y += velocity;
    velocity += gravity;
    if (position.x > width){
      position.x = position.x;
    }
    if (originalState != null && position.y > height) {
      position.y = originalState.position.y;
      velocity = originalState.velocity;
    }
  }
  
  void draw() {
    update();
    
    PVector p = position.copy();
    pushStyle();
    stroke(255);
    line(p.x, p.y, p.x, p.y-10);
    popStyle();
  }
}
