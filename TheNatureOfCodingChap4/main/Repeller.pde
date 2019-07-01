class Repeller{

  PVector location;
  float r = 10;
  float G = 100.0f;
  
  Repeller(float x, float y){
    location = new PVector(x,y);
  }
  
  PVector repel(Particle p){
    //the direction from particle to repeller
    PVector dir = PVector.sub(this.location,p.location);
    
    float d = dir.mag();
    d = constrain(d,0.5f,100);
    dir.normalize();
    float force = -1*G/(d*d);
    dir.mult(force);
    return dir;
  }
  
  void display(){
    stroke(150,150);
    fill(150,150);
    ellipse(location.x,location.y,r*2,r*2);
  }
  

}
