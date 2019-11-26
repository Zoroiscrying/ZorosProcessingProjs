class Liquid{
  float x,y,w,h;
  float c;
  
  Liquid(float x, float y, float w, float h, float c){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.c = c;
  }
  
  void display(){
    noStroke();
    fill(50);
    rect(x,y,w,h);
  }
  
  void dragMover(Mover m){
    float speed = m.velocity.mag();
    float dragMagnitude = this.c * speed * speed + 0.0f;
    
    PVector drag = m.velocity.get();
    drag.mult(-1);
    drag.normalize();
    
    drag.mult(dragMagnitude);
    
    m.applyForce(drag);
  }
  

}
