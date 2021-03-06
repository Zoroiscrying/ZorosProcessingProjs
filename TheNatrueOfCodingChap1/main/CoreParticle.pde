class coreParticle {

  PVector location;
  PVector velocity;
  PVector acceleration;
  PVector followTarget;
  float speedLimit = 10.0f;
  float size = 25.0f;

  boolean followMouse = true;

  coreParticle() {
    acceleration = new PVector(-0.001, 0.01);
    location = new PVector(random(width), random(height));
    velocity = new PVector(random(-2, 2)*2, random(-2, 2)*2); 
    followTarget = new PVector(width/2f, height/2f);
  }  

  void update() {
    acceleration = PVector.random2D();
    acceleration.mult(random(2.0f));
    if (followMouse) {
      followTarget = new PVector(mouseX, mouseY);
    }
    PVector dir = PVector.sub(followTarget, location);
    dir.mult(0.1f);
    acceleration = dir;
    velocity = dir.copy().normalize().mult(velocity.mag());
    location.add(velocity);
    velocity.limit(speedLimit);
  }

  void UpdateSize(float size) {
    this.size = size;
  }

  void display() {
    stroke(0, 155);
    noStroke();
    float R = sin(millis()*PI/8)*60f+190f;
    //float G = random(0,255);
    //float B = random(0,255);
    fill(R * 0.5, R *0.6f, R*0.8f, 155);
    ellipse(location.x, location.y, size, size);
  }

  void Apply() {
    this.update();
    this.display();
  }
}
