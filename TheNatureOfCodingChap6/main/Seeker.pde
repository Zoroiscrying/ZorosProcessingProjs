class Seeker {

  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxForce;
  float maxSpeed;

  Seeker(float x, float y) {
    this.location = new PVector(x, y);
    this.velocity = new PVector(random(-10, 10), random(-5, 5));
    this.acceleration = new PVector(0, 0);
    r = 3.0f;
    this.maxSpeed = 4;
    this.maxForce = 0.1;
  }

  void update() {
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    location.add(velocity);
    acceleration.mult(0);
    checkEdge();
  }

  void applyForce(PVector force) 
  {
    acceleration.add(force);
  }

  PVector seek(PVector target) {
    //desired direction points to the target.
    PVector desired = PVector.sub(target, location);
    //change to another implementation
    desired.normalize();
    desired.mult(maxSpeed);
    //if(desired.mag() < 100){
    //float m = map(d,0,100,0,maxForce);
    //desired.mult(m);
    //}
    //
    //desired.mult(0.05);
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    //applyForce(steer);
    return steer;
  }
  
  void flock(ArrayList<Seeker> seekers){
    PVector sep = separate(seekers);
    PVector ali = align(seekers);
    PVector coh = cohesion(seekers);
    
    sep.mult(1.5);
    ali.mult(1.0);
    coh.mult(1.0);
    
    applyForce(sep);
    applyForce(ali);
    applyForce(coh);
    
  }
  
  PVector cohesion(ArrayList<Seeker> seekers){
    float neighbordist = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    for(Seeker element: seekers){
      float d = PVector.dist(location, element.location);
      if(d>0 && d< neighbordist){
        sum.add(element.location);
        count++;
      }
    }
    
    if(count > 0){
      sum.div(count);
      return seek(sum);
    }else return new PVector(0,0);
  
  }
  
  PVector align(ArrayList<Seeker> seekers){
    float neighbordist = 50;
    PVector sum = new PVector(0,0);
    int count = 0;
    
    for(Seeker element : seekers){
      float d = PVector.dist(location, element.location);
      if(d>0 && d<neighbordist){
        sum.add(element.velocity);
        count++;
      }
    }
    
    PVector steer  = new PVector(0,0);
    if(count > 0){
      sum.div(count);
      sum.normalize();
      sum.mult(maxSpeed);
      steer = PVector.sub(sum,velocity);
      steer.limit(maxForce);
    }
    return steer;
  }

  PVector separate(ArrayList<Seeker> seekers) {
    float desiredSeparation = 50;
    PVector sum = new PVector();
    int count = 0;
    PVector steer = new PVector();

    for (Seeker element : seekers) {
      float d = PVector.dist(location, element.location);
      if (d > 0 && d < desiredSeparation) {
        PVector diff = PVector.sub(location, element.location);
        diff.normalize();
        sum.add(diff.div(d));
        count++;
      }
    }
    if (count > 0) {
      sum.div(float(count));
      sum.normalize();
      sum.mult(maxSpeed);
      steer = PVector.sub(sum, velocity);
      steer.limit(maxForce);
      //
      //applyForce(steer);
    }
    return steer;
  }

  PVector follow(FlowField flow) {
    
    PVector desired = flow.lookup(location);

    desired.mult(maxSpeed);
    
    PVector steer = PVector.sub(desired, velocity);
    steer.limit(maxForce);
    applyForce(steer);
    return steer;
  }

  void follow(Path p) {

    //Predict location 50(arbitrary choice) frames ahead
    PVector predict = velocity.copy();
    predict.setMag(50);
    PVector predictLoc = PVector.add(location, predict);

    //look at the line segment
    PVector a = p.start;
    PVector b = p.end;

    //Get the normal point to that line
    PVector normalPoint = getNormalPoint(predictLoc, a, b);

    //Find target point a little further ahead of normal
    PVector dir = PVector.sub(a, b);
    dir.normalize();
    dir.mult(10);
    PVector target = PVector.add(normalPoint, dir);

    //How Far away are we from the path?
    float distance = PVector.dist(predictLoc, normalPoint);
    //Only if the distance is greater than the path's radius do we 
    //go to the target
    if (distance > p.radius) {
      this.seek(target);
    }

    //strokeWeight(10);
    //point(target.x,target.y);
    //point(normalPoint.x,normalPoint.y);
    //point(predictLoc.x,predictLoc.y);
  }

  void display() {
    float theta = velocity.heading2D() + PI/2;
    fill(175);
    stroke(0);
    pushMatrix();
    translate(location.x, location.y);
    rotate(theta);
    beginShape();
    strokeWeight(1);
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
  }

  void checkEdge() {
    if (location.x > width) {
      location.x = 0;
    } else if (location.x < 0) {
      location.x = width;
    }

    if (location.y > height) {
      location.y = 0;
    } else if (location.y < 0) {
      location.y = height;
    }
  }
}
