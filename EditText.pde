class EditText{
  int x,y,w,h,s;
  String text="";
  String hint="";
  Boolean isFocused=false;
  
  EditText(int x,int y,int w,int s){
    this.x=x;
    this.y=y;
    this.w=w;
    this.h=s+6;
    this.s=s;
  }
  
  Boolean isNumber(char t){
    String regex = "^(-?[1-9]\\d*\\.?\\d*)|(-?0\\.\\d*[1-9])|(-?[0])|(-?[0]\\.\\d*)$";
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
    if (isFocused){
      stroke(100,100,200);
    }else{
      stroke(150,150,150);
    }
    strokeWeight(2);
    fill(255,255,255);
    rect(x,y,w,h,2); //<>//
    
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
  
  void keyPressed(){
    //print(key);
    if ((int(key) == 8 || keyCode == 67) && isFocused){ //<>//
      if(text.length()>0){
        text=text.substring(0,text.length()-1);
      }
    }else if(isFocused && isNumber(key)){
      text+=key;
    }
  }
  
  void mouseClicked(int mx,int my){
    if (mx>x && mx<x+w && my>y && my<y+h){
      isFocused=true;
      //openKeyboard();
    }else{
      isFocused=false;
      //closeKeyboard();
    }
  }
}
