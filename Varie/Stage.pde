class Stage {
  ArrayList<HShape> gs;
  float speed = 0.1;
  float time;
  boolean isOver;

  Stage(ArrayList<HShape> groups_) {
    gs = groups_;
  }

  void init() {
    time = 100;
    isOver = false;
  }

  void update() {
    if(time-- < 0) isOver = true;
  }


  void initDensity(float[] d) {
    for (int i=0; i<this.gs.size(); i++) {
      gs.get(i).density = d[i];
    }
  }

  private void updateScale(float[] s) {
    for (int i=0; i<this.gs.size(); i++) {
      gs.get(i).scaleTo(s[i], speed);
    }
  }

  private void updateRotate(float[] r) {
    for (int i=0; i<this.gs.size(); i++) {
      gs.get(i).rotateTo(r[i], speed);
    }
  }

  private void updateTranslate(PVector[] t) {
    for (int i=0; i<this.gs.size(); i++) {
      gs.get(i).translateTo(t[i], speed);
    }
  }
  
}
