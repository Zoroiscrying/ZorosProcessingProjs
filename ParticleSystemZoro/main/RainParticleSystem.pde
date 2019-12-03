class RainParticleSystem
{
  ArrayList<Particle> particles;
  color rainColor;
  PVector particleInitVelocity;

  RainParticleSystem(int particleNum, PVector initVel) 
  {
    this.particleInitVelocity = initVel.copy();
    particles = new ArrayList<Particle>();
    rainColor = color(128,200);
    for(int i = 0; i < particleNum; i++) addParticle();
  }

  void addParticle() {
    Particle newParticle = new Particle( RandomLocationOutsideWindow() ,true, rainColor);
    newParticle.velocity = particleInitVelocity.copy();
    particles.add(newParticle);
  }
  
  PVector RandomLocationOutsideWindow(){
    PVector newLocation = new PVector(random(-100,width),0 - random(0,100));
    return newLocation.copy();
  }

  void run() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run();
      if (p.isOutSideOBottomWindow()) {
        p.reset(RandomLocationOutsideWindow(), particleInitVelocity);
      }
    }
  }
}
