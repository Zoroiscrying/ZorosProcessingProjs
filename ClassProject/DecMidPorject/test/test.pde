import geomerative.*;

RShape shp;
RShape polyshp;

void setup(){
  size(600, 600);
  smooth();
  // VERY IMPORTANT: Allways initialize the library before using it
  RG.init(this);
  shp = RG.loadShape("Song-03.svg");
  shp = RG.centerIn(shp, g, 100);
}

void draw(){
  background(255);

  // We decided the separation between the polygon points dependent of the mouseX
  float pointSeparation = map(constrain(sin(millis()*PI/4000)*50 + 125, 100, width-100), 100, width-100, 5, 200);
  println(pointSeparation);
  // We create the polygonized version
  RG.setPolygonizer(RG.UNIFORMLENGTH);
  RG.setPolygonizerLength(pointSeparation);

  polyshp = RG.polygonize(shp);

  // We move ourselves to the mouse position
  translate(width/2, height/2);
  // We draw the polygonized group with the SVG styles
  RG.shape(polyshp);
}
