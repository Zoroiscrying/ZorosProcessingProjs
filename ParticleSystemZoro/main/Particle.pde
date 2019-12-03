class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  boolean constantParticle = false;
  color particleColor;
  float lifespan;


  Particle(PVector l, boolean isConstant) {
    // The acceleration
    acceleration = new PVector(0, 0.05);
    // circel's x and y ==> range
    velocity = new PVector(random(-1, 1), random(-2, 0));
    // apawn's position
    location = l.copy();
    // the circle life time
    lifespan = 255.0;

    constantParticle = isConstant;

    particleColor = color(random(0, 255), random(0, 255), random(0, 255));
  }

  Particle(PVector l, boolean isConstant, color particleCol) {
    // The acceleration
    acceleration = new PVector(0, 0.05);
    // circel's x and y ==> range
    velocity = new PVector(random(-1, 1), random(-2, 0));
    // apawn's position
    location = l.copy();
    // the circle life time
    lifespan = 255.0;
    constantParticle = isConstant;
    particleColor = particleCol;
  }

  void run() {
    update();
    display();
  }
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    lifespan-=1.0;
  }

  boolean isDead() {
    if (lifespan <= 0 && !constantParticle) {
      return true;
    } else {
      return false;
    }
  }

  boolean isOutSideOfWindow()
  {
    if (location.x > width || location.x < 0 || location.y > height || location.y < 0) return true;
    else return false;
  }

  boolean isOutSideOBottomWindow()
  {
    if (location.y > height || location.x > width) return true;
    else return false;
  }

  void display() {
    // border
    pushStyle();

    noStroke();
    //stroke(0, lifespan);
    // border's weight
    //strokeWeight(1);
    if (!constantParticle) fill(particleColor, lifespan);
    else fill(particleColor, 255);
    // draw circle
    ellipse(location.x, location.y, 10, 10);

    popStyle();
  }

  void reset(PVector newLocation, PVector newVelocity)
  {
    this.location = newLocation.copy();
    this.velocity = newVelocity.copy();
    this.acceleration.mult(0);
  }
}
