Mover mover;

void setup(){
  size(1280,720);
  smooth();
  mover = new Mover();
}

void draw(){

  noStroke();
  fill(0,10);
  rectMode(CENTER);
  rect(width/2,height/2,width,height);
  
  mover.run();
}
