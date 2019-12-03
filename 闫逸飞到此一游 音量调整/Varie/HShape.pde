import geomerative.*;

class HShape {
  RShape R;
  ArrayList<HShape> groups;    // children
  ArrayList<PVector> points;
  PVector pos;
  PVector ang = new PVector(0, 0, 0);
  float scl = 1;
  float density = 1;
  PVector shapeColor;
  
  ArrayList<Float> targetScl;
  ArrayList<Float> targetDen;
  ArrayList<PVector> targetPos;
  ArrayList<PVector> targetRot;
  ArrayList<PVector> targetColors;
  
  ArrayList<PVector> presetColors;
  PVector HSBGroupColorFrom;
  PVector HSBGroupColorTo;
  
  //StopWatchTimer timer;
  //int passedTimeMillis = 0;
  //int nextExpandTime = 8;
  
  float lerpChangeSpeed = 0.1f;

  boolean isExpanding = false;
  boolean isMoving2next = true;

  int frameCountDelay = 50;
  int lastFrameCount = 0;

  HShape(String path, ArrayList<PVector> presetColors)
  {
        this.R = RG.loadShape(path);
    this.R = RG.centerIn(this.R, g);
    this.groups = new ArrayList<HShape>();
    //this.timer = new StopWatchTimer();
    for (RShape gr : this.R.children) {
      groups.add(new HShape(gr));
    }
    this.presetColors = presetColors;

    targetScl = new ArrayList<Float>();
    targetDen = new ArrayList<Float>();
    targetRot = new ArrayList<PVector>();
    targetPos = new ArrayList<PVector>();
    targetColors = new ArrayList<PVector>();

    int groupCount = this.groups.size();
    for (int i = 0; i < groupCount; i ++) {
      targetScl.add(0.5f);
      targetDen.add(0.5f);
      targetPos.add(new PVector(0, 0, 0));
      targetRot.add(new PVector(0, 0, 0));
      targetColors.add(new PVector(0,0,0));
    }


    InitOneGroup();

    timer.start();
    //println(this.R.countChildren());
    
  }

  HShape(String path, PVector HSBColorPresetFrom,PVector HSBColorPresetTo) {
    this.R = RG.loadShape(path);
    this.R = RG.centerIn(this.R, g);
    this.groups = new ArrayList<HShape>();
    //this.timer = new StopWatchTimer();
    for (RShape gr : this.R.children) {
      groups.add(new HShape(gr));
    }
    HSBGroupColorFrom = HSBColorPresetFrom;
    HSBGroupColorTo = HSBColorPresetTo;

    targetScl = new ArrayList<Float>();
    targetDen = new ArrayList<Float>();
    targetRot = new ArrayList<PVector>();
    targetPos = new ArrayList<PVector>();
    targetColors = new ArrayList<PVector>();

    int groupCount = this.groups.size();
    for (int i = 0; i < groupCount; i ++) {
      targetScl.add(0.5f);
      targetDen.add(0.5f);
      targetPos.add(new PVector(0, 0, 0));
      targetRot.add(new PVector(0, 0, 0));
      targetColors.add(new PVector(0,0,0));
    }


    InitOneGroup();

    timer.start();
    //println(this.R.countChildren());
  }


  HShape(RShape r_) {
    this.R = r_;
    this.pos = this.getCenter();
    this.points = this.getPoints();
  }

  public void ChangeOneGroupScale(int ind, float value) {
    targetScl.set(ind, value);
  }

  public void ChangeOneGroupRotate(int ind, PVector value) {
    targetRot.set(ind, value);
  }

  public void ChangeOneGroupDensity(int ind, float value) {
    targetDen.set(ind, value);
  }

  public void ChangeOneGroupPosition(int ind, PVector value) {
    if (!isExpanding)
      targetPos.set(ind, value);
  }
  public void ChangeOneGroupColor(int ind, PVector Color)
  {
    targetColors.set(ind, Color);
  }

  public void InitOneGroup() {
    for (HShape g : groups) {
      g.scl = random(1);
      g.ang = PVector.random3D().mult(TWO_PI);
      g.density = round(random(4));
      g.pos = PVector.random3D().mult(1000);
      g.shapeColor = new PVector(0,0,0);
    }
  }

  public void expand() {
    for (PVector t : targetPos) {
      t.set(new PVector(random(-2000, 2000), random(-2000, 2000), 800));
    }
    isExpanding = true;
    lastFrameCount = frameCount;
    isMoving2next = false;
  }


  public void back20() {
    //if (isExpanding)
    //  isExpanding = false;
    if(isExpanding)
      isExpanding = false;
  }




  void update() {
    for (int i = 0; i < groups.size(); i ++) {
      groups.get(i).translateTo(targetPos.get(i), lerpChangeSpeed);
      groups.get(i).scaleTo(targetScl.get(i), lerpChangeSpeed);
      groups.get(i).rotateTo(targetRot.get(i), lerpChangeSpeed);
      groups.get(i).densityTo(targetDen.get(i), lerpChangeSpeed);
      groups.get(i).colorTo(targetColors.get(i), lerpChangeSpeed );
    }

    run();

    //if (keyPressed) {
    //  expand();
    //}
    

// 8 19 26 43 52 65
    //if ((second() - startTime)%48 == 8
    //  || (second() - startTime)%48 == 16
    //  || (second() - startTime)%48 == 24
    //  || (second() - startTime)%48 == 32 
    //  || (second() - startTime)%48 == 40
    //  || (second() - startTime)%48 == 47) {
    //  expand();
    //}
    
    //if( (this.timer!=null) && this.timer.second() > 7)
    //{  
    //  expand();
    //  this.timer.start();
    //}
   
    

    if (frameCount >= frameCountDelay + lastFrameCount && !isMoving2next) {
      isMoving2next = true;
      MODE = (MODE+1)%6;
      if (MODE == 0) {
        //hshapes.clear();
        //hshapes.add(new HShape1("Song-06.svg"));
        //hshapes.add(new HShape1("Song-02.svg"));
        //hshapes.add(new HShape1("Song-03.svg"));
        //hshapes.add(new HShape1("Song-04.svg"));
        //hshapes.add(new HShape1("Song-05.svg"));
        //hshapes.add(new HShape1("Song-01.svg"));
      }
    }
  }

  void run() {
    
  }

  void show() {
    if (this.groups != null) {
      for (HShape gr : groups) {
        gr.show();
      }
    } else {
      pushMatrix();
      pushStyle();

      translate(this.pos.x, this.pos.y, this.pos.z);
      rotateX(this.ang.x);
      rotateY(this.ang.y);
      rotateZ(this.ang.z);
      scale(this.scl);

      // cause RG.shape() has set the position(x,y)
      translate(-this.pos.x, -this.pos.y);
      fill(this.shapeColor.x, this.shapeColor.y, this.shapeColor.z, 100);
      stroke(this.shapeColor.x, this.shapeColor.y, this.shapeColor.z, 100);
      //this.showSurface();
      //println(shapeColor);
      //stroke(0,0,0,100);
      this.showPoints();
      //this.showLines();

      popStyle();
      popMatrix();

      //this.showCenter();
    }
  }

  private void scaleTo(float scl_, float per) {
    this.scl = lerp(this.scl, scl_, per);
  }

  private void rotateTo(PVector ang_, float per) {
    this.ang = this.ang.lerp(ang_, per);
  }

  private void translateTo(PVector target, float per) {
    this.pos = this.pos.lerp(target, per);
  }

  private void densityTo(float val_, float per) {
    this.density = lerp(this.density, val_, per);
  }
  
  private void colorTo(PVector target, float per)
  {
    this.shapeColor = this.shapeColor.lerp(target, per);
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
    //beginShape();
    //for (PVector p : this.points) {
    //  vertex(p.x, p.y, p.z);
    //}
    //endShape();
  }

  private void showPoints() {
    if (this.points != null && this.density > 0)
      //for (PVector p : this.points)
      //  point(p.x, p.y, p.z);
      strokeWeight(6);
    for (float i=0; i<this.points.size(); i += 1+this.density) {
      PVector p = points.get((int)i);
      point(p.x, p.y, p.z);
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
    //1 2 3 4
  }
}
