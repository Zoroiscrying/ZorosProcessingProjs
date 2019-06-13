Ball[] balls = new Ball[4];

void setup() {
    size(800, 800);
    balls[0] = new Ball();
    balls[0].posX += 200;
    balls[1] = new Ball();
    balls[1].posX -= 200;
    balls[2] = new Ball();
    balls[2].posY -= 200;
    balls[3] = new Ball();
}

void draw() {
   background(255,255,255); 
   for (int i = 0; i < 4; ++i) {
       balls[i].Draw();
   }
}
