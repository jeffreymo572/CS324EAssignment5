float cam = 400;
ArrayList<Cloud> clouds = new ArrayList<Cloud>();
int numClouds = 2; // Can set to 1 if memory does not allow
boolean p = false;
PShape acloud;

void setup(){
  background(color(50, 0, 0));
  size(400, 400, P3D);
  // Cloud stuff
  // Cloud(obj, x, y, z, rainIntensity, speed)
  float increment = width / numClouds;
  for (int i = 0; i < width; i+=increment){
    clouds.add(new Cloud(-width+i, -height/4, random(0, 100), 1, new PVector(1, 0, 0)));
  }
}

void draw(){
  background(color(50, 0, 0));
  
  camera(0, 0, cam,
         0, 0, 0,
         0, 1, 0);
  for (Cloud c: clouds){
    c.draw(p);
  }
}
