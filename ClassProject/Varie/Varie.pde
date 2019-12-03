import peasy.PeasyCam;

PeasyCam cam;
HShape currentH;
MusicProcess MP;
HFLeap HFL;

ArrayList<HShape> hshapes;
float startTime = 0;
float worldRX = 0;

StopWatchTimer timer;
int passedTimeMillis = 0;
int nextExpandTime = 16;

void settings() 
{
  size(800, 800, P3D);
  //fullScreen(P3D);
  smooth(8);
}

void setup() {
  frameRate(30);

  colorMode(HSB, 360, 100, 100, 100);

  cam = new PeasyCam(this, 600);
  //leap = new LeapMotion(this);
  MP = new MusicProcess();
  timer = new StopWatchTimer();

  RG.init(this);
  RG.setPolygonizerStep(RG.UNIFORMSTEP);

  hshapes = new ArrayList<HShape>();
  
  ArrayList<PVector> shapeColorPresets1 = new ArrayList<PVector>();
  ArrayList<PVector> shapeColorPresets2 = new ArrayList<PVector>();
  ArrayList<PVector> shapeColorPresets3 = new ArrayList<PVector>();
  ArrayList<PVector> shapeColorPresets4 = new ArrayList<PVector>();
  ArrayList<PVector> shapeColorPresets5 = new ArrayList<PVector>();
  ArrayList<PVector> shapeColorPresets6 = new ArrayList<PVector>();
  {// control the next coming up group's color presets
    shapeColorPresets1.add(new PVector(360, 100, 100));
    shapeColorPresets1.add(new PVector(360, 100, 100));
    shapeColorPresets1.add(new PVector(360, 100, 60));
    shapeColorPresets1.add(new PVector(360, 50, 50));
    shapeColorPresets1.add(new PVector(360, 50, 50));
  }
  hshapes.add(new HShape1("Song-01.svg", shapeColorPresets1));
  
  {// control the next coming up group's color presets
    shapeColorPresets2.add(new PVector(320, 96, 85));
    shapeColorPresets2.add(new PVector(46, 30, 100));
    shapeColorPresets2.add(new PVector(323, 100, 61));
    shapeColorPresets2.add(new PVector(131, 12, 93));
  }
  hshapes.add(new HShape1("Song-02.svg", shapeColorPresets2));
  
  {// control the next coming up group's color presets
    shapeColorPresets3.add(new PVector(201, 100, 100));
    shapeColorPresets3.add(new PVector(10, 100, 100));
    shapeColorPresets3.add(new PVector(359, 50, 60));
    shapeColorPresets3.add(new PVector(100, 50, 50));
  }
  hshapes.add(new HShape1("Song-03.svg",shapeColorPresets3));
  
  {// control the next coming up group's color presets
    shapeColorPresets4.add(new PVector(201, 100, 100));
    shapeColorPresets4.add(new PVector(10, 100, 100));
    shapeColorPresets4.add(new PVector(359, 50, 60));
    shapeColorPresets4.add(new PVector(100, 50, 50));
  }
  hshapes.add(new HShape1("Song-04.svg", shapeColorPresets4));
  
  {// control the next coming up group's color presets
    shapeColorPresets5.add(new PVector(201, 100, 100));
    shapeColorPresets5.add(new PVector(10, 100, 100));
    shapeColorPresets5.add(new PVector(359, 50, 60));
    shapeColorPresets5.add(new PVector(100, 50, 50));
  }
  hshapes.add(new HShape1("Song-05.svg",shapeColorPresets5));
  
  
  { // control the next coming up group's color presets
    shapeColorPresets6.add(new PVector(201, 100, 100));
    shapeColorPresets6.add(new PVector(10, 100, 100));
    shapeColorPresets6.add(new PVector(359, 50, 60));
    shapeColorPresets6.add(new PVector(100, 50, 50));
  }
  hshapes.add(new HShape1("Song-06.svg",shapeColorPresets6));

  HFL = new HFLeap();
  timer.start();
}


float hue;


float RX = 0;
float RY = 0;
float RZ = 0;
float TZ = 0;


float BAND = 0;
float BANDNormalized = 0;




void draw() {
  background(360);
  
  HFL.update();
  
  
  TZ = map(HFL.handPos.z, -1, 1, 1000, -1000);
  translate(0, 0, TZ);
  //rotateZ(HALF_PI + radians(HFL.handPitch));
  rotateY(radians(HFL.handYaw));
  //rotateX(HALF_PI + radians(HFL.handRoll));
  //RZ+=0.01;
  this.passedTimeMillis += timer.deltaTime();
  //println(this.passedTimeMillis / 1000 + "Next Expand:" + this.nextExpandTime);
  
  if (this.passedTimeMillis / 1000 >= this.nextExpandTime) 
  {
    this.nextExpandTime += 18;
    currentH.expand();
    hshapes.get((MODE+1)%6).back20();
  }
  
  MP.update();
  BANDNormalized = sin(MP.band);
  BAND = BANDNormalized*160;
  
  //hue = (hue+MP.freq)%360;
  //stroke(hue, 100, 100);
  //scale(hue/360);
  if (MODE <= hshapes.size()-1) {
    currentH = hshapes.get(MODE);
    //println(MODE);
    currentH.update();
    currentH.show();
  }
  
  //String txt_fps = String.format(" [frame %d]   [fps %6.2f]", frameCount, frameRate);
  //surface.setTitle(txt_fps);
  HFL.draw();
}
