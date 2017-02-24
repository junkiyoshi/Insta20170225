class Particle
{
  PVector location;
  float direction;
  float color_value;
  color body_color;
  PVector[] history;
  color[] color_history;
  int len;
  
  Particle(PVector l)
  {
    location = l.copy();
    direction = 5;
    color_value = random(255);
    body_color = color(color_value, 255, 255);
    len = 64;
    history = new PVector[len];
    color_history = new color[len];
    for(int i = 0; i < history.length; i++)
    {
      history[i] = location.copy();
      color_history[i] = body_color;
    }
  }
  
  void update()
  {
    location.add(0, direction, 0);
    if(location.y < 0 || location.y > height || random(100) > 98)
    { 
      direction *= -1; 
    }
    
    color_value = (color_value + 5) % 255;
    body_color = color(color_value, 255, 255);
    
    for(int i = history.length - 1; i > 0; i--)
    {
      history[i] = history[i - 1].copy();
      color_history[i] = color_history[i - 1];
    }
    history[0] = location.copy();
    color_history[0] = body_color;
  }
  
  void display()
  {
    fill(body_color);
    noStroke();
      
    for(int i = 0; i < history.length; i++)
    {
      pushMatrix();
      translate(history[i].x, history[i].y, history[i].z);
      
      if(i == 0)
      {
        sphere(5);
      }else
      {
        rotateX(radians(90));
        stroke(color_history[i]);
        strokeWeight(1);
        noFill();
        rect(0, 0, i * 10, i * 10);
      }
        
      popMatrix();
    }
  }
}