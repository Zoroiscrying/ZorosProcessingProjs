import shiffman.box2d.*;
import org.jbox2d.collision.shapes.*;
import org.jbox2d.common.*; // Vec2
import org.jbox2d.dynamics.*;

//Changed to Box2DProcessing
Box2DProcessing box2d;
Box box;
Boundary boundary;

// A list we'll use to track fixed objects
ArrayList<Boundary> boundaries;
// A list for all of our rectangles
ArrayList<Box> boxes;

void setup() {
  size(1280, 720);
  background(150);
  box2d = new Box2DProcessing(this);
  box2d.createWorld();

  boundary = new Boundary(width/2,height,width/2,10);

  box = new Box();
}


void draw() {
  background(255);
  
  // We must always step through time!
  box2d.step();

  box.display();
  boundary.display();
}
