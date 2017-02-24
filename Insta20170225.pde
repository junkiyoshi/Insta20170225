Particle particle;
float angle;

void setup()
{
  size(512, 512, P3D);
  frameRate(30);
  colorMode(HSB);
  rectMode(CENTER);
  
  particle = new Particle(new PVector(width / 2, height / 2, 0));
 
  angle = 0;
 
  camera(width / 2.0, height / 2.0, (height / 2.0) / tan(PI*60.0 / 360.0),
       width/2.0, height/2.0, 0,
       0.0, 1.0, 0.0); 
}

void draw()
{
  background(0);
  
  angle = (angle + 1) % 360;
  float x = 512 * cos(radians(angle));
  float z = 512 * sin(radians(angle));
    
  camera(x + width / 2.0, height / 2.0, z, 
         width / 2.0, height / 2.0, 0.0, 
         0.0, 1.0, 0.0);
  
  particle.update();
  particle.display();
  
  /*
  println(frameCount);
  saveFrame("screen-#####.png");
  if(frameCount > 900)
  {
     exit();
  }
  */
}