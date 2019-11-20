class Mover{

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector followTarget;
  float speedLimit = 10.0f;
  float followStrength = 0.05f;
  float size = 25.0f;
  boolean followMouse = false;
  
  Mover(){
    acceleration = new PVector(-0.001,0.01);
    location = new PVector(random(width),random(height));
    velocity = new PVector(random(-2,2)*2,random(-2,2)*2); 
    followTarget = new PVector(width/2f, height/2f);
  }  
  
  void update(){
    acceleration = PVector.random2D();
    acceleration.mult(random(2.0f));
    if(followMouse){
      followTarget = new PVector(mouseX, mouseY);
    }
    PVector dir = PVector.sub(followTarget, location);
    dir.mult(followStrength);
    acceleration = dir;
    velocity.add(acceleration);
    location.add(velocity);
    velocity.limit(speedLimit);
  }
  
  void Follow(PVector target){
    this.followTarget = target;
  }
  
  void UpdateSize(float size){
    this.size = size;
  }
  
  void display(){
    stroke(0,155);
    noStroke();
    float R = sin(millis()*PI/8)*60f+190f;
    //float G = random(0,255);
    //float B = random(0,255);
    fill(R,R*0.2f,R*0.5f,155);
    ellipse(location.x,location.y,size,size);
  }
  
  void checkEdges(){
    if(location.x > width)location.x = 0;
    else if (location.x < 0) location.x = width;
    
    if(location.y > height) location.y = 0;
    else if(location.y < 0) location.y = height;
  }
  
  void Apply(){
    this.update();
    //this.checkEdges();
    this.display();
  }


}
