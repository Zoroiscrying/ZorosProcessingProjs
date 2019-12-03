import geomerative.*;


class HShape {
  RShape R;
  ArrayList<HShape> groups;    // children
  PVector pos;
  float ang = 0;
  float scl = 1;


  HShape(String path) {
    this.R = RG.loadShape(path);
    this.R = RG.centerIn(this.R, g);
    this.groups = new ArrayList<HShape>();

    for (RShape gr : this.R.children) {
      groups.add(new HShape(gr));
    }

    println(this.R.countChildren());
  }

  HShape(RShape r_) {
    this.R = r_;
    this.pos = new PVector(0, 0, 0);
  }

  void update() {
    groups.get(0).rotateTo(PI/2, 0.1);
    groups.get(1).scaleTo(0.5, 0.1);
    groups.get(7).translateTo(new PVector(0, 0, 300), 0.1);
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
      rotate(this.ang);
      scale(this.scl);
      RG.shape(this.R);

      popStyle();
      popMatrix();
    }
  }

  private void scaleTo(float scl_, float percent) {
    this.scl = lerp(this.scl, scl_, percent);
  }

  private void rotateTo(float ang_, float percent) {
    this.ang = lerp(this.ang, ang_, percent);
  }

  private void translateTo(PVector pos_, float percent) {
    this.pos = this.pos.lerp(pos_, percent);
  }
}
