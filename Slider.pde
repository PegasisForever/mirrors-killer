class Slider{
  SliderListener listener;
  int x,y,w;
  float min,max,now;
  Boolean isMoving=false;
  Slider(int x,int y,int w,float min,float max, SliderListener l){
    this.x=x;
    this.y=y;
    this.w=w;
    this.min=min;
    this.max=max;
    this.now=min;
    this.listener=l;
  }
  
  void setNumber(float n){
    now=n;
  }
  
  float getNumber(){
    return now;
  }
  
  void draw(){
    pushStyle();
    
    stroke(0,0,0);
    strokeWeight(2);
    line(x,y,x+w,y);
    
    fill(255,255,255);
    strokeWeight(1);
    ellipse(x+w/(max-min)*(now-min), y, 20, 20);
    
    popStyle();
  }
  
  void mousePressed(int mx,int my){
    if (mx>x+w/(max-min)*(now-min)-10 && mx< x+w/(max-min)*(now-min)+10 && my>y-10 && my<y+10){
      isMoving=true;
    }
  }
  
  void mouseDragged(int mx,int my){
    if (isMoving){
      now=(mx-x)/(w/(max-min))+min;
      if(now<min){
        now=min;
      }else if(now>max){
        now=max;
      }
      listener.onNumberChanged(now);
    }
  }
  
  void mouseReleased(int mx,int my){
    isMoving=false;
  }
  
}


abstract class SliderListener{
  abstract void onNumberChanged(float n);
}
