class ChangingOne
{
  public StateMachine stateMachine;
  private ArrayList<State> states;
  private boolean mousePressedThisFrame = false;
  
  ChangingOne()
  {
    states = new ArrayList<State>();
    //this.states.add(new StageOne());
    //this.states.add(new StageTwo());
    this.states.add(new StageThree(60));
    stateMachine = new StateMachine(states.get(0));
  }
  
  //My idea on ONE.
  //Dot
  //Line - vertical / horizontal
  
  void NextStage()
  {
    if(states.size() > 0)
    {
      State firstStage = states.remove(0);
      states.add(firstStage);
      stateMachine.SwitchTo(states.get(0));      
    }
  }
  
  void Update()
  {
    if(mousePressed && !mousePressedThisFrame)
    {
      mousePressedThisFrame = true;
      if(stateMachine.currentState.canChange)
      {
        this.NextStage();
        print("Change To Next Stage.");
      }
    }
    
    this.stateMachine.Update();
    
    if(!mousePressed && mousePressedThisFrame == true)
    {
      mousePressedThisFrame = false;
    }
  }
  
}

class StageOne extends State
{
  //draw a dot around the screen.
  PVector pos;
  PVector size;
  color col;
  
  PVector targetPos;
  PVector targetSize;
  color targetCol;
  
  boolean start = false;
  
  StageOne()
  {
    
  }
  
  void Enter()
  {
    this.pos = new PVector(width/2,height/2);
    this.size = new PVector(1,1);
    this.col = color(255,255,255,255);
    this.targetPos = new PVector(width/2,height/2);
    this.targetSize = new PVector(10,10);
    this.targetCol = color(255,255,255,255);
    this.canChange = false;
  }
  
  void Update()
  {
    if(keyPressed)
    {
      canChange = true;
    }
    
    float theta = millis()*PI/2000;
    if(canChange)
    {
       targetSize = new PVector(10,10);
    }
    else
    {
       targetSize = new PVector(10+500*abs(sin(theta)), 10+500*abs(sin(theta))); 
    }
    
    this.pos = PVector.lerp(this.pos, this.targetPos, 0.1f);
    this.size = PVector.lerp(this.size, this.targetSize, 0.1f);
    this.col = round(lerp(float(col),float(targetCol),0.1f))%255;
    
    pushMatrix();
    pushStyle();
    
    noStroke();
    fill(col);
    translate(pos.x,pos.y);
    ellipseMode(CENTER);
    ellipse(0,0,size.x,size.y);
    
    popStyle();
    popMatrix();
  }
  
  void Exit()
  {
    
  }
}

class StageTwo extends State
{
  float cellSize;
  float maxSize;
  float horiNum;
  float vertNum;
  PVector[] posArray;
  PVector[] targetArray;
  
  void Enter(){
    cellSize = 20;
    maxSize = cellSize;
    CalculateNums();
    posArray = new PVector[round(horiNum * vertNum)];
    targetArray = new PVector[round(horiNum * vertNum)];
    InitPoses();
    canChange = false;
  }
  
  void CalculateNums()
  {
    horiNum = width/cellSize;
    vertNum = height/cellSize;
  }
  
  void InitPoses()
  {
    for(int i = 0; i < horiNum ; i ++)
    {
      for(int j = 0; j < vertNum; j ++)
      {
        float posX = i * cellSize + cellSize/2;
        float posY = j * cellSize + cellSize/2;
        //println(posX + "," + posY);
        posArray[i + j * (round(horiNum))] = new PVector(width/2, height/2);
        targetArray[i + j * round(horiNum)] = new PVector(posX, posY);
      }
    }
  }
  
  void DrawDots()
  {

    for(int i = 0; i < horiNum ; i ++)
    {
      for(int j = 0; j < vertNum; j ++)
      {
        float noiseValue = noise(i,j); 
        posArray[i + j * (round(horiNum))] = 
        PVector.lerp(posArray[i + j * (round(horiNum))],
                     targetArray[i + j * (round(horiNum))], 
                     0.1f * abs(noiseValue) * 2);
                     //(abs(i-horiNum/2) + abs(j-vertNum/2))/(horiNum + vertNum)
      }
    }
    for(int i = 0; i < horiNum ; i ++)
    {
      for(int j = 0; j < vertNum; j ++)
      { 
        PVector curPos = posArray[i + j * round(horiNum)];
        //println(posX + "," + posY);
        
        pushMatrix();
        pushStyle();
        
        noStroke();
        float value = (255/horiNum * i + 255/vertNum * j)/2 * 255;
        fill(value, 255);
        //fill(255,255,255,255);
        translate(curPos.x,curPos.y);
        ellipseMode(CENTER);
        ellipse(0,0,maxSize/2,maxSize/2);
        
        popStyle();
        popMatrix();
        
      }
    }
  }
  
  void DrawLines()
  {
    for(int i = 0; i < horiNum ; i +=3)
    {
      for(int j = 0; j < vertNum; j +=3)
      { 
        float noiseValue = noise(i,j); 
        PVector curPos = posArray[i + j * round(horiNum)];
        
        pushMatrix();
        pushStyle();
        strokeWeight(1+10*abs(noiseValue));
        stroke(255,255,255,255);
        //fill(255,255,255,255);
        line(width/2,height/2, curPos.x, curPos.y);
        
        popStyle();
        popMatrix();
        
      }
    }
  }
  
  void Update(){
    if(keyPressed)
    {
      canChange = true;
    }
    if(canChange)
    {
      DrawLines();
    }
    else
    {
      DrawDots(); 
    }
  }
  
  void Exit(){}
}

class StageThree extends State
{
  float cellSize;
  int horiNum;
  int vertNum;

  float leanMax;
  float chaosMax;
  float sharpMax;
  float poportion;

  ArrayList<ShapeOne> lines;

  
  StageThree(float cellSize)
  {
    this.cellSize = cellSize;
    horiNum = round(width/cellSize);
    vertNum = round(height/cellSize);
    lines = new ArrayList<ShapeOne>();
  }

  void Enter()
  {
    println("Enter Stage Three.");
    chaosMax = cellSize*random(0.01, 0.08);
    sharpMax = cellSize*random(0.05, 0.2);
    poportion = random(0.05, 0.1);
    leanMax = PI/3;
    lines = new ArrayList<ShapeOne>();
    for(int i = 0 ; i < horiNum; i ++)
    {
      for(int j = 0 ; j < vertNum; j ++)
      {
        PVector newPos = new PVector();
        newPos.x = cellSize/2 + i*cellSize;
        newPos.y = cellSize/2 + j*cellSize;
        newPos.z = noise(newPos.x) * 100;
       //println("Generate One Line, POS:" + newPos);
        float lineLength = random(cellSize/4, cellSize*0.9);
        float lineWidth = lineLength * random(poportion * 0.7 , poportion * 2);
        lines.add(new ShapeOne(
          newPos, 
          lineLength,
          lineWidth,
          random(-leanMax,leanMax),
          random(-chaosMax, chaosMax),
          random(-sharpMax, sharpMax),
          color(255,255,255,255)));
      }
    }

  }
  
  void Update()
  {
    for(ShapeOne line : lines)
    {
      line.RenderWithLerp();
      //strokeWeight(5);
      //stroke(255,255,255,255);
      //point(line.pos.x,line.pos.y);
    }
    
    if(keyPressed)
    {
      ChangeTargetValues();
    }
  }
  
  void ChangeTargetValues()
  {
    for(ShapeOne line : lines)
    {
      float noiseValue1 = noise(line.pos.x + millis()/1000,line.pos.y + millis()/1000);
      float degree = noiseValue1 * PI*2;
      line.targetPos.z = noise(line.pos.x + millis()/float(1000)) * 30 - 15;
      line.targetLed =  random(cellSize*0.1, cellSize*2);
      line.targetWid = line.targetLed * random(poportion * 0.7 , poportion * 2);
      line.targetChaos = random(-chaosMax, chaosMax);
      line.targetSharp = random(-sharpMax, sharpMax);
      line.targetCol = round( random(0.0,1.0) * float(color(255,255,255)));
    }
    
  }
  
  void Exit(){

  }
}
