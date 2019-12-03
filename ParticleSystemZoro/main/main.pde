ParticleSystem ps;
RainParticleSystem whiteRain;
 
void setup() 
{
  size(1600, 900);
  ps = new ParticleSystem(new PVector(width/2, 50));
  whiteRain = new RainParticleSystem(1000, new PVector(3,5));
}

void draw() 
{
  //draw the mountain 
  background(0);
  ps.addParticle();
  ps.run();
  whiteRain.run();
}
