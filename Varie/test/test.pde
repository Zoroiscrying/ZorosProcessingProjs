HShape h1;

void setup() {
  size(800, 800, P3D);
  smooth();

  RG.init(this);
  h1 = new HShape("Song-01gr.svg");

  
} 


void draw() {
  background(255);
  translate(width/2, height/2);
  
  h1.show();
  h1.update();
  
}
