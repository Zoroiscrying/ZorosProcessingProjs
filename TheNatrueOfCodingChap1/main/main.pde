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

//perlin noise test
/*
  float value = 0;
  int cubeSize = 16;
  int horizontalNum = width/cubeSize;
  int verticalNum = height/cubeSize;
  for (int i = 0; i < horizontalNum; ++i) {
    for (int j = 0; j < verticalNum; ++j) {
        value = map(noise(i,j),0,1,0,255);
        stroke(value);
        fill(value);
        ellipse(i*cubeSize + cubeSize/2,j*cubeSize + cubeSize/2,cubeSize,cubeSize);
    }
  }
*/
