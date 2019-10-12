PVector getNormalPoint(PVector loc, PVector start, PVector end){
  //Takes three points and return a normal point
  PVector pathDir = PVector.sub(end,start).normalize();
  PVector pointDir = PVector.sub(loc, start);
  
  pathDir.mult(pointDir.dot(pathDir));
  
  float angle = PVector.angleBetween(pathDir, pointDir);
  float mag = pathDir.mag()* cos(radians(angle));
  
  PVector normalPoint = PVector.add(pathDir, start);
  
  return normalPoint;
}
