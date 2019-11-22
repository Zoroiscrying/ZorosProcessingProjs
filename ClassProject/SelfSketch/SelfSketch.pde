//
float angle;
//
float angleVel = 40;
//
CustomParticle[] particles = new CustomParticle[200]; 
//
float circleR = height*8;
//
float targetCircleR = height*8;
//
int mainCol = 0;

void setup() {
  size(800, 600);
  background(255);
  //initialize particles in the background
  for (int i = 0; i < 200; i ++) {
    particles[i] = new CustomParticle(random(2, 4), random(2, 4));
  }
  angle = 0.0f;
}

void draw() {
  //background
  noStroke();
  fill(255-mainCol, 40);
  rect(0, 0, width, height);
  
  //calculate circle's radius (actually diameter)
  circleR = lerp(circleR, targetCircleR, 0.1f);
  //calculate angle velocity
  angleVel = lerp(angleVel, abs(mouseX-width/2)/5, 0.1);
  angle += PI * angleVel / 160;
  //println(angle);
  //change pivot value based on time.
  float pivot = 200 + 10 *sin(millis() * PI/4000);
  //draw background - snow - mountain - taichi.
  DrawBackground(angle, circleR);
  //darw self sketch, pass in a pivot argument.
  DrawSelf(pivot);
}


void DrawMountain(float magnitute, float grayscale, float Y, float seed) {
  float x = 0;
  float y = seed;
  float thisMountY = Y;
  noStroke();
  fill(grayscale, 100);
  //draw the mountain using noise function.
  beginShape();
  vertex(0, height);
  while (x < width) 
  {
    vertex(x, thisMountY + magnitute * noise(x/100.0f, y));
    x = x + 1;
  }    
  vertex(width, height);
  endShape();
}

void DrawBackground(float angle, float R) {
  //mountains
    for(int i = 0; i <5; i ++){
    float mountainY = 400.0f + 50.0f*i * sin(millis() * PI/8000);
    float grayScale = 150.0f + 15.0f * i;
    float seed = 1.0f + 1.0f * i;
    DrawMountain(50,grayScale,mountainY,seed);
  }
  
  //taichi !
  float angleRad = radians(angle);
  //background(255, 10);
  fill(0, 255);
  noStroke();
  ellipse(width/2, height/2, R, R);
  fill(255, 255);
  arc(width/2, height/2, R, R, PI+angleRad, PI+PI+angleRad);
  float posX = cos(angleRad) * R/4 + width/2;
  float posY = sin(angleRad) * R/4 + height/2;
  float posX2 = cos(angleRad + PI) * R/4 + width/2;
  float posY2= sin(angleRad + PI) * R/4 + height/2;
  noStroke();
  ellipseMode(CENTER);
  ellipse(posX, posY, R/2, R/2);
  fill(0, 255);
  ellipse(posX, posY, R/6, R/6);
  ellipse(posX2, posY2, R/2, R/2);
  fill(255, 255);
  ellipse(posX2, posY2, R/6, R/6);

  //draw particles - snow particles ^D^
  noStroke();
  fill(255, 50);

  for (int i = 1; i < 200; i ++) {
    particles[i].Update();
  }
  
  
}

void DrawSelf(float pivot) {
  DrawHead(pivot);
  DrawNose(pivot);
  DrawMouth(pivot);
  DrawHat(pivot);
  DrawCloth(pivot);
}

void DrawHead(float pivotY) {
  float headCenter = pivotY;
  stroke(mainCol);
  strokeWeight(5);
  noFill();
  line(width/2 - 63, headCenter - 20, width/2 - 60, headCenter+40);
  line(width/2 - 60, headCenter + 40, width/2 - 35, headCenter+80);

  line(width/2 + 63, headCenter - 20, width/2 + 60, headCenter+40);
  line(width/2 + 60, headCenter + 40, width/2 + 35, headCenter+80);

  curve
    (
    width/2 - 30, headCenter - 20, 
    width/2 - 35, headCenter + 80, 
    width/2 + 35, headCenter + 80, 
    width/2 + 30, headCenter - 20
    );
}


void DrawNose(float pivotY) {
  float noseTop = pivotY;
  stroke(mainCol);
  strokeWeight(5);
  noFill();
  //nose bottom
  arc(width/2, noseTop, 100, 100, PI/3+PI/9, 2*PI/3-PI/9);
  //nose line  
  line(width/2, noseTop, width/2, noseTop+50);
}

void DrawMouth(float pivotY) {
  stroke(mainCol);
  strokeWeight(5);
  noFill();
  float noseTop = pivotY;
  line(width/2 - 16, noseTop + 66, width/2+16, noseTop+66);
}

void DrawHat(float pivotY) {
  float noseTop = pivotY + 5;
  fill(150, 150, 150, 255);
  noStroke();
  ellipseMode(CENTER);
  ellipse(width/2, noseTop - 50, width/2, 130);
  beginShape();
  vertex(width/2-200, noseTop - 50);
  vertex(width/2+200, noseTop - 50);
  vertex(width/2, noseTop - 170);
  endShape();
}

void DrawCloth(float pivotY) {
  float noseTop = pivotY;
  stroke(mainCol);
  strokeWeight(5);
  fill(255, 255);
  noFill();
  beginShape();
  vertex(width/2-35, noseTop + 110);
  vertex(width/2 - 170, noseTop + 150);
  vertex( width/2 - 290, height);
  vertex( width/2 + 290, height);
  vertex(width/2 + 170, noseTop + 150);
  vertex(width/2+35, noseTop + 110);
  endShape();
}

void mouseClicked() {
  if (targetCircleR > height/2)
  {
    targetCircleR = height/16;
    mainCol = 255;
  } else 
  {
    targetCircleR = height*2;
    mainCol = 0;
  }
}
