ChangingOne stageOne;

void setup()
{
  stageOne = new ChangingOne();
  size(1600,900);
  smooth();
}

void draw()
{
  noStroke();
  fill(0,120);
  rect(0,0,width,height);
  stageOne.Update();
  
}
