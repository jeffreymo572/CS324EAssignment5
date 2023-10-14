PShape cloud;
float cam = 50;

void setup(){
  background(0);
  size(400, 400, P3D);
  cloud = loadShape("CloudPoly.obj");
  
  pushMatrix();
  cloud.scale(100);
  translate(width/2, height/2);
  popMatrix();
}

void draw(){
  background(0);
  camera(width/2, mouseY-50, cam,
       0, 0, 0,
       0, -1, 0);
  shape(cloud);
}
