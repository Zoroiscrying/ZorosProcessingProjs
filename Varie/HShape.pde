import geomerative.*;

class HShape {
  RShape R;
  ArrayList<HShape> groups;    // children
  ArrayList<PVector> points;
  ArrayList<PVector> stages;
  PVector pos;
  float ang = 0;
  float scl = 1;
  float density = 1;


  HShape(String path) {
    this.R = RG.loadShape(path);
    this.R = RG.centerIn(this.R, g);
    this.groups = new ArrayList<HShape>();

    for (RShape gr : this.R.children) {
      groups.add(new HShape(gr));
    }
    //points = this.getPoints();
  }

 // for every child gr shape, there will be points/R/pos.
  HShape(RShape r_) {
    this.R = r_;
    this.pos = this.getCenter();
    this.points = this.getPoints();
  }

  void update() {
    
  }
  
  //zoroiscrying
  public void ChangeOneGroupScale(int ind, float value) {
  }
  
  public void ChangeOneGroupRotate(int ind, float value) {
  }
  
  public void ChangeOneGroupDensity(int ind, float value) {
  }
  
  public void ChangeOneGroupPosition(int ind, PVector value) {
  }

  void show() {
    if (this.groups != null) 
    {
      for (HShape gr : groups) 
      {
        gr.show();
      }
    } 
    else 
    {
      pushMatrix();
      pushStyle();

      translate(this.pos.x, this.pos.y, this.pos.z);
      rotate(this.ang);
      scale(this.scl);

      // cause RG.shape() has set the position(x,y)   
      translate(-this.pos.x, -this.pos.y);

      
      this.showPoints();
      this.showLines();
      //this.showSurface();

      popStyle();
      popMatrix();

      //this.showCenter();
    }
  }

  private void scaleTo(float scl_, float per) {
    this.scl = lerp(this.scl, scl_, per);
  }

  private void rotateTo(float ang_, float per) {
    this.ang = lerp(this.ang, ang_, per);
  }

  private void translateTo(PVector target, float per) {
    this.pos = this.pos.lerp(target, per);
  }

  private void densityTo(float val_, float per) {
    this.density = lerp(this.density, val_, per);
  }

  private PVector getCenter() {
    RPoint p = this.R.getCenter();
    return new PVector(p.x, p.y, 0);
  }

  private ArrayList<PVector> getPoints() {
    if (this.points != null)
      this.points.clear();

    ArrayList<PVector> points = new ArrayList<PVector>(); 
    RPoint[] ps = this.R.getPoints();
    for (RPoint rp : ps) {
      points.add(new PVector(rp.x, rp.y, 0));
    }  
    return points;
  }

  private void setStepTo(float step) {
    RG.setPolygonizerStep(step);
  }

  private void showSurface() {
    RG.ignoreStyles(false);
    this.R.draw();
  }

  private void showLines() {
    noFill();
    RG.shape(this.R);
    beginShape();
    for (PVector p : this.points) {
      //println(p.x + "," + p.y + "," + p.z);
      vertex(p.x, p.y, p.z + 20.0f * sin(millis() * PI/1000f + p.x * 3.0f));
    }
    endShape();
  }

  private void showPoints() {
    if (this.points != null && this.density > 0)
      //for (PVector p : this.points) 
      //  point(p.x, p.y, p.z);
      for (float i=0; i<this.points.size(); i += 1/this.density) 
      {
        PVector p = points.get((int)i);
        PVector randomP = new PVector(random(0f,4.0f),random(0f,4f),random(0.0f,4f));
        PVector result = PVector.add(p, randomP);
        point(result.x, result.y, result.z);
      }
  }

  private void showCenter() {
    pushStyle();
    strokeWeight(10);
    stroke(0, 200, 0);
    point(this.pos.x, this.pos.y, this.pos.z);
    popStyle();
  }

  private void initDensity() {
    //1 0.85 0.6 0.35
  }
}
