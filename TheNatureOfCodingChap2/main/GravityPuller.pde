class GravityPuller{

  PVector location;
  float zoneRadius;
  float pullStrength;
  
  GravityPuller(float x, float y, float zoneRadius, float pullStrength){
    this.location = new PVector(x,y);
    this.zoneRadius = zoneRadius;
    this.pullStrength = pullStrength;
  }
  
  void Display(){
      pushStyle();
      pushMatrix();
      
      stroke(255,255);
      fill(255,255);
      ellipseMode(CENTER);
      fill(100,255,100,60);
      translate(location.x, location.y);
      ellipse(0,0,zoneRadius*2,zoneRadius*2);
      
      popStyle();
      popMatrix();
  }
  
  boolean IfIsIn(Mover mover){
    //if is at the upper part of the wind zone.
    //or lower part of the wind zone.
    PVector moverLoc = mover.location;
    PVector relativeDir = PVector.sub(moverLoc,this.location);
    float r = relativeDir.mag();
    if(r < zoneRadius){
      return true;
    }
    else return false;
  }
  
  boolean ApplyForceTo(Mover mover)
  {
    //if is at the upper part of the wind zone.
    //or lower part of the wind zone.
    PVector moverLoc = mover.location;
    PVector relativeDir = PVector.sub(moverLoc,this.location);
    float r = relativeDir.mag();
    if(r < zoneRadius){
      //println(r);
      float deg = 360.0*noise(
      mover.location.x/width, 
      mover.location.y/height, 
      millis()/10000.0);

      float rad=radians(deg);
      //.add(new PVector(cos(rad), sin(rad)).mult(1.0f)
      mover.applyForce(relativeDir.copy().normalize().mult(-this.pullStrength).add(new PVector(cos(rad), sin(rad)).mult(0.5f)));
      return true;
    }
    else return false;
  }
  
  void Update(){
    this.Display();
  }

}
