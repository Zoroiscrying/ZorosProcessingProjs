Mover mover;
int num = 5;
Mover movers[] = new Mover[num];
coreParticle core;

void setup(){
  frameRate(60);
  background(255);
  size(800,600);
  //smooth();
  smooth();
  core = new coreParticle();
  mover = new Mover();
  for(int i = 0; i < num; i++){
    movers[i] = new Mover();
  }
}


void draw(){
  //background(255,10);
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  fill(255,155);
  
  core.Apply();
  
  //mover.Apply();
  //mover.Follow(core.location);
  for(int i  = 0;i < num; i++){
    movers[i].Apply();
    movers[i].Follow(core.location);
  }
  
  

}


void keyPressed()
{
  if(keyCode == TAB) saveFrame("screen.png");
}
