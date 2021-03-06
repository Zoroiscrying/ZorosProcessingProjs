class Cell{
  
  int[] cells;
  int[] ruleset;
  
  int w =10;
  int generation = 0;
  
  Cell(){
    cells = new int[width];
    ruleset = new int[]{0,1,0,1,1,0,1,0};
    
    for(int i = 0; i < cells.length; i++){
      cells[i] = 0;
    }
    //cells[0] =1;
    cells[cells.length/2/w] = 1;
  }
  
  Cell(int[] ruleSet){
    cells = new int[width];
    this.ruleset = ruleSet;
    
    for(int i = 0; i < cells.length; i++){
      cells[i] = 0;
    }
    
    cells[cells.length/2] = 1;
  }
  
  void generate(){
    int[] nextgen = new int[cells.length];
    for(int i = 1;i<cells.length-1;i++){
      int left = cells[i-1];
      int me = cells[i];
      int right = cells[i+1];
      nextgen[i] = rules(left, me, right);
    }
    cells = nextgen;
    generation ++;
  }
  
  int rules(int a, int b, int c){
    String s = ""+a+b+c;
    int index = Integer.parseInt(s,2);
    
    return ruleset[index];
  }
  
  void display(){
    for(int i = 0; i < cells.length; i++){
      if(cells[i] == 1)fill(0);
      else fill(255);
      rect(i*w, generation*w, w,w);
    }
  }
  
}
