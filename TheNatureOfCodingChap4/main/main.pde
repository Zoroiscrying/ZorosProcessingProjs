ParticleSystem ps;
Repeller repeller;
void setup() {
    size(1280,720);
    ps = new ParticleSystem();
    repeller = new Repeller(width/2,height/2);
}

void draw() {
    background(255, 255);
    //PVector velocity = new PVector(0,-0.1f);
    //PVector wind = new PVector(0.1f,0);
    //ps.applyForce(velocity);
    //ps.applyForce(wind);
    ps.applyRepeller(repeller);
    ps.run();
    ps.addParticle();
    
    repeller.display();
  }
