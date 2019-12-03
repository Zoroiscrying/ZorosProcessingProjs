import geomerative.*;

RShape shp;

void setup(){
  size(800, 600);
  smooth();

  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);

  shp = RG.loadShape("Song-040.svg");
  shp = RG.centerIn(shp, g);
} 

void draw(){
  background(255);
  translate(mouseX, mouseY);
  RG.shape(shp);
}
