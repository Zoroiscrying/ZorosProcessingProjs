class Mover{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float speedLimit = 5.0f;
  float size = 25.0f;
  boolean followMouse = false;
  
  color moverColor;
  
  Mover(){
    acceleration = new PVector(-0.001,0.01);
    location = new PVector(width/2,height);
    velocity = new PVector(random(-2,2)*2,0.0f); 
    moverColor = color(0,0,0,0);
  }  
  
  Mover(PVector location, PVector velocity, float size){
    this.location = location.copy();
    this.velocity = velocity.copy();
    this.size = size;
    acceleration = new PVector(-0.001,0.01);
    moverColor = color(0,0,0,0);
  }
  
  void applyForce(PVector force){
    acceleration.add(force);  
  }
  
  void Reset(PVector location, boolean changeColor, boolean changeSize)
  {
    this.location = location;
    if(changeColor) this.moverColor = color(random(80,255),random(80,255),random(80,255),155);
    if(changeSize) this.size = random(10,20);
    
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
    acceleration.mult(0);
  }
  
  void display(){
    pushStyle();
    
    noStroke();
    fill(150,155);
    fill(moverColor);
    ellipse(location.x,location.y,size,size);
    
    popStyle();
  }
  
  void checkEdges(){
    if(location.x > width)location.x = 0;
    else if (location.x < 0) location.x = width;
    
    if(location.y > height) location.y = 0;
    else if(location.y < 0) location.y = height;
  }
  
}
