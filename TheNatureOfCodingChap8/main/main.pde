ArrayList<KochLine> lines;

void setup(){
  size(800,800);
  background(0,0);
  smooth();
  
  lines = new ArrayList<KochLine>();
  
  PVector one = new PVector(width/4,height/4);
  PVector two = new PVector(width-width/4,height/4);
  PVector three = new PVector(width/4,height-height/4);
  PVector four = new PVector(width-width/4,height-height/4);
  lines.add(new KochLine(one,two));
  lines.add(new KochLine(two,four));
  lines.add(new KochLine(four,three));
  lines.add(new KochLine(three,one));
  
  for(int i = 0;i < 6;i++){
    generate();
  }
}

void draw(){
  background(255);
  
  for(KochLine l : lines){
    l.display();
  }
}

void keyPressed(){
  if(key == ' '){
   generate();
  }
}

void generate(){
    ArrayList next = new ArrayList<KochLine>();
    for(KochLine l : lines){
      
      
      next.add(new KochLine(l.KochAPoint(),l.KochBPoint()));
      next.add(new KochLine(l.KochBPoint(),l.KochCPoint()));
      next.add(new KochLine(l.KochCPoint(),l.KochDPoint()));
      next.add(new KochLine(l.KochDPoint(),l.KochEPoint()));
    }
    lines = next;
}

void drawCircle(float x, float y, float radius){
  stroke(0);
  noFill();
  ellipse(x,y,radius,radius);
  if(radius>8.0f){
    drawCircle(x+(radius/2f),y,radius/2f);
    drawCircle(x-(radius/2f),y,radius/2f);
    drawCircle(x, y+(radius/2f),radius/2f);
    drawCircle(x, y-(radius/2f),radius/2f);
  }
}

void drawCantor(float length, float x, float y){
  stroke(0);
  line(x-length/2,y,x+length/2,y);
  if(length > 2.0f){
    drawCantor(length/3,x-length/3,y+length/3);
    drawCantor(length/3,x+length/3,y+length/3);
  }
}
