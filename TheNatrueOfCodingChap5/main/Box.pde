class Box{
  
  //the body has many useful varianbles such as position.
  Body body;
  float w;
  float h;
  
  Box(){
    w=16;
    h=16;
    
      ///Step2.Define the body.
    BodyDef bd = new BodyDef();
    bd.type = BodyType.DYNAMIC;
    bd.position.set(box2d.coordPixelsToWorld(width/2,height/2));
    
      ///Step3.create the body
    this.body = box2d.createBody(bd);
    
      ///Step4.define the shape
    PolygonShape ps = new PolygonShape();
    float box2dW = box2d.scalarPixelsToWorld(w/2);
    float box2dH = box2d.scalarPixelsToWorld(h/2);
    ps.setAsBox(box2dW,box2dH);
    
      ///Step5.define the fixture
    FixtureDef fd = new FixtureDef();
    fd.shape = ps;
    fd.density =1;
    fd.friction = 0.3f;
    fd.restitution = 0.5f;
    
      ///Step6.Attach the shape to the body with the fixture.
    body.createFixture(fd);
  }
  

  
  void display(){
    Vec2 pos = box2d.getBodyPixelCoord(body);
    float a = this.body.getAngle();
    
    pushMatrix();
    translate(pos.x,pos.y);
    rotate(-a);
    
    fill(175);
    stroke(0);
    rectMode(CENTER);
    rect(0,0,this.w,this.h);
    
    popMatrix();
  }
  
  void killBody(){
  
    box2d.destroyBody(this.body);
  
  }

}
