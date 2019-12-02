import java.util.Queue;
ArrayList<Mover> moversList;
NoiseWindZone windZone;
GravityPuller gravityPuller;

PVector resetLocation;
float millisTimeInterval = 50.0f;
float millisTimerNextThresh;
int particleNum = 200;
int activateIndex = 0;

void setup(){
  size(1280,720);
  smooth();
  background(255);
  moversList = new ArrayList<Mover>();
  for(int i = 0 ; i < particleNum; i ++)
  {
    moversList.add(new Mover(new PVector(0+100,height-100),new PVector(random(0, 3),random(0,3)), random(10,20)));
  }
  windZone = new NoiseWindZone(0,height, new PVector(1,1), new PVector(800,90), 1.0f);
  gravityPuller = new GravityPuller(width/4*3 , height/4, 400, 1.0f);
  millisTimerNextThresh = millisTimeInterval;
  resetLocation = new PVector(0+100,height-100);
}

void draw(){
  if(millis() > millisTimerNextThresh) 
  {
    //println("GenerateAnewParticle");
    moversList.get(activateIndex).location = resetLocation.copy();
    moversList.get(activateIndex).Reset(resetLocation.copy(),true,true);
    activateIndex ++;
    activateIndex = activateIndex % particleNum;
    millisTimerNextThresh += millisTimeInterval;  
  }
  
  noStroke();
  fill(0,120);
  rect(0,0,width,height);
  
  PVector wind = new PVector(0.1f,0.1f);
  //PVector gravity = new PVector(0,2);
  
  //windZone.Update();
  //gravityPuller.Update();
  
  for(Mover mover : moversList)
  {
    windZone.ApplyForceTo(mover);
    gravityPuller.ApplyForceTo(mover);
    mover.applyForce(wind);
    mover.update();
    mover.checkEdges();
    mover.display();
  }
  
}
