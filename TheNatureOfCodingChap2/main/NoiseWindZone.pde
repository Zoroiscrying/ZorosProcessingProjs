class NoiseWindZone{

  PVector location;
  PVector direction;
  private float angleDir;
  private float angleMax;
  private float angleMin;
  float zoneArcRadius;
  float zoneArcAngle;
  float windStrength;
  
  NoiseWindZone(float x, float y, PVector dir, PVector zoneSize, float windStrength){
    this.location = new PVector(x,y);
    this.zoneArcRadius = zoneSize.x;
    this.zoneArcAngle = zoneSize.y;
    this.windStrength = windStrength;
    UpdateNormalDir(dir);
  }
  
  void UpdateNormalDir(PVector dir){
    this.direction = dir.copy().normalize();
    angleDir = -degrees(PVector.angleBetween(new PVector(1,0),direction));
    angleMin = angleDir-zoneArcAngle/2;
    angleMax = angleDir + zoneArcAngle/2;
  }
  
  void Display(){
      pushStyle();
      pushMatrix();
      
      stroke(255,255);
      fill(255,255);
      ellipseMode(CENTER);
      fill(100,100,255,100);
      translate(location.x, location.y);
      //ellipse(0,0,10,10);
      arc(0,0,this.zoneArcRadius*2,this.zoneArcRadius*2, radians(angleMin),radians(angleMax));
      //println(bottomLeft, bottomRight, upperLeft, upperRight);
      //println(zoneArcRadius);
      popStyle();
      popMatrix();
  }
  
  boolean IfIsIn(Mover mover){
    //if is at the upper part of the wind zone.
    //or lower part of the wind zone.
    PVector moverLoc = mover.location;
    PVector relativeDir = PVector.sub(moverLoc,this.location);
    float angle = -degrees(PVector.angleBetween(new PVector(1,0), relativeDir));
    float r = relativeDir.mag();
    if(r < zoneArcRadius && angle < angleMax && angle > angleMin){
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
    float angle = -degrees(PVector.angleBetween(new PVector(1,0), relativeDir));
    float r = relativeDir.mag();
    if(r < zoneArcRadius && angle < angleMax && angle > angleMin){
      //println(r);
      float deg = 360.0*noise(
      mover.location.x/width, 
      mover.location.y/height, 
      millis()/10000.0);

      float rad=radians(deg);
      //.add(new PVector(cos(rad), sin(rad)).mult(0.2f)
      mover.applyForce(relativeDir.copy().mult(this.windStrength/100.0f).add(new PVector(cos(rad), sin(rad)).mult(0.4f)));
      return true;
    }
    else return false;
  }
  
  void Update(){
    this.Display();
  }
  

}
