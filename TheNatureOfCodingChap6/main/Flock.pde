class Flock{
ArrayList<Seeker> seekers;

Flock(){
  seekers = new ArrayList<Seeker>();
}

void run(){

  for(Seeker s : seekers){
    s.flock(seekers);
    s.update();
    s.display();
  }
}

void addSeeker(Seeker s){
  seekers.add(s);
}

}
