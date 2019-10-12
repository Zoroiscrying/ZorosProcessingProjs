//The sin wave movment of balls.

float circleRadius = 250;
float circleCenterX;
float circleCenterY;
int innerCircleNums = 22;
int circleNums = 60;

void setup(){
  size(1600,900);
  background(255);
}

void draw(){
  noStroke();
  fill(255,80);
  rect(0,0,width,height);
  
  //  beginShape();
  //for(int i = 0;i < circleNums; i ++)
  //{
  //  float angle = 2* PI / circleNums * i;
  //  //+ millis()/180.0f * PI / 50 ;
  //  float sinValue = sin(millis()/180.0f * PI / 8 + angle * 3);
  //  float rPlus = sinValue * 150 -20;
  //  circleCenterX = width/2 + cos(angle) * (circleRadius + rPlus + 300);
  //  circleCenterY = height/2 + sin(angle) * (circleRadius + rPlus + 300);
  //  fill(255/circleNums * i, 255 - 150/circleNums * i,200 ,255);
  //  noStroke();
    
  //  fill(90,90,90,40);
  //  vertex(circleCenterX,circleCenterY);
  //}
  //endShape();
  
  
  //beginShape();
  //for(int i = 0;i < circleNums; i ++)
  //{
  //  float angle = 2* PI / circleNums * i;
  //  //+ millis()/180.0f * PI / 50 ;
  //  float sinValue = sin(millis()/180.0f * PI / 8 + angle * 3 + PI/2);
  //  float rPlus = sinValue * 150 -20;
  //  circleCenterX = width/2 + cos(angle) * (circleRadius + rPlus + 200);
  //  circleCenterY = height/2 + sin(angle) * (circleRadius + rPlus + 200);
  //  fill(255/circleNums * i, 255 - 150/circleNums * i,200 ,255);
  //  noStroke();
    
  //  fill(90,90,90,40);
  //  vertex(circleCenterX,circleCenterY);
  //}
  //endShape();
  
  circleRadius = 250.0f * sin(millis()/180.0f * PI / 8);
  if(circleRadius > 0) fill(255,255,0,200);
  else fill(255,0,255,200);
  noStroke();
  circle(width/2,height/2,circleRadius*4);
  //
  for(int i = 0;i < innerCircleNums; i ++){
    float angle = 2* PI / innerCircleNums * i;
    //+ millis()/180.0f * PI / 50 ;
    float sinValue = sin(millis()/180.0f * PI / 8 + angle * 3);
    float rPlus = sinValue * 150 -20;
    circleCenterX = width/2 + cos(angle) * (circleRadius + rPlus);
    circleCenterY = height/2 + sin(angle) * (circleRadius + rPlus);
    fill(255/circleNums * i, 255 - 150/innerCircleNums * i,200 ,255);
    noStroke();
    circle(circleCenterX,circleCenterY,20);
    
    fill(250,220,150,255);
  }
  
}
