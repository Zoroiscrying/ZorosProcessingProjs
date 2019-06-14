Mover mover;
Mover movers[] = new Mover[10];

void setup(){
  background(255);
  size(800,600);
  //smooth();
  smooth();
  mover = new Mover();
  for(int i = 0; i < 10; i++){
    movers[i] = new Mover();
  }
}


void draw(){
  //background(255,10);
  noStroke();
  fill(0,10);
  rect(0,0,width,height);
  fill(255,155);
  mover.update();
  mover.checkEdges();
  mover.display();
  for(int i  = 0;i < 10; i++){
    movers[i].update();
    movers[i].checkEdges();
    movers[i].display();
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
