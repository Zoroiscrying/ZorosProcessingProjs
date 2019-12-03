/*

class Visual0 extends Visual {

  RShape grp;
  RPoint[][] pointPaths;
  boolean ignoringStyles = false;
  float xmag, ymag, newYmag, newXmag = 0;

  void init() {
    RG.ignoreStyles(ignoringStyles);
    RG.setPolygonizer(RG.ADAPTATIVE);
    grp = RG.loadShape("2.svg");
    grp.centerIn(g, 100, 1, 1);
    colorMode(HSB);

  }

  void reset() {
  }

  void update() {

    RG.setPolygonizer(RG.UNIFORMLENGTH);
    RG.setPolygonizerLength(map(mouseY, 0, render.height, 3, 200));
    
    
    pointPaths = grp.getPointsInPaths();
  }


  void show() {
    render.background(0);
    render.noFill();

    for (int i = 0; i<pointPaths.length; i++) {
      if (pointPaths[i] != null) {
        render.beginShape();
        for (int j = 0; j<pointPaths[i].length; j++) {
          render.strokeWeight(random(2, 5));
          float z = 100*noise(pointPaths[i][j].x, pointPaths[i][j].y, frameCount*0.051);
          //render.translate(0,0,z);
          render.stroke(255*noise(z), 255, random(50, 255));
          render.vertex(pointPaths[i][j].x, pointPaths[i][j].y, z);
          //render.point(pointPaths[i][j].x, pointPaths[i][j].y, z);
        }
        render.endShape();
      }
    }
  }
} 


*/
