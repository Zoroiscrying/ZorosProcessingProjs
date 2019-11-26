Mover m1;
NoiseWindZone windZone;


void setup(){
  size(1280,720);
  smooth();
  background(255);
  m1 = new Mover();
  windZone = new NoiseWindZone(width/2,height/2,new PVector(1,1), new PVector(100,100), 10.0f);
}

void draw(){
  background(0);
  //PVector wind = new PVector(0,0);
  //PVector gravity = new PVector(0,2);
  //m1.applyForce(wind);
  //m1.applyForce(gravity);
  
  windZone.Display();
  
  //m1.update();
  //m1.checkEdges();
  //m1.display();
  
}
