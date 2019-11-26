class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float speedLimit = 10.0f;
  float size = 25.0f;
  boolean followMouse = false;
  
  Mover(){
    acceleration = new PVector(-0.001,0.01);
    location = new PVector(width/2,height);
    velocity = new PVector(random(-2,2)*2,0.0f); 
  }  
  
  void applyForce(PVector force){
    acceleration.mult(0);
    acceleration.add(force);  
  }
  
  boolean isInsideLiquid(Liquid liquid)
  {
    if(location.x < liquid.x + liquid.w
    && location.x > liquid.x
    && location.y < liquid.y + liquid.h
    && location.y > liquid.y)
    {
      return true;
    }else return false;
  }
  
  void update(){
    //acceleration = PVector.random2D();
    //acceleration.mult(random(0.0f));
    if(followMouse){
      PVector mouse = new PVector(mouseX, mouseY);
      PVector dir = PVector.sub(mouse, location);
      dir.mult(0.001f);
      acceleration = dir;
    }
    
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(speedLimit);
  }
  
  void display(){
    stroke(0,155);
    noStroke();
    fill(150,155);
    ellipse(location.x,location.y,size,size);
  }
  
  void checkEdges(){
    if(location.x > width)location.x = 0;
    else if (location.x < 0) location.x = width;
    
    if(location.y > height) location.y = 0;
    else if(location.y < 0) location.y = height;
  }
  
}
