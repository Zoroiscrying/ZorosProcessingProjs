import java.util.Iterator;

class ParticleSystem{
  ArrayList<Particle> particles;
  PVector origin;

  ParticleSystem(){
    particles = new ArrayList<Particle>();
    origin = new PVector(random(width),random(height));
  }
  
  void addParticle(){
    particles.add(new Particle(origin));
  }
  
  void applyForce(PVector f){
    for(Particle p:particles){
      p.applyForce(f);
    }
  }
  
  void applyRepeller(Repeller r){
    for(Particle p: particles){
      PVector force = r.repel(p);
      p.applyForce(force);
    }
  }
  
  void run(){
    
    Iterator<Particle> it = 
      particles.iterator();
      while(it.hasNext())
      {
        Particle p = it.next();
        p.run();
        if (p.isDead()) 
        {
          it.remove();
        }
      }
  }
}
