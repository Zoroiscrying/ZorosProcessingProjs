class Particles {
  PVector pos;
  PVector target;
  PVector vel;
  PVector acc;
  float r;
  float maxspeed;
  float maxforce;

  Particles(float x, float y) {
    this.pos = new PVector(random(width), random(height));
    this.target = new PVector(x, y);
    this.vel = PVector.random2D();
    this.acc = new PVector(0, 0);
    this.r = 8;
    this.maxspeed = 10;
    this.maxforce = 1;
  }

  void behaviors() {
    PVector arrive = this.arrive(this.target);
    PVector mouse = new PVector(mouseX, mouseY);
    PVector flee = this.flee(mouse);

    arrive.mult(1);
    flee.mult(5);

    this.applyForce(arrive);
    this.applyForce(flee);
  }

  void applyForce(PVector f) {
    this.acc.add(f);
  }

  void update() {
    this.pos.add(this.vel);
    this.vel.add(this.acc);
    this.acc.mult(0);
  }

  void show () {
    stroke(255);
    strokeWeight(this.r);
    point(this.pos.x, this.pos.y);
  }


  PVector arrive(PVector target) {
    PVector desired = PVector.sub(target, this.pos);
    float d = desired.mag();
    float speed = this.maxspeed;
    if (d < 100) {
      speed = map(d, 0, 100, 0, this.maxspeed);
    }
    desired.setMag(speed);
    PVector steer = PVector.sub(desired, this.vel);
    steer.limit(this.maxforce);
    return steer;
  }

  PVector flee(PVector target) {
    PVector steer = new PVector(0, 0);
    PVector desired = PVector.sub(target, this.pos);
    float d = desired.mag();
    if (d < 50) {
      desired.setMag(this.maxspeed);
      desired.mult(-1);
      steer = PVector.sub(desired, this.vel);
      steer.limit(this.maxforce);
    }
    return steer;
  }
}
