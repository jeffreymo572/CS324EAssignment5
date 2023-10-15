class Cloud{
  PVector curr;
  PShape cloud;
  
  PVector pos;
  PVector orgPos;
  PVector inc;
  float cloudSpeed;
  
  ArrayList<Drop> drops = new ArrayList<Drop>();
  boolean spawning = true;
  float rainIntensity;
  /*
  ----------Main Cloud Functions-----------------
  */
  Cloud(float x, float y, float z, float rainIntensity, PVector inc){
    this.curr = new PVector(0,0,0);
    this.pos = new PVector(x, y, z);
    this.orgPos = new PVector(-width, y, random(0, 100));
    this.inc = inc;
    this.cloudSpeed = inc.x;
    
    cloud = loadShape("CloudPoly.obj");
    cloud.scale(200);
    
    this.rainIntensity = rainIntensity;
  }
 
  void draw(boolean p){
    // Increments cloud position
    if (!p){
      this.pos.add(this.inc);
    }
    pushMatrix();
    // Moving cloud across screen
    translate(this.pos.x, this.pos.y, this.pos.z);
    // Correcting clouds position
    rotateX(PI); // Flip cloud!
    rotateY(PI/2);
    // Lighting!
    directionalLight(255, 255, 255, 0, -1, 0);
    ambientLight(100, 100, 100);
    shape(cloud);
    noLights();
    popMatrix();
    
    drawDrops();
    
    if (this.isOff()){
      this.resetPosition();
    }
  }
  /*
  --------------Helper Cloud Functions------------------
  */
  // Helper function to determine if cloud is off screen
  Boolean isOff(){
    if ((this.pos.x > width) || (this.pos.y > height)){
      return true;
    }
    else{
      return false;
    }
  }
  // If offScreen, reset the position back to its original position
  void resetPosition(){
    this.pos = this.orgPos;
    this.orgPos = this.pos.copy();
  }
  
  /*
  ---------------Drop functions-------------------
  */
    void spawnDrop() {
    if (drops.size() >= this.rainIntensity*100){
      drops.remove(0);
    }
    Drop d = new Drop();
    d.hvelocity = cloudSpeed;
    d.position = PVector.add(this.pos, new PVector(random(-65, 65), random(15, 20)));
    d.push();
    drops.add(d);
  }

  void drawDrops() {
    // If drop is off screen, do not continue rendering them
    for (Drop d : drops) {
      if (d.offScreen() && spawning) {
        break;
      }
    }
    // Spawns the drop
    if (spawning) {
      spawnDrop();
    }
    // Draw
    for (Drop d : drops) {
      d.draw();
    }
  }
}
