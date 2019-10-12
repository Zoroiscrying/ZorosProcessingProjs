class KochLine{
  PVector start;
  PVector end;
  
  KochLine(PVector a, PVector b){
    start = a.copy();
    end = b.copy();
  }
  
  void display(){
    stroke(0);
    line(start.x,start.y,end.x,end.y);
  }
  
  PVector KochAPoint(){
    return this.start.copy();
  }
  PVector KochBPoint(){
    PVector b = this.start.copy();
    PVector v = PVector.sub(end,start);
    v.div(3);
    b.add(v);
    return b;
  }
  PVector KochCPoint(){
    //PVector c = this.KochBPoint();
    //c.add(end.sub(start).div(3).rotate(radians(60.0f)));
    //return c;
    PVector c = start.copy();
    PVector v = PVector.sub(end,start);
    v.div(3);
    c.add(v); // Move to point B
    
    v.rotate(-radians(60));
    c.add(v);
    
    return c;
  }
  PVector KochDPoint(){
    PVector d = start.copy();
    PVector v = PVector.sub(end,start);
    v.div(3);
    d.add(v); // Move to point B
    
    v.rotate(-radians(60));
    d.add(v); // Move to point C
    
    v.rotate(radians(120));
    d.add(v);
    
    return d;
    
  }
  PVector KochEPoint(){
    return this.end.copy();
  }
}
