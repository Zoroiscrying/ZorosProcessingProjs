class NoiseWindZone{

  PVector location;
  PVector direction;
  float zoneLength;
  float zoneHeight;
  float windStrength;
  PVector dirNormal;
  
  NoiseWindZone(float x, float y, PVector dir, PVector zoneSize, float windStrength){
    this.location = new PVector(x,y);
    this.direction = dir.normalize();
    this.zoneLength = zoneSize.x;
    this.zoneHeight = zoneSize.y;
    this.windStrength = windStrength;
    //vertical dir
    if(dir.x == 0) this.dirNormal = new PVector(1,0);
    else if(dir.y == 0) this.dirNormal = new PVector(0,1);
    else 
    {
      this.dirNormal = new PVector(dir.y/dir.x, -dir.x/dir.y);
      //println(dirNormal);
      this.dirNormal = this.dirNormal.normalize();
    }
    //println(dirNormal);
    // (x,y) * (y/x, -x/y);
    // x*x+y*1/x = 0
    // xy = 1;
  }
  
  void Display(){
      noStroke();
      fill(255,255);
      ellipseMode(CENTER);
      //ellipse(location.x,location.y,100,100);
      fill(100,100,255,255);
      PVector bottomLeft = location.copy().add(dirNormal.copy().mult(zoneHeight/2));
      PVector bottomRight = bottomLeft.copy().add(direction.copy().mult(zoneLength));
      PVector upperLeft = location.copy().add(dirNormal.copy().mult(zoneHeight/2));
      PVector upperRight = upperLeft.copy().add(direction.copy().mult(zoneLength));
      println("BottomLeft" + bottomLeft.toString() + "UpperLeft" + upperLeft.toString());
      ellipse(bottomLeft.x,bottomLeft.y,10,10);
      ellipse(upperLeft.x,upperLeft.y,10,10);
      ellipse(bottomRight.x,bottomRight.y,10,10);
      ellipse(upperRight.x,upperRight.y,10,10);
      //println(bottomLeft);
      beginShape();
      vertex(bottomLeft.x, bottomLeft.y);
      vertex(upperLeft.x, upperLeft.y);
      vertex(upperRight.x, upperRight.y);
      vertex(bottomRight.x, bottomRight.y);
      endShape(CLOSE);
  }
  
  void ApplyForce(Mover mover){
    //if is at the upper part of the wind zone.
    //or lower part of the wind zone.
    
  }
  
  void Update(){
    this.Display();
  }
  

}
