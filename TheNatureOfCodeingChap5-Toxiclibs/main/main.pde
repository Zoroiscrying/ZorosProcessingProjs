import toxi.audio.*;
import toxi.color.*;
import toxi.color.theory.*;
import toxi.data.csv.*;
import toxi.data.feeds.*;
import toxi.data.feeds.util.*;
import toxi.doap.*;
import toxi.geom.*;
import toxi.geom.mesh.*;
import toxi.geom.mesh.subdiv.*;
import toxi.geom.mesh2d.*;
import toxi.geom.nurbs.*;
import toxi.image.util.*;
import toxi.math.*;
import toxi.math.conversion.*;
import toxi.math.noise.*;
import toxi.math.waves.*;
import toxi.music.*;
import toxi.music.scale.*;
import toxi.net.*;
import toxi.newmesh.*;
import toxi.nio.*;
import toxi.physics2d.*;
import toxi.physics2d.behaviors.*;
import toxi.physics2d.constraints.*;
import toxi.physics3d.*;
import toxi.physics3d.behaviors.*;
import toxi.physics3d.constraints.*;
import toxi.processing.*;
import toxi.sim.automata.*;
import toxi.sim.dla.*;
import toxi.sim.erosion.*;
import toxi.sim.fluids.*;
import toxi.sim.grayscott.*;
import toxi.util.*;
import toxi.util.datatypes.*;
import toxi.util.events.*;
import toxi.volume.*;

//Verlet Physics?
//Euler Intergration-Differentiation
//Intergration -- Acceleration -> velocity -> position
//Differentiation -- Position -> velocity -> acceleration
//Euler Intergration is: loc += vel && vel += acc
//it's very simple, while it's not what really happening in real world
//Verlet Intergration is: no velocity! Calculate the V via two positions
//
//In Toxiclibs:
//World = Verlet Physics
VerletPhysics2D vp = new VerletPhysics2D();
//Body = Particle
Particle p1;
Particle p2;
//Joint = Spring

void setup() {
  size(800, 600);
  background(255);
  
  //Intialize the physics
  vp = new VerletPhysics2D();
  vp.addBehavior(new GravityBehavior2D(new Vec2D(0,0.5)));
  
  //Set the world's bounding box
  vp.setWorldBounds(new Rect(0,0,width,height));
  
  //make two particles
  p1 = new Particle(new Vec2D(width/2,20));
  p2 = new Particle(new Vec2D(width/2+160,20));
  
  //lock one in place
  p1.lock();
  
  //make a spring connecting both particles
  VerletSpring2D spring = new VerletSpring2D(p1,p2,280,0.01);
  
  //Anything we make, we have to add into the physics world
  vp.addParticle(p1);
  vp.addParticle(p2);
  vp.addSpring(spring);
  
  
  
}

void draw() {
  background(255);
  
  //must update the physics of the world
  vp.update();
  
  p1.display();
  p2.display();
  
}
