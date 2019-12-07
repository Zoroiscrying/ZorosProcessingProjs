class RainDrop {
  //rain snow heavy-rain heavy-snow 
  //interaction with mouse and keyboard

  PVector location;
  PVector velocity;
  PVector acceleration;
  color dropColor;
  float sizeMax;
  float sizeMin;
  float velMax;
  float velMin;
  float velocityMultiplier = 1.0f;

  RainDrop(PVector location, PVector initVel) {
    this.location = location.copy();
    this.velocity = initVel.copy();
    this.acceleration = new PVector(0,0);
    dropColor = color(0,0,100,20);
    sizeMax = 5;
    sizeMin = 2;
    velMax = 15;
    velMin = 8;
  }
  
  void ApplyForce(PVector force)
  {
    this.acceleration.add(force.copy());
  }

  void update() {
    float spd = map(location.z, 0, 5, velMax, velMin);
    this.velocity = new PVector(spd/4f*velocityMultiplier, spd*velocityMultiplier);
    this.velocity.add(this.acceleration);
    this.location.add(this.velocity);
    float sign = 0;
    if(velocityMultiplier > 0) sign = 1;
    else if (velocityMultiplier < 0) sign = -1;
    if (location.y > (height + 10)) {
      location.y = - 10;
      location.x = random(-100,width);
      location.z = random(5);
    }
    this.acceleration.mult(0);
  }

  void show() {
    pushStyle();
    pushMatrix();
    
    translate(location.x,location.y);
    
    float t = map(location.z, 0, 5, sizeMax, sizeMin);
    fill(dropColor);
    ellipse(0, 0, t, t);
    
    popMatrix();
    popStyle();
  }
}
