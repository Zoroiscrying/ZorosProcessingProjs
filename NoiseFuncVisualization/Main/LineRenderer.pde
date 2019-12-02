class LineRenderer
{
  ArrayList<PVector> points;
  color lineColor;
  float lineWidth;
  float noiseMultiplier = 40.0f;
  float ossilationAmpMult = 10.0f;
  float noiseScale = 40.0f;

  LineRenderer()
  {
    points = new ArrayList<PVector>();
    lineColor = color(255, 120);
    lineWidth = random(1.0f, 1.5f);
  }

  LineRenderer(float lineWidth, color lineColor)
  {
    points = new ArrayList<PVector>();
    this.lineColor = lineColor;
    this.lineWidth = lineWidth;
  }

  void AddPointAtEnd(PVector newPoint)
  {
    points.add(newPoint);
  }

  void ChangePointPos(int ind, PVector newPos)
  {
    if (ind >= 0 && ind < points.size()-1) points.set(ind, newPos);
  }

  void Display()
  {
    pushStyle();
    stroke(lineColor);
    strokeWeight(lineWidth);
    
    beginShape();
    for (PVector point : points)
    {
      //sin(millis()/500.0f * PI + point.y)* 20
      float offsetY = point.y;
      offsetY += noise(point.x/100.0f + millis()*width/5000000.0f, point.y/100.0f + millis()*width/3000000.0f )*120;
      offsetY += sin(millis()/1000.0f * PI + ((point.x+point.y)/PI/width)*40)* 2f;
      vertex(point.x, offsetY);
    }
    endShape(LINE);
    popStyle();
  }
}
