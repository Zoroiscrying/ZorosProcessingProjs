float angle;
float angleVel = 40;
CustomParticle[] particles = new CustomParticle[100]; 

void setup() {
  size(800, 600);
  background(255);
  
  for(int i = 0; i < 100; i ++){
    particles[i] = new CustomParticle(random(0,2),random(0,2));
  }
  
}

void draw() {
  angleVel = lerp(angleVel, mouseX/50+20 ,0.1);
  angle = millis() * PI / angleVel;
  DrawBackground(angle);
  DrawHair(200);
  DrawHead(200);
  DrawNose(200);
  DrawMouth(200);
  DrawHat(200);
  DrawHair(200);
  DrawCloth(200);
}

void DrawHead(float pivotY) {
  float headCenter = pivotY;
  stroke(0);
  strokeWeight(5);
  noFill();
  line(width/2 - 63, headCenter - 20, width/2 - 60, headCenter+40);
  line(width/2 - 60, headCenter + 40, width/2 - 35, headCenter+80);

  line(width/2 + 63, headCenter - 20, width/2 + 60, headCenter+40);
  line(width/2 + 60, headCenter + 40, width/2 + 35, headCenter+80);

  curve
    (
    width/2 - 30, headCenter - 20, 
    width/2 - 35, headCenter+80, 
    width/2 + 35, headCenter+80, 
    width/2 + 30, headCenter-20
    );
}

void DrawBackground(float angle) {
  float angleRad = radians(angle);
  background(255,10);
  fill(0,255);
  noStroke();
  ellipse(width/2,height/2,height,height);
  fill(255,255);
  arc(width/2,height/2,height,height,PI+angleRad,PI+PI+angleRad);
  float posX = cos(angleRad) * height/4 + width/2;
  float posY = sin(angleRad) * height/4 + height/2;
  float posX2 = cos(angleRad + PI) * height/4 + width/2;
  float posY2= sin(angleRad + PI) * height/4 + height/2;
  noStroke();
  ellipseMode(CENTER);
  ellipse(posX,posY,height/2,height/2);
  fill(0,255);
  ellipse(posX,posY,height/6,height/6);
  ellipse(posX2,posY2,height/2,height/2);
  fill(255,255);
  ellipse(posX2,posY2,height/6,height/6);
  
  noStroke();
  fill(128,255);
    
  for(int i = 1; i < 100; i ++){
    particles[i].Update();
  }
  
}

void DrawNose(float pivotY) {
  float noseTop = pivotY;
  stroke(0);
  strokeWeight(5);
  noFill();
  //nose bottom
  arc(width/2, noseTop, 100, 100, PI/3+PI/9, 2*PI/3-PI/9);
  //nose line
  line(width/2, noseTop, width/2, noseTop+50);
}

void DrawMouth(float pivotY) {
  stroke(0);
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

void DrawHair(float pivotY) {
  float noseTop =pivotY;
  //Floating Hair!
}

void DrawCloth(float pivotY) {
  float noseTop = pivotY;
  stroke(0);
  strokeWeight(5);
  fill(255,255);
  noFill();
  beginShape();
  //vertex(width/2 - 35, noseTop+80);
  vertex(width/2-35, noseTop + 110);
  vertex(width/2 - 170, noseTop + 150);
  vertex( width/2 - 290, height);
  vertex( width/2 + 290, height);
  vertex(width/2 + 170, noseTop + 150);
  vertex(width/2+35, noseTop + 110);
  //vertex(width/2 + 35, noseTop+80);
  endShape();
}
