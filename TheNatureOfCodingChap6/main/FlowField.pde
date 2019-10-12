class FlowField{
  PVector[][] grid;
  int resolution;
  int cols,rows;
  
  FlowField(int r){
    resolution = r;
    
    cols = width/resolution;
    rows = height/resolution;
    grid = new PVector[cols][rows];
    
    this.init();
    
  }
  
  void init(){
    float xoff = 0;
    for(int i = 0;i<cols;i++){
      float yoff = 0;
      for(int j = 0; j < rows; j++){
        float theta = map(noise(xoff,yoff),0,1,0,TWO_PI);
        grid[i][j] = PVector.fromAngle(theta);
        yoff += 0.1f;
      }
      xoff += 0.1f;
    }
  }
  
  void display(){
    //text("DisplayFunction Called",10,10);
    for(int i = 0; i< cols ; i++)
    {
      for(int j = 0; j < rows; j++)
      {
        int posX = i * resolution + resolution/2;
        int posY = j * resolution + resolution/2;
        //line(0,0,posX,posY);
        pushMatrix();
        translate(posX,posY);
        PVector temp = grid[i][j].copy();
        stroke(0);
        //point(0,0);
        line(0,0,temp.x*10,temp.y*10);
        strokeWeight(3);
        point(temp.x * 10, temp.y * 10);
        strokeWeight(1);
        popMatrix();
      }
    }
  }
  
  PVector lookup(PVector lookup){
    int column = int(constrain(lookup.x/resolution,0,cols-1));
    int row = int(constrain(lookup.y/resolution,0,rows-1));
    return grid[column][row].get();
  }

}
