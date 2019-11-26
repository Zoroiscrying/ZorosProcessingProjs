import peasy.PeasyCam;

PeasyCam cam;
HShape h1;


void settings() {
  size(800, 800, P3D);
  smooth(4);
}

void setup() {
  frameRate(30);

  cam = new PeasyCam(this, 1000);

  RG.init(this);
 


  strokeWeight(3);

  h1 = new HShape1("Song-01gr.svg");
  //h1 = new HShape1("bot1.svg");
}

int index = 0;

void draw() {
  background(255);

  h1.update();
  h1.show();

  //println(h1.groups.get((index++)%45).getCenter());

  String txt_fps = String.format(getClass().getSimpleName()+ "   [size %d/%d]   [frame %d]   [fps %6.2f]", width, height, frameCount, frameRate);
  surface.setTitle(txt_fps);
}


void keyPressed(){
   if(keyCode == UP) h1.ChangeOneGroupScale(round(random(0,7)),random(0f,1f));
   if(keyCode == DOWN);

}
