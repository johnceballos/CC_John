String state = "pregame";
int X=400;
int Y=400;
int X1=200;
int Y1=400;
int X2=600;
int Y2=400;
float a=0;
float b=0;
float c=0;
float d=0;
float e=0;
float f=0;
float g=0;
float h=0;
float a1=0;
float b1=0;
float c1=0;
float d1=0;
float e1=0;
float f1=0;
float g1=0;
float h1=0;

void setup(){
  size(800,800);
  rectMode(CENTER);
  textAlign(CENTER);
  ellipseMode(CENTER);
}

void draw(){

  textSize(36);
  if (state=="pregame"){
    background(252,166,208);
    fill(255);
    text("press 1 for single player mode", width/2, 350);
    text("press 2 for two player mode", width/2, 450);
    a1 = -10;
    b1 = -10;
    c1 = -10;
    d1 = -10;
    e1 = -10;
    f1 = -10;
    g1 = -10;
    h1 = -10;
  }
  else if (state=="oneplayer"){
    background(212,166,252);
    a1 = a1 + 1;
    b1 = b1 + 1;
    c1 = c1 + 1;
    d1 = d1 + 1;
    e1 = e1 + 1;
    f1 = f1 + 1;
    g1 = g1 + 1;
    h1 = h1 + 1;
    a = 2*(a1-10);
    b = 2*(b1-60);
    c = c1*1.5;
    d = d1-27;
    e = (e1-15)*.8;
    f = (f1-5)*1.2;
    g = g1*1.4;
    h = (h1-40)*.7;
    theCircle(50,a,10);
    theCircle(150,b,10);
    theCircle(250,c,10);
    theCircle(350,d,10);
    theCircle(450,e,10);
    theCircle(550,f,10);
    theCircle(650,g,10);
    theCircle(750,h,10);
    thePlayer(X,Y,50);
    if (a > 810){
        a1 = 5;
    }
    if (b > 810){
        b1 = 55;
    }
    if (c > 810){
        c1 = (-6 -(2/3));
    }
    if (d > 810){
        d1 = 17;
    }
    if (e > 810){
        e1 = 2.5;
    }
    if (f > 810){
        f1 = (-3 -(1/3));
    }
    if (g > 810){
        g1 = -7.143;
    }
    if (h > 810){
        h1 = 25.715;
    }
   }
   else if(state== "twoplayer"){
    background(212,166,252);
    a1 = a1 + 1;
    b1 = b1 + 1;
    c1 = c1 + 1;
    d1 = d1 + 1;
    e1 = e1 + 1;
    f1 = f1 + 1;
    g1 = g1 + 1;
    h1 = h1 + 1;
    a = 2*(a1-10);
    b = 2*(b1-60);
    c = c1*1.5;
    d = d1-27;
    e = (e1-15)*.8;
    f = (f1-5)*1.2;
    g = g1*1.4;
    h = (h1-40)*.7;
    theCircle(50,a,10);
    theCircle(150,b,10);
    theCircle(250,c,10);
    theCircle(350,d,10);
    theCircle(450,e,10);
    theCircle(550,f,10);
    theCircle(650,g,10);
    theCircle(750,h,10);
    thePlayer(X1,Y1,50);
    thePlayer(X2,Y2,50);
    textSize(12);
    fill(0);
    text("1",X1,Y1);
    text("2",X2,Y2);

    if (a > 810){
        a1 = 5;
    }
    if (b > 810){
        b1 = 55;
    }
    if (c > 810){
        c1 = (-6 -(2/3));
    }
    if (d > 810){
        d1 = 17;
    }
    if (e > 810){
        e1 = 2.5;
    }
    if (f > 810){
        f1 = (-3 -(1/3));
    }
    if (g > 810){
        g1 = -7.143;
    }
    if (h > 810){
        h1 = 25.715;
    }
   }
  else if(state=="gameover"){
    background(252,166,208);
    fill(255);
    text("everyone loses.", 400, 400);
  }
}

void mousePressed(){
  if (state== "oneplayer"){
    state="gameover";
  }
  else if (state== "twoplayer"){
    state="gameover";
  }
  else if (state== "gameover"){
    state="pregame";
  }
}

void keyPressed(){
    if (key=='1' && state=="pregame"){
    state = "oneplayer";
  }
  if (key=='2' && state=="pregame"){
    state = "twoplayer";
  }
  if (key=='w' && state=="oneplayer"){
    Y=Y-30;
  }
   if (key=='a' && state=="oneplayer"){
    X=X-30;
  }
   if (key=='s' && state=="oneplayer"){
    Y=Y+30;
  }
   if (key=='d' && state=="oneplayer"){
    X=X+30;
  }
  if (key=='w' && state=="twoplayer"){
    Y1=Y1-30;
  }
   if (key=='a' && state=="twoplayer"){
    X1=X1-30;
  }
   if (key=='s' && state=="twoplayer"){
    Y1=Y1+30;
  }
   if (key=='d' && state=="twoplayer"){
    X1=X1+30;
  }
  if (key=='i' && state=="twoplayer"){
    Y2=Y2-30;
  }
   if (key=='j' && state=="twoplayer"){
    X2=X2-30;
  }
   if (key=='k' && state=="twoplayer"){
    Y2=Y2+30;
  }
   if (key=='l' && state=="twoplayer"){
    X2=X2+30;
  }
}
void theCircle(float w, float z, int dia){
  fill(255);
  noStroke();
  ellipse(w,z,dia,dia);
}
void thePlayer(float rectx, float recty, float rad){
      fill(255);
      rect(rectx,recty,rad,rad);
}