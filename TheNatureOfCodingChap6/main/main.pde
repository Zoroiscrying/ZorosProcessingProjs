
ArrayList<Seeker> seekers;
Path path;
FlowField ff;

Flock flock;
void setup()
{
  size(1280, 720);
  flock = new Flock();
  
  //seekers= new ArrayList<Seeker>();
  //ff = new FlowField(20);
  
  //for(int i = 0; i < 100; i++){
  //  seekers.add(new Seeker(random(width),random(height)));
  //}
  
  //path = new Path();
}

void draw()
{
  background(255);
  
 // for(Seeker element : seekers){
 //   element.seek(new PVector(mouseX, mouseY));
 //   element.separate(seekers);
 //   //element.follow(ff);
 //   element.update();
 //   element.display();
 // }

 // //ff.display();
 //// path.display();
  flock.run();
  
}


void mouseDragged(){
  //seekers.add(new Seeker(mouseX, mouseY));
  flock.addSeeker(new Seeker(mouseX, mouseY));
}
