class HShape1 extends HShape {

  HShape1(String path) {
    super(path);
    this.initDensity();
  }

  void update() {
    
    
    for(int i=0; i<8; i++){
      groups.get(i).translateTo(new PVector(0,0,i*50), 0.1);
    }
    

    groups.get(0).densityTo(1, 0.1);
    groups.get(1).densityTo(1, 0.1);
    groups.get(2).densityTo(5, 0.1);
    groups.get(4).densityTo(1, 0.1);
    groups.get(6).densityTo(1, 0.1);

    groups.get(1).scaleTo(0.755, 0.1);
    groups.get(1).rotateTo(-PI/6, 0.1);

    groups.get(1).scaleTo(0.635, 0.05);
    groups.get(1).rotateTo(-PI/3, 0.05);


    groups.get(5).scaleTo(0.7, 0.05);
    groups.get(5).rotateTo(PI/3, 0.05);
  }

  private void initDensity() {
    this.groups.get(0).density = 0.5;
    this.groups.get(1).density = 0.8;
    this.groups.get(2).density = 1;
    this.groups.get(3).density = 0;
    this.groups.get(4).density = 0.5;
    this.groups.get(5).density = 0.1;
    this.groups.get(6).density = 0.6;
    this.groups.get(7).density = 0;
  }
}
