//The sin wave movment of balls.
float circleRadius = 250;
float circleCenterX;
float circleCenterY;
int innerCircleNums = 32;
int circleNums = 60;
float targetR = 250;

void setup(){
  size(1600,900);
  background(255);
}

void draw(){
  noStroke();
  fill(255,80);
  rect(0,0,width,height);
  
  //circleRadius = lerp(circleRadius,250.0f * (mouseX-width/2)/width*8,0.01);
  circleRadius = lerp(circleRadius,targetR,0.05);
  //circleRadius = 250.0f * sin(millis()/180.0f * PI / 8);
  if(circleRadius > 0) fill(255,255,0,200);
  else fill(255,0,255,200);
  noStroke();
  //circle(width/2,height/2,circleRadius*4);
  //
  for(int i = 0;i < innerCircleNums; i ++)
  {
    float angle = 2* PI / innerCircleNums * i;
    //+ millis()/180.0f * PI / 50 ;
    float sinValue = sin(millis()/180.0f * PI / 8 + angle * 3);
    float rPlus = sinValue * 150 - 20;
    circleCenterX = width/2 + cos(angle) * (circleRadius + rPlus);
    circleCenterY = height/2 + sin(angle) * (circleRadius + rPlus);
    fill(255/circleNums * i, 255 - 150/innerCircleNums * i,200 ,255);
    noStroke();
    circle(circleCenterX,circleCenterY,abs(20*rPlus/130)+20);
    
    fill(250,220,150,255);
  }
}

void mousePressed(){
  if(targetR >= 250) 
{
  targetR = -100;
  innerCircleNums = 36;
}
  else {
  targetR = 300;
  innerCircleNums = 32;
  
}
}
