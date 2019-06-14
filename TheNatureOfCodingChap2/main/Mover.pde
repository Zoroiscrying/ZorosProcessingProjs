class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float speedLimit = 10.0f;
  float size = 25.0f;
  boolean followMouse = true;
  
  Mover(){
    acceleration = new PVector(-0.001,0.01);
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2)*2,random(-2,2)*2); 
  }  
  
  void applyForce(PVector force){
    acceleration = force;  
  }
  
  void update(){
    acceleration = PVector.random2D();
    acceleration.mult(random(2.0f));
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
    fill(175,155);
    ellipse(location.x,location.y,size,size);
  }
  
  void checkEdges(){
    if(location.x > width)location.x = 0;
    else if (location.x < 0) location.x = width;
    
    if(location.y > height) location.y = 0;
    else if(location.y < 0) location.y = height;
  }
  
}
