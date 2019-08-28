class TextView{
  int x,y,w,h,s;
  String text="";
  String hint="";
  
  TextView(int x,int y,int w,int s){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=s+6;
    this.s=s;
  }
  
  Boolean isNumber(char t){
    return true;
  }
  
  void setHint(String text){
    this.hint=text+":";
  }
  
  void setText(String text){
    this.text=text;
  }
  
  String getText(){
    return text;
  }
  
  void draw(){
    pushStyle();

    noStroke();
    fill(255,255,255);
    rect(x,y,w,h,2);
    
    fill(100,100,100);
    textSize(s/1.5);
    text(hint,x+3,y-5);
    
    fill(0,0,0);
    textSize(s);
    clip(x,y,w,s+3);
    text(text,x+3,y+s);
    
    noClip();
    
    popStyle();
  }
}
