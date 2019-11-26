class HShape1 extends HShape 
{

  //for every group we store 4 values to determine their movements.
  //they are: density rotate scale and translation values
  ArrayList<Float> scales;
  ArrayList<Float> densities;
  ArrayList<PVector> positions;
  ArrayList<Float> rotations;
  float lerpChangeSpeed = 0.1f;
  int groupCount;
  boolean showPoints = false;


  HShape1(String path) {
    super(path);
    this.initDensity();
    this.Initialize();
  }

  private void Initialize()
  {
    scales = new ArrayList<Float>();
    densities = new ArrayList<Float>();
    rotations = new ArrayList<Float>();
    positions = new ArrayList<PVector>();
    groupCount = this.groups.size();
    for (int i = 0; i < groupCount; i ++)
    {
      scales.add(0.5f);
      densities.add(0.5f);
      positions.add(new PVector(0, 0, 0));
      rotations.add(0f);
    }
  }
 
  public void ChangeOneGroupScale(int ind, float value) {
    scales.set(ind, value);
  }
  
  public void ChangeOneGroupRotate(int ind, float value) {
    rotations.set(ind, value);
  }
  
  public void ChangeOneGroupDensity(int ind, float value) {
    densities.set(ind, value);
  }
  
  public void ChangeOneGroupPosition(int ind, PVector value) {
    positions.set(ind, value);
  }

  void update() {
    for (int i=0; i<8; i++) {
      groups.get(i).translateTo(new PVector(0, 0, i*50), 0.1);
    }

    for (int i = 0; i < groupCount; i ++)
    {
      groups.get(i).translateTo(positions.get(i), lerpChangeSpeed);
      groups.get(i).scaleTo(scales.get(i), lerpChangeSpeed);
      groups.get(i).rotateTo(rotations.get(i), lerpChangeSpeed);
      groups.get(i).densityTo(densities.get(i), lerpChangeSpeed);
    }
    
    //for(int i = 0; i < this.points.size(); i++)  
    //{
    //  float x = random(0f,1.0f);
    //  float y = random(0f, 1.0f);
    //  float z = random(0f, 1.0f);
    //  //points.set(i, new PVector(x,y,z));
    //}

    //groups.get(0).densityTo(1, 0.1);
    //groups.get(1).densityTo(1, 0.1);
    //groups.get(2).densityTo(5, 0.1);
    //groups.get(4).densityTo(1, 0.1);
    //groups.get(6).densityTo(1, 0.1);

    //groups.get(1).scaleTo(0.755, 0.1);
    //groups.get(1).rotateTo(-PI/6, 0.1);

    //groups.get(1).scaleTo(0.635, 0.05);
    //groups.get(1).rotateTo(-PI/3, 0.05);


    //groups.get(5).scaleTo(0.7, 0.05);
    //groups.get(5).rotateTo(PI/3, 0.05);
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
