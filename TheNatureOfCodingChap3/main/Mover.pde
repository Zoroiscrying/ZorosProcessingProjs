class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass = 1;
  
  float angle = 0;
  float aVelocity = 0;
  float aAcceleration = 0.01f;
  
  Mover(){
    location = new PVector(random(width),random(height));
    velocity = new PVector(0,0);
    acceleration = new PVector(0,1);
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    
    aVelocity += aAcceleration;
    angle += aVelocity;
    
    acceleration.mult(0);
    
  }
  
  void display(){
    noStroke();
    fill(255,200);
    rectMode(CENTER);
    
    pushMatrix();
    translate(location.x,location.y);
    rotate(angle);
    rect(0,0,mass*16,mass*16);
    popMatrix();
  }
  
  void run(){
    update();
    display();
  }
  
}
