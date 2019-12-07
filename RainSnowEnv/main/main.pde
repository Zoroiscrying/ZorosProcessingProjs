int n = 200;
RainControlSystem rain;
float bgAlpha = 255;

void setup() {
  colorMode(HSB, 360, 100, 100);
  size(1280, 720);
  stroke(0, 100, 255);
  smooth();
  frameRate(60);

  rain = new RainControlSystem(n);
}

void draw() {
  DrawBackground();

  noStroke();
  fill(0, 40);
  rect(0, 0, width, height);
  rain.DetectSlowField(new PVector(mouseX, mouseY), 100f);
  rain.Update();
}


void DrawBackground()
{
  pushMatrix();
  pushStyle();
  noStroke();
  fill(0, 0, 100, bgAlpha);
  float xOffset = width/2 - cos(millis()/40000f*PI)*height;
  float yOffset = height - sin(millis()/40000f*PI)*height;
  ellipse(xOffset, yOffset, 200, 200);

  popStyle();
  popMatrix();
}

void keyPressed() {
  if (keyCode == UP) rain.ChangeSpdMultiplier(rain.rainDrops.get(0).velocityMultiplier * 2f);
  else if (keyCode == DOWN) rain.ChangeSpdMultiplier(rain.rainDrops.get(0).velocityMultiplier * 0.5f);
  else if (keyCode == LEFT) rain.ChangeDropColor(color(random(0, 360), random(50, 100), 100, 255));

  if (keyCode == RIGHT) rain.ApplyForce(new PVector(random(-2, 2), random(-2, 2)));
  if (keyCode == TAB) 
  {
    if (rain.envType == EnvType.RAIN)
    {
      rain.DropSnow();
      bgAlpha = 255;
      //print("SNOW");
    }else if (rain.envType == EnvType.SNOW)
    {
      rain.DropRain();
      bgAlpha = 128;
      //print("RAIN!");
    }
  }
}
