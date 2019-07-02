Mover m1;
Liquid liquid;


void setup(){
  size(1280,720);
  smooth();
  background(255);
  m1 = new Mover();
  liquid = new Liquid(0, height/2, width, height/2, 0.05);
}

void draw(){
  background(255);
  PVector wind = new PVector(0,0);
  PVector gravity = new PVector(0,1);
  //m1.applyForce(wind);
  m1.applyForce(gravity);
  
  if(m1.isInsideLiquid(liquid)){
    liquid.dragMover(m1);
  }
  
  liquid.display();
  
  m1.update();
  m1.checkEdges();
  m1.display();
  
}
