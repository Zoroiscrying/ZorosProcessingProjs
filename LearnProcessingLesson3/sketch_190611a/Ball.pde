class Ball{
    int posX;
    int posY;
    int r;
    color fillColor = color(0, 0, 0);
    color strokeColor = color(0,0,0); 

    public void Draw(){
        stroke(strokeColor);
        fill(fillColor);
        ellipse(posX, posY, r, r);
    }

    public Ball(){
        posX = width/2;
        posY = height/2;
        r = 100;
    }
  
  
}
