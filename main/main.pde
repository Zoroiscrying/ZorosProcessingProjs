Cell cell;



void setup(){
  size(800,600);
  cell = new Cell();
  
}

void draw(){
  //background(255);
  cell.generate();
  cell.display();

}
