int blockNumHori = 25;
int blockNumHoriTarget;
float circleRaidus = 20.0f;

void setup() {
  size(1600, 960);
  background(255);
  blockNumHoriTarget = blockNumHori;
}

void draw() {
  
  blockNumHori = round(lerp(float(blockNumHori), float(blockNumHoriTarget), 0.1f));
  println(blockNumHori);
  fill(255, 50);
  noStroke();
  rect(0, 0, width, height);
  float blockWidth = width/blockNumHori;
  int blockNumVert = floor(height/blockWidth)+1;

  //circleRaidus = blockWidth * sin(millis()/180.0f * PI / 8);
  //fill(0,255,255,200);
  //circle(width/2,height/2,circleRaidus*8);

  fill(255, 255, 0, 255);
  noStroke();
  for (int i=0; i< blockNumHori; i++) {
    for (int j = 0; j<blockNumVert; j++) {
      float horiPos = (float(i)+0.5f) * blockWidth;
      float vertPos = (float(j)+0.5f) * blockWidth;
      //rectMode(CENTER);
      //fill(255*noise(i/blockWidth,j/blockWidth));
      //rect(horiPos,vertPos,blockWidth,blockWidth);
      float angle = radians(horiPos +vertPos)/8 + (millis()/180.0f * PI / 8);
      float rx = blockWidth/3 * cos(angle);
      float ry = blockWidth/3 * sin(angle);
      fill(255, 0, 0, 255);
      circle(horiPos+rx, vertPos+ry, blockWidth/3);
      fill(0, 255, 0.50);
      if (ry > 0) circle(horiPos, vertPos, ry);
      //fill(0,255,255,200);
      //circle(horiPos,vertPos,circleRaidus);
    }
  }
}

void keyPressed()
{
  //blockNumHoriTarget = round(random(10, 100));
  //println(blockNumHoriTarget);
}

void mouseMoved()
{
  blockNumHoriTarget = round(map(mouseX, 0, width, 10, 30));
}
