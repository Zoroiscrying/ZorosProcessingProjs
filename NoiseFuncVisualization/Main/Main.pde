ArrayList<LineRenderer> lines;
float offsetX = 0;

void setup()
{
  size(800, 600);
  background(0);
  smooth();
  lines = new ArrayList<LineRenderer>();
  for (int j = 0; j <= height; j += 15)
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
  fill(0,120);
  rect(0,0,width,height);
  
  for (LineRenderer line : lines) line.Display();
}
