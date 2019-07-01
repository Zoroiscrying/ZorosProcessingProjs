class Boundary{
  
  float x,y;
  float w,h;
  Body body;
  
  Boundary(float x_, float y_, float w_, float h_){
    this.x = x_;
    this.y = y_;
    this.w = w_;
    this.h = h_;
    
    BodyDef bd = new BodyDef();
    bd.position.set(box2d.coordPixelsToWorld(x,y));
    bd.type = BodyType.STATIC;
    this.body = box2d.createBody(bd);
    
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    PolygonShape ps = new PolygonShape();
    ps.setAsBox(box2dW, box2dH);
    
    this.body.createFixture(ps,1);
    
  }
  
  void display(){
    fill(0);
    stroke(0);
    rectMode(CENTER);
    rect(x,y,w,h);
  }
  
}
