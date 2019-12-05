ArrayList<LineRenderer> lines;
float offsetX = 0;

void setup()
{
  size(1600, 900);
  background(0);
  smooth();
  lines = new ArrayList<LineRenderer>();
  for (int j = 0; j <= height; j += 40)
  {
    LineRenderer line = new LineRenderer();

    for (int i = 0; i <= width; i += 10)
    {
      PVector newPoint = new PVector(i,j);
      line.AddPointAtEnd(newPoint);
    }

    lines.add(line);
  }
}

void draw()
{
  noStroke();
  fill(0,60);
  rect(0,0,width,height);
  
  for (LineRenderer line : lines) line.Display();
}

void keyPressed()
{
  if(keyCode == TAB) saveFrame("screen.png");
}
