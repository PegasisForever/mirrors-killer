void drawMirror(float f) { //<>//
  noFill();
  stroke(0, 0, 0);
  strokeWeight(2);

  float arcStart=3.14/(f*4)*3;
  if (arcStart>1.57) {
    arcStart=1.57;
  } else if (arcStart<-1.57) {
    arcStart=-1.57;
  }
  if (f>0) {
    arc(500-20*f*2, 230, 20*f*4, 20*f*4, -arcStart, arcStart);
  } else {
    f=-f;
    arc(500+20*f*2, 230, 20*f*4, 20*f*4, 3.14+arcStart, 3.14-arcStart);
  }
}

void drawRuler() {
  stroke(0, 0, 0);
  strokeWeight(2);

  line(0, 230, 1000, 230);

  strokeWeight(1);
  for (int i=-4; i<=4; i++) {
    if (i!=0) {
      line(getScreenPx(i*5), 220, getScreenPx(i*5), 240);
    }
  }
}

void drawArrow(String name, String hname, float d, float h, Boolean notBroken) {
  float pos=getScreenPx(d);
  float hpos=h*20;

  stroke(0, 0, 0);
  strokeWeight(2);

  if (!notBroken) {
    bline(pos, 230, pos, 230-hpos, 10);
  } else {
    line(pos, 230, pos, 230-hpos);
  }
  if (hpos>0) {
    line(pos, 230-hpos, pos-5, 230-hpos+10);
    line(pos, 230-hpos, pos+5, 230-hpos+10);
  } else {
    line(pos, 230-hpos, pos-5, 230-hpos-10);
    line(pos, 230-hpos, pos+5, 230-hpos-10);
  }

  textAlign(CENTER);
  fill(50, 50, 200);

  textSize(15);
  if (hpos>0) {
    text(name, pos, 210-hpos);
    text(d, pos, 210-hpos+15);

    text(hname, pos, 180-hpos);
    text(h, pos, 180-hpos+15);
  } else {
    text(name, pos, 210-hpos+65);
    text(d, pos, 210-hpos+80);

    text(hname, pos, 210-hpos+35);
    text(h, pos, 210-hpos+50);
  }
  textAlign(LEFT);
}

void lable(String name, float value) {
  float pos=getScreenPx(value);
  textAlign(CENTER);
  fill(50, 50, 200);

  textSize(15);
  text(name, pos, 200);
  text(value, pos, 200+15);

  strokeWeight(1);
  beginShape();
  vertex(pos, 230);
  vertex(pos+5, 220);
  vertex(pos-5, 220);
  endShape(CLOSE);

  textAlign(LEFT);
}

void Pline(float x1, float y1, float x2, float y2, float start, float end, boolean notBroken) {
  float s=(y1-y2)/(x1-x2);
  float i=y1-s*x1;
  stroke(0, 0, 0);
  strokeWeight(1);

  float lx1=start;
  float ly1=lx1*s+i;
  if (ly1<0) {
    ly1=0;
    lx1=(ly1-i)/s;
  } else if (ly1>400) {
    ly1=400;
    lx1=(ly1-i)/s;
  }
  float lx2=end;
  float ly2=lx2*s+i;
  if (ly2<0) {
    ly2=0;
    lx2=(ly2-i)/s;
  } else if (ly2>400) {
    ly2=400;
    lx2=(ly2-i)/s;
  }
  if (!notBroken) {
    bline(lx1, ly1, lx2, ly2, 20);
  } else {
    line(lx1, ly1, lx2, ly2);
  }
}

void bline(float x1, float y1, float x2, float y2, int space) {

  float len=sqrt(pow(y1-y2, 2)+pow(x1-x2, 2));
  int lines=(int)len/space;
  float eachXLen=(x2-x1)/lines;
  float eachYLen=(y2-y1)/lines;

  for (float i=0; i<lines; i++) {
    line(x1+eachXLen*i, y1+eachYLen*i, x1+eachXLen*(i+0.5), y1+eachYLen*(i+0.5));
  }
}

float getScreenPx(float p) {
  return 500-p*20;
}

float getF() {
  float f=1;
  try {
    f=Float.parseFloat(f_et.getText());
  }
  catch(Exception e) {
  }
  return f;
}

float getC() {
  return getF()*2;
}

float getDo() {
  float doo=1;
  try {
    doo=Float.parseFloat(do_et.getText());
  }
  catch(Exception e) {
  }
  return doo;
}

float getHo() {
  float ho=1;
  try {
    ho=Float.parseFloat(ho_et.getText());
  }
  catch(Exception e) {
  }
  return ho;
}

float getDi() {
  return (getF()*getDo())/(getDo()-getF());
}

float getHi() {
  return (-getDi()/getDo())*getHo();
}

float getMirrorX(float y, Boolean isNegative) {
  y=(230-y)/20;
  float r=getC();
  if (std_cb.isChecked()) {
    return 500;
  } else {
    if (!isNegative) {
      return 500+(sqrt((pow(r, 2)-pow(y, 2)))-r)*20;
    } else {
      return 500-(sqrt((pow(r, 2)-pow(y, 2)))+r)*20;
    }
  }
}
