class Particle{
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan;
  
  Particle(){
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = new PVector(width/2,height/2);
    lifespan = 255.0f;
  }
  
  Particle(PVector l){
    acceleration = new PVector(0, 0.05);
    velocity = new PVector(random(-1,1),random(-2,0));
    location = l.get();
    lifespan = 255.0f;
  }
  
  void applyForce(PVector  force){
    acceleration.add(force);
  }
  
  void run(){
    update();
    display();
  }
  
  void update(){
    velocity.add(acceleration);
    location.add(velocity);
    lifespan -= 2.0f;
    //let acceleration be 0 at the end
    acceleration.mult(0);
  }
  
  void display(){
    stroke(0,lifespan);
    fill(0,lifespan);
    ellipse(location.x,location.y,8,8);
  }
  
  boolean isDead(){
    if(lifespan < 0.0)
    {
      return true;
    }
    else return false;
  
  }
  
  
  
  
}
