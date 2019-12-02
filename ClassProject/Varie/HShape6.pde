

//class HShape6 extends HShape {
//  ArrayList<HShape> butterflies;
//  ArrayList<PVector> bfTargetPos;
//  ArrayList<PVector> bfTargetRot;

//  HShape6(String path) {
//    //super(path);

//    this.butterflies = new ArrayList<HShape>();

//    for (RShape gr : this.R.children[1].children) {
//      butterflies.add(new HShape6(gr));
//    }

//    bfTargetPos = new ArrayList<PVector>();
//    bfTargetRot = new ArrayList<PVector>();

//    for (int i = 0; i < this.butterflies.size(); i ++) {
//      bfTargetPos.add(new PVector(0, 0, 0));
//      bfTargetRot.add(new PVector(0, 0, 0));
//    }

//    for (HShape g : butterflies) {
//      g.scl = random(1);
//      g.ang = PVector.random3D().mult(TWO_PI);
//      g.density = round(random(4));
//      g.pos = PVector.random3D().mult(1000);
//    }
//  }


//  HShape6(RShape r_) {
//    super(r_);
//  }


//  void update() {
//    println(butterflies.size());

//    for (int i = 0; i<3; i++) {
//      if (i==1) continue;
//      groups.get(i).translateTo(targetPos.get(i), lerpChangeSpeed);
//      groups.get(i).scaleTo(targetScl.get(i), lerpChangeSpeed);
//      groups.get(i).rotateTo(targetRot.get(i), lerpChangeSpeed);
//      groups.get(i).densityTo(targetDen.get(i), lerpChangeSpeed);
//    }

//    for (int i = 0; i<butterflies.size(); i++) {
//      butterflies.get(i).translateTo(bfTargetPos.get(i), lerpChangeSpeed);
//      butterflies.get(i).rotateTo(bfTargetRot.get(i), lerpChangeSpeed);
//    }


//    run();

//    if (keyPressed) {
//      expand();
//    }

//    if (frameCount >= frameCountDelay + lastFrameCount && !isMoving2next) {
//      isMoving2next = true;
//      MODE++;
//    }
//  }






//  void run() {
//    ChangeOneGroupPosition(
//      round(random(0, this.groups.size()-1))
//      , new PVector(0, 0, BAND));


//    //h1.ChangeOneGroupPosition(0,new PVector(0,0, BAND));


//    ChangeOneGroupRotate(
//      round(random(0, this.groups.size()-1))
//      , new PVector(BAND/400, 0, 0));


//    ChangeOneGroupDensity(
//      round(random(0, this.groups.size()-1))
//      , (random(1)>0.25) ?abs(sin(BAND)) :abs(BAND*0.2));




//    ChangeOneGroupPosition(
//      round(random(0, this.butterflies.size()-1))
//      , new PVector(0, 0, BAND));

//    ChangeOneGroupRotate(
//      round(random(0, this.butterflies.size()-1))
//      , new PVector(BAND/400, 0, 0));
//  }


//  public void ChangeOneGroupRotate(int ind, PVector value) {
//    bfTargetRot.set(ind, value);
//  }

//  public void ChangeOneGroupPosition(int ind, PVector value) {
//    if (!isExpanding)
//      bfTargetPos.set(ind, value);
//  }

//  void show() {
//    if (this.groups != null) {
//      groups.get(0).show();
//      groups.get(1).show();
//      groups.get(2).show();
//    } else {
//      if (this.butterflies != null) {
//        for (HShape gr : butterflies) {
//          gr.show();
//        }
//      } else {

//        pushMatrix();
//        pushStyle();

//        translate(this.pos.x, this.pos.y, this.pos.z);
//        rotateX(this.ang.x);
//        rotateY(this.ang.y);
//        rotateZ(this.ang.z);
//        scale(this.scl);

//        // cause RG.shape() has set the position(x,y)
//        translate(-this.pos.x, -this.pos.y);

//        this.showPoints();
//        //this.showLines();
//        //this.showSurface();

//        popStyle();
//        popMatrix();

//        //this.showCenter();
//      }
//    }
//  }


//  private void showPoints() {
//    if (this.points != null && this.density > 0)
//      //for (PVector p : this.points)
//      //  point(p.x, p.y, p.z);
//      strokeWeight(6);
//    for (float i=0; i<this.points.size(); i += 1+this.density) {
//      PVector p = points.get((int)i);
//      point(p.x, p.y, p.z);
//    }
//  }
  
//}
