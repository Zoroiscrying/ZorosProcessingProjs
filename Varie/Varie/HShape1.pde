class HShape1 extends HShape {
  
  boolean presetColorsList = false;

  HShape1(String path, PVector colorPresetsFrom, PVector colorPresetsTo) {
    super(path, colorPresetsFrom, colorPresetsTo);
    presetColorsList = false;
  }
  
  HShape1(String path, ArrayList<PVector> presetColors){
    super(path, presetColors);
    presetColorsList = true;
  }

  void run() {
    rotateY(radians(HFL.handYaw));

    if (!isExpanding)
    {
      ChangeOneGroupPosition(
        round(random(0, this.groups.size()-1))
        , new PVector(0, 0, BAND));
    }
    //h1.ChangeOneGroupPosition(0,new PVector(0,0, BAND));


    //ChangeOneGroupRotate(
    //  round(random(0, this.groups.size()-1))
    //  , new PVector(BAND/400, 0, 0));

    ChangeOneGroupRotate(
      round(random(0, this.groups.size()-1))
      , new PVector(0, BAND/200, 0));

    ChangeOneGroupDensity(
      round(random(0, this.groups.size()-1))
      , (random(1)>0.25) ?abs(sin(BAND)) :abs(BAND*0.2));
        
    for (int i = 0; i< groups.size(); i ++)
    {
      PVector thisHSBColor = new PVector(0,0,0);
      int randomStartIndex = round(second()/2);
      if(!this.presetColorsList) thisHSBColor = PVector.add(this.HSBGroupColorFrom ,PVector.sub(this.HSBGroupColorTo,this.HSBGroupColorFrom).mult(abs(BANDNormalized)));
      else thisHSBColor = this.presetColors.get((i + randomStartIndex) % (presetColors.size()-1));
      println(thisHSBColor.x);
      switch(i%3)
      {
      case 0:
        ChangeOneGroupColor(
          i
          , new PVector(thisHSBColor.x ,thisHSBColor.y,thisHSBColor.z));
        break;
      case 1:
        ChangeOneGroupColor(
          i
          , new PVector(thisHSBColor.x ,thisHSBColor.y,thisHSBColor.z));
        break;
      case 2:
        ChangeOneGroupColor(
          i
          , new PVector(thisHSBColor.x ,thisHSBColor.y,thisHSBColor.z));
        break;
      default:
        ChangeOneGroupColor(
          i
          , new PVector(thisHSBColor.x ,thisHSBColor.y,thisHSBColor.z));
        break;
      }
    }
    //ChangeOneGroupColor(
    //  0
    //  , new PVector(random(0, 255), 100, 100));
  }
}
