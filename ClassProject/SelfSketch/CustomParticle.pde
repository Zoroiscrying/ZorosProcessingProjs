class CustomParticle{
  float posX;
  float posY;
  float velX;
  float velY;
  float r = 5.0f;
  
  public CustomParticle(float velX, float velY){
    this.posX = random(0,width);
    this.posY = random(0,height);
    this.velX = velX;
    this.velY = velY;
  }
  
  public void Move(){
    this.posX += velX;
    this.posY += velY;
  }
  
  public void CheckEdge(){
    if(posX > width) 
    {
      posX =0;
      posY = random(0,height);
    }
    if(posY > height) 
    {
      posY = 0;
      posX = random(0,width);
    }
  
  }
  
  public void Render()
  {
    ellipseMode(CENTER);
    ellipse(posX,posY,r,r);
  }
  
  public void Update(){
    Move();
    CheckEdge();
    Render();
  }

}
