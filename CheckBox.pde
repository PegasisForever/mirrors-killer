class CheckBox{
  int x,y;
  String hint;
  Boolean checked=false;
  CheckBox(int x,int y){
    this.x=x;
    this.y=y;
  }
  
  void setHint(String text){
    this.hint=text;
  }
  
  Boolean isChecked(){
    return checked;
  }
  
  void draw(){
    pushStyle();
    
    stroke(150,150,150);
    fill(255,255,255);
    strokeWeight(2);
    rect(x,y,20,20,2);
    
    if (checked){
      stroke(100,100,200);
      fill(100,100,200);
      rect(x+7,y+7,6,6,2);
    }
    
    fill(100,100,100);
    textSize(14);
    text(hint,x+25,y+15);
    
    popStyle();
  }
  
  void mouseClicked(int mx,int my){
    if (mx>x && mx<x+20 && my>y && my<y+20){
      checked=!checked;
    }
  }
  
}
