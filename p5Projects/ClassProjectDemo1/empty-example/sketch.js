//The sin wave movment of balls.

var circleRadius = 100.0;
var circleCenterX;
var circleCenterY;
var innerCircleNums = 22;
var circleNums = 60;

var beginColor;
var endColor;

function setup() {
  createCanvas(800, 600);
  background(0);
  // put setup code here
  beginColor = createVector(100, 104, 0);
  endColor = createVector(100, 104, 100);
}

function draw() {
  noStroke();
  fill(255,80);
  rect(0,0,width,height);

  // beginShape();
  // for(i = 0;i < circleNums; i ++)
  // {
  //   angle = 2.0* PI / circleNums * i;
  //   //+ millis()/180.0f * PI / 50 ;
  //   sinValue = sin(millis()/180.0 * PI / 8 + angle * 3);
  //   rPlus = sinValue * 150 -20;
  //   circleCenterX = width/2 + cos(angle) * (circleRadius + rPlus + 300);
  //   circleCenterY = height/2 + sin(angle) * (circleRadius + rPlus + 300);
  //   fill(255/circleNums * i, 255 - 150/circleNums * i,200 ,255);
  //   noStroke();
    
  //   fill(90,90,90,40);
  //   vertex(circleCenterX,circleCenterY);
  // }
  // endShape();
  
  
  // beginShape();
  // for(i = 0;i < circleNums; i ++)
  // {
  //   angle = 2.0* PI / circleNums * i;
  //   //+ millis()/180.0f * PI / 50 ;
  //   sinValue = sin(millis()/180.0 * PI / 8 + angle * 3 + PI/2);
  //   rPlus = sinValue * 150 -20;
  //   circleCenterX = width/2 + cos(angle) * (circleRadius + rPlus + 200);
  //   circleCenterY = height/2 + sin(angle) * (circleRadius + rPlus + 200);
  //   fill(255/circleNums * i, 255 - 150/circleNums * i,200 ,255);
  //   noStroke();
    
  //   fill(90,90,90,40);
  //   vertex(circleCenterX,circleCenterY);
  // }
  // endShape();

  beginColor.set(0, 150, 255);
  endColor.set(255, 150, 0);
  for(i = 0;i < innerCircleNums; i ++){
    var angle = 2.0* PI / innerCircleNums * i;
    //+ millis()/180.0f * PI / 50 ;
    var sinValue = sin(millis()/180.0 * PI / 8 + angle * 3);
    var rPlus = sinValue * 150 -20;
    var circleCenterX = width/2 + cos(angle) * (circleRadius + rPlus);
    var circleCenterY = height/2 + sin(angle) * (circleRadius + rPlus);
    let colorBetween = p5.Vector.sub(endColor,beginColor);
    var thisColorVec = beginColor.add(colorBetween.mult(1.0/innerCircleNums * (i+1)));
    fill(thisColorVec.x,thisColorVec.y,thisColorVec.z,150);
    noStroke();
    circle(circleCenterX,circleCenterY,20);
    
    fill(250,220,150,255);
  }

}