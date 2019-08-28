EditText f_et=new EditText(10,20,150,20);
EditText do_et=new EditText(170,20,150,20);
EditText ho_et=new EditText(330,20,150,20);

TextView di_tv=new TextView(680,20,150,20);
TextView hi_tv=new TextView(840,20,150,20);

CheckBox std_cb=new CheckBox(495,22);

class f_lsnr extends SliderListener{
  void onNumberChanged(float n){
    f_et.setText(Float.toString(n));
  }
}
Slider f_s=new Slider(20,60,130,-10,10,new f_lsnr());

class do_lsnr extends SliderListener{
  void onNumberChanged(float n){
    do_et.setText(Float.toString(n));
  }
}
Slider do_s=new Slider(180,60,130,-15,15,new do_lsnr());

class ho_lsnr extends SliderListener{
  void onNumberChanged(float n){
    ho_et.setText(Float.toString(n));
  }
}
Slider ho_s=new Slider(340,60,130,-5,5,new ho_lsnr());

float sca=1.5;

void setup(){
  size(1500,600);
  
  f_et.setHint("f");
  f_et.setText("5");
  do_et.setHint("do");
  do_et.setText("15");
  ho_et.setHint("ho");
  ho_et.setText("3");
  
  di_tv.setHint("di");
  hi_tv.setHint("hi");
  
  std_cb.setHint("standard");
  
  f_s.setNumber(5);
  do_s.setNumber(15);
  ho_s.setNumber(3);
}

void draw(){
  background(200,200,200);
  scale(sca);

  drawMirror(getF());
  drawRuler();
  drawArrow("do","ho",getDo(),getHo(),true);
  drawArrow("di","hi",getDi(),getHi(),false);

  lable("f",getF());
  lable("c",getC());
  lable("-f",-getF());
  lable("-c",-getC());
  
  if(getDo()>0){
    Pline(500-getDo()*20,230-getHo()*20,500,230,0,500,true);
    Pline(500-getDo()*20,230+getHo()*20,500,230,0,500,true);
    Pline(500-getDo()*20,230+getHo()*20,500,230,500,1000,false);
    
    //Pline(500-getDo()*20,230-getHo()*20,500-getC()*20,230,0,1000,true);
    
    if (getF()>0){
      Pline(0,230-getHo()*20,500,230-getHo()*20,0,getMirrorX(230-getHo()*20,false),true);
      Pline(500-getF()*20,230,getMirrorX(230-getHo()*20,false),230-getHo()*20,0,getMirrorX(230-getHo()*20,false),true);
      Pline(500-getF()*20,230,getMirrorX(230-getHo()*20,false),230-getHo()*20,getMirrorX(230-getHo()*20,false),1000,false);
    }else{
      Pline(0,230-getHo()*20,500,230-getHo()*20,0,getMirrorX(230-getHo()*20,true),true);
      Pline(500-getF()*20,230,getMirrorX(230-getHo()*20,true),230-getHo()*20,0,getMirrorX(230-getHo()*20,true),true);
      Pline(500-getF()*20,230,getMirrorX(230-getHo()*20,true),230-getHo()*20,getMirrorX(230-getHo()*20,true),1000,false);
    }
  }else{
    Pline(500-getDo()*20,230-getHo()*20,500,230,500,1000,true);
    Pline(500-getDo()*20,230+getHo()*20,500,230,500,1000,true);
    Pline(500-getDo()*20,230+getHo()*20,500,230,0,500,false);
    
    if (getF()>0){
      Pline(0,230-getHo()*20,500,230-getHo()*20,getMirrorX(230-getHo()*20,false),1000,true);
      Pline(500-getF()*20,230,getMirrorX(230-getHo()*20,false),230-getHo()*20,getMirrorX(230-getHo()*20,false),1000,true);
      Pline(500-getF()*20,230,getMirrorX(230-getHo()*20,false),230-getHo()*20,0,getMirrorX(230-getHo()*20,false),false);
      
    }else{
      Pline(0,230-getHo()*20,500,230-getHo()*20,getMirrorX(230-getHo()*20,true),1000,true);
      Pline(500-getF()*20,230,getMirrorX(230-getHo()*20,true),230-getHo()*20,getMirrorX(230-getHo()*20,true),1000,true);
      Pline(500-getF()*20,230,getMirrorX(230-getHo()*20,true),230-getHo()*20,0,getMirrorX(230-getHo()*20,true),false);
    }
  }
  
  
  drawUI();
}

void drawUI(){
  f_s.draw();
  do_s.draw();
  ho_s.draw();
  
  f_et.draw();
  do_et.draw();
  ho_et.draw();
  
  di_tv.draw();
  di_tv.setText(getDi()+"");
  hi_tv.draw();
  hi_tv.setText(getHi()+"");
  
  std_cb.draw();
  
  fill(0,0,0);
  textSize(15);
  textAlign(RIGHT);
  text("By Pegasis",995,395);
  textAlign(LEFT);
  
}


void keyPressed(){
  f_et.keyPressed();
  do_et.keyPressed();
  ho_et.keyPressed();
}

void mouseClicked(){
  int x=(int)(mouseX/sca);
  int y=(int)(mouseY/sca);
  
  f_et.mouseClicked(x,y);
  do_et.mouseClicked(x,y);
  ho_et.mouseClicked(x,y);
  std_cb.mouseClicked(x,y);
}

void mousePressed(){
  int x=(int)(mouseX/sca);
  int y=(int)(mouseY/sca);
  
  f_s.mousePressed(x,y);
  do_s.mousePressed(x,y);
  ho_s.mousePressed(x,y);
}

void mouseDragged(){
  int x=(int)(mouseX/sca);
  int y=(int)(mouseY/sca);
  
  f_s.mouseDragged(x,y);
  do_s.mouseDragged(x,y);
  ho_s.mouseDragged(x,y);
}

void mouseReleased(){
  int x=(int)(mouseX/sca);
  int y=(int)(mouseY/sca);
  
  f_s.mouseReleased(x,y);
  do_s.mouseReleased(x,y);
  ho_s.mouseReleased(x,y);
}

void touchStarted() {
  mousePressed();
}

void touchMoved() {
  mouseDragged();
}

void touchEnded() {
  mouseClicked();
  mouseReleased();
}
