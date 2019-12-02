class LineRenderer
{
  ArrayList<PVector> points;
  color lineColor;
  float lineWidth;

  LineRenderer()
  {
    points = new ArrayList<PVector>();
    lineColor = color(255, 120);
    lineWidth = 1.0f;
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
      vertex(point.x, point.y + noise(point.x + millis()/10000000.0f*width, point.y)*20 + sin(millis()/500.0f * PI + point.x)* 10);
    }
    endShape(LINE);
    popStyle();
  }
}
