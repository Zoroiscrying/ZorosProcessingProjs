//粒子数
int num = 2000;
//存放粒子的数组
Particle[] particles = new Particle[num];

void setup() {
  size(1600, 900, P3D);
  noStroke();
  //迭代生成所有粒子
  for (int i=0; i<num; i++) {
    PVector loc = new PVector(random(width*1.2), random(height));
    float rad = random(TWO_PI);
    PVector speed = new PVector(0, 0);
    PVector acc = new PVector(cos(rad), sin(rad));
    particles[i]= new Particle(loc, speed, acc);
  }
}

void draw() {
  //半透明背景
  fill(0, 15);
  noStroke();
  rect(0, 0, width, height);
  fill(255, 155);  
  //遍历数组，每一个粒子都run起来
  for (int i=0; i<particles.length; i++) {
    particles[i].run();
  }
}

//粒子数据类型
class Particle {
  //属性
  PVector loc, speed, acc;
  color col;
  float colA;
  float colR;
  float colG;
  float colB;
  float rad;
  float maxVel = 1.0;
  float w = 500.0;
  float h = 500.0;
  float f = 1000.0;
  //构造函数
  Particle(PVector _loc, PVector _speed, PVector _acc) {
    loc   = _loc;
    speed = _speed;
    acc   = _acc;
    colR = random(0,255);
    colG = random(0,255);
    colB = random(0,255);
    colA = random(0,255);
  }

  Particle() {
    loc = new PVector(random(width*1.2), random(height));
    rad = random(TWO_PI);
    colR = random(0,255);
    speed = new PVector(0, 0);
    acc = new PVector(cos(rad), sin(rad));
  }

  //运动，渲染，越界函数打包在一个函数里
  void run() {
    move();
    checkEdges();
    render();
  }
  //运动函数
  void move() {
    float deg = 360.0*noise(
      loc.x/w, 
      loc.y/h, 
      millis()/10000.0);

    rad=radians(deg);

    acc.set(cos(rad), sin(rad));

    speed.add(acc);
    if (speed.magSq()>maxVel) {
      speed.normalize();
      speed.mult(maxVel);
    }
    loc.add(speed);
  }
  //超出窗口就随机一个窗口内位置
  void checkEdges() {
    if (loc.x<0-0.2*width || loc.x>width*1.2 || loc.y<0 || loc.y>height) {    
      loc.x = random(width,width*1.2);
      loc.y = random(height);
    }
  }
  //渲染
  void render() {
    fill(colR,colG,colB,155);
    ellipse(loc.x, loc.y, 3, 3);
  }
}

void keyPressed()
{
  if(key == TAB) saveFrame("screen.png");
}
