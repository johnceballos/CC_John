import gab.opencv.*;
import processing.video.*;
//int cellsize=20;
//int cols,rows;
Ball ball1, ball2;
Capture video;
OpenCV opencv;
Contour contour, contour2;
String state= "screen1";
int count,r1,r2,r3,dir1=1,dir2=1,dir3=1,counter1,counter2,inc1,inc2;
float r4,g,b,savetime;
Boolean gameover1=false, gameover2=false;
ArrayList<PVector> points;
void captureEvent(Capture video){
  video.read();
  //cols = width/cellsize;
  //rows = height/cellsize;
}
void setup(){
 state = "pregame";
 size(displayWidth,displayHeight);
 video = new Capture(this,width,height);
 opencv = new OpenCV(this, width, height);
 rectMode(CENTER);
 textAlign(CENTER);
 textSize(32);
 opencv.startBackgroundSubtraction(100, 10, .7);
 video.start();
 ball1 = new Ball(width/8 + 30 ,height/8 + 30, 8, 10);
 ball2 = new Ball(width/2, height/2, 0, 0);
 count=0;
 r1=200;
 r2=200;
 r3=200;
 r4 = 0;
 g = 80;
 b = 180;
 inc1 = 0;
 inc2 = 0;
 counter1 = 0;
 counter2 = 0;
}
void draw(){
  if (state=="pregame"){
    background(255,228,129);
    count+=1;
    if (count<100){
      text("WELCOME",width/2,height/2);
    }
    else if (count > 100 && count <200){
      text("SELECT A GAME MODE",width/2,height/2);
    }
    else{
      opencv.loadImage(video);
      opencv.flip(1);
      opencv.updateBackground();
      //opencv.threshold(50);
      //opencv.invert();
      opencv.dilate();
      //opencv.erode();
      fill(255,0,0);
      stroke(255, 0, 0);
      strokeWeight(3);
      for (Contour contour : opencv.findContours()) {
        contour.getPolygonApproximation();
        contour.draw();
      }
    }
    menu();
  }
  if (state=="pregame 2"){
    background(255,228,129);
    count+=1;
    if (count<100){
      text("SELECT A GAME MODE",width/2,height/2);
    }
    else{
      opencv.loadImage(video);
      opencv.flip(1);
      opencv.updateBackground();
      //opencv.threshold(50);
      //opencv.invert();
      opencv.dilate();
      //opencv.erode();
      fill(255,0,0);
      stroke(255, 0, 0);
      strokeWeight(3);
      for (Contour contour : opencv.findContours()) {
        contour.getPolygonApproximation();
        contour.draw();
      }
    }
    menu();
  }
  if (state=="screen1"){
    background(255,228,129);
    if (gameover1==false){
      count+=1;
      if (count<200){
        text("DON'T LET THE BALL TOUCH THE WALLS",width/2,height/2);
        savetime = millis();
      }
      /*
      else if(count>=200 && count<400){
        text("YOU HAVE 5 LIVES",width/2,height/2);
        if (count>300){
          text("FOR NOW...",width/2,height/2 + 50);
        }
      }
      */
      else{
          opencv.loadImage(video);
          opencv.flip(1);
          opencv.updateBackground();
          opencv.dilate();
          //opencv.erode();
          fill(255,0,0);
          stroke(255, 0, 0);
          strokeWeight(3);
          for (Contour contour : opencv.findContours()) {
            contour.getPolygonApproximation();
            contour.draw();
             if (contour.containsPoint(int(ball1.x-10), int(ball1.y)) ==true){
               ball1.x = ball1.x;
               ball1.y = ball1.y;
               ball1.direction1 = 8;
             }
             if (contour.containsPoint(int(ball1.x+10), int(ball1.y)) ==true){
               ball1.x = ball1.x;
               ball1.y = ball1.y;
               ball1.direction1 = -8;
             }
             if (contour.containsPoint(int(ball1.x), int(ball1.y+10)) ==true){
               ball1.x = ball1.x;
               ball1.y = ball1.y;
               ball1.direction2 = -10;
             }
             if (contour.containsPoint(int(ball1.x), int(ball1.y-10)) ==true){
               ball1.x = ball1.x;
               ball1.y = ball1.y;       
               ball1.direction2 = 10;
             }
             if (contour.containsPoint(int(ball1.x-7.1), int(ball1.y-7.1)) ==true){
               ball1.x = ball1.x;
               ball1.y = ball1.y;       
               ball1.direction1 = 8;
               ball1.direction2 = 10;
             }
             if (contour.containsPoint(int(ball1.x+7.1), int(ball1.y-7.1)) ==true){
               ball1.x = ball1.x;
               ball1.y = ball1.y;       
               ball1.direction1 = -8;
               ball1.direction2 = 10;
             }
             if (contour.containsPoint(int(ball1.x+7.1), int(ball1.y+7.1)) ==true){
               ball1.x = ball1.x;
               ball1.y = ball1.y;       
               ball1.direction2 = -8;
               ball1.direction1 = -10;
             }
             if (contour.containsPoint(int(ball1.x+7.1), int(ball1.y-7.1)) ==true){
               ball1.x = ball1.x;
               ball1.y = ball1.y;       
               ball1.direction2 = -8;
               ball1.direction1 = 10;
             }
             
          }
          fill(171,5,255);
          ball1.move();
          ball1.display();
          fill(255,180,251);
          if (ball1.score<=0){
            gameover1= true;
            count=0;
          }
          if (ball1.score==1){
            rect(width-60, height/8 + 50, 20,20,5);
          }
          if(ball1.score==2){
            rect(width-60, height/8 + 50, 20,20,5);
            rect(width-85, height/8 + 50, 20,20,5);
          }
          if(ball1.score==3){
            rect(width-60, height/8 + 50, 20,20,5);
            rect(width-85, height/8 + 50, 20,20,5);
            rect(width-110, height/8 + 50, 20,20,5);
          }
          if(ball1.score==4){
            rect(width-60, height/8 + 50, 20,20,5);
            rect(width-85, height/8 + 50, 20,20,5);
            rect(width-110, height/8 + 50, 20,20,5);
            rect(width-135, height/8 + 50, 20,20,5);
          }
          if(ball1.score==5){
            rect(width-60, height/8 + 50, 20,20,5);
            rect(width-85, height/8 + 50, 20,20,5);
            rect(width-110, height/8 + 50, 20,20,5);
            rect(width-135, height/8 + 50, 20,20,5);
            rect(width-160, height/8 + 50, 20,20,5);
          }
          /*
          if(ball1.score>5){
            text(ball1.score, width-60, height/8 + 50);
          }
          */
          if(millis() >= savetime + 1000){
            counter1+=1;
            savetime = millis();
          }
        }
        menu();
      }
    if(gameover1==true){
      count+=1;
      text("YOU LASTED " + counter1 + " SECONDS",width/2,height/2);
      if (count>200){
        state="pregame 2";
        count=0;
      }
    menu();
  }
  }
  if (state=="screen2"){
    background(255,228,129);
    if (gameover2==false){
      count+=1;
      if (count<200){
        text("TRY TO KEEP THE BALL ON YOUR OPPONENTS SIDE",width/2,height/2);
        menu();
      }
      else if(count>=200 && count<300){
        fill(111,221,240);
        rectMode(CENTER);
        rect(width* 3/4, height/2, width/2, height);
        
        opencv.loadImage(video);
        opencv.flip(1);
        opencv.updateBackground();
        opencv.threshold(50);
        //opencv.invert();
        opencv.dilate();
        //opencv.erode();
        fill(175);
        stroke(175);
        strokeWeight(3);
        for (Contour contour : opencv.findContours()) {
          contour.getPolygonApproximation();
          contour.draw();
        }
        fill(255,0,0);
        text("PICK A SIDE",width/2,height/2);
        fill(247,117,117);
        text("PLAYER 1",width/4,height/2 - 50);
        fill(130,117,247);
        text("PLAYER 2",width*3/4,height/2 - 50);
        if (count>275){
          fill(255,0,0);
          text("HIT BALL TO BEGIN",width/2,height/2 + 50);
        }
        menu();
      }
      else{
        background(255,228,129);
        fill(111,221,240);
        rectMode(CENTER);
        rect(width* 3/4, height/2, width/2, height);
        opencv.loadImage(video);
        opencv.flip(1);
        opencv.updateBackground();
        //<PVector>getPoints();
        opencv.dilate();
        //opencv.erode();
        fill(175);
        stroke(175);
        strokeWeight(3);
        for (Contour contour : opencv.findContours()) {
          contour.getPolygonApproximation();
          contour.draw();
           if (contour.containsPoint(int(ball2.x-10), int(ball2.y)) ==true){
            ball2.x = ball2.x;
            ball2.y = ball2.y;
            ball2.direction1 = 8;
          }
          if (contour.containsPoint(int(ball2.x+10), int(ball2.y)) ==true){
            ball2.x = ball2.x;
            ball2.y = ball2.y;
            ball2.direction1 = -8;
          }
          if (contour.containsPoint(int(ball2.x), int(ball2.y+10)) ==true){
            ball2.x = ball2.x;
            ball2.y = ball2.y;
            ball2.direction2 = -10;
          }
          if (contour.containsPoint(int(ball2.x), int(ball2.y-10)) ==true){
            ball2.x = ball2.x;
            ball2.y = ball2.y;       
            ball2.direction2 = 10;
          }
          if (contour.containsPoint(int(ball2.x-7.1), int(ball2.y-7.1)) ==true){
            ball2.x = ball2.x;
            ball2.y = ball2.y;       
            ball2.direction1 = 8;
            ball2.direction2 = 10;
          }
          if (contour.containsPoint(int(ball2.x+7.1), int(ball2.y-7.1)) ==true){
            ball2.x = ball2.x;
            ball2.y = ball2.y;       
            ball2.direction1 = -8;
            ball2.direction2 = 10;
          }
          if (contour.containsPoint(int(ball2.x+7.1), int(ball2.y+7.1)) ==true){
            ball2.x = ball2.x;
            ball2.y = ball2.y;       
            ball2.direction2 = -8;
            ball2.direction1 = -10;
          }
          if (contour.containsPoint(int(ball2.x+7.1), int(ball2.y-7.1)) ==true){
            ball2.x = ball2.x;
            ball2.y = ball2.y;       
            ball2.direction2 = -8;
            ball2.direction1 = 10;
          }
        }
        fill(171,5,255);
        ball2.move();
        ball2.display();
        if(ball2.x== width/2){
          savetime = millis();
        }
        if(millis() >= savetime + 1000 && ball2.x>width/2){
          counter1+=1;
          savetime = millis();
        }
        if(millis() >= savetime + 1000 && ball2.x<width/2){
          counter2+=1;
          savetime = millis();
        }
        fill(255);
        fill(247,117,117);
        text(30-counter2, 50, height/8 + 50);
        fill(130,117,247);
        text(30-counter1, width - 50, height/8 + 50);
        if (counter1>30){
          gameover2= true;
          count=0;
        }
        if (counter2>30){
          gameover2= true;
          count=0;
        }
        menu();
      }
    }
    if(gameover2==true){
      background(255,228,129);
      count+=1;
      if (counter1>counter2){
        fill(247,117,117);
        text("Player 1 Wins",width/2,height/2);
        menu();
        if (count>200){
          state="pregame 2";
          count=0;
      }
      }
      else{
        fill(130,117,247);
        text("Player 2 Wins",width/2,height/2);
        menu();
        if (count>200){
          state="pregame 2";
          count=0;
      }
      }
  }
  }
  if (state=="screen3"){
    background(255,228,129);
    opencv.loadImage(video);
    opencv.flip(1);
    opencv.updateBackground();
    opencv.dilate();
    opencv.erode();
    fill(r4,g,b);
    stroke(r4, g, b);
    strokeWeight(3);
    for (Contour contour : opencv.findContours()) {
      r4 = (r4 + .01*dir1);
      g = (g + .01*dir2);
      b = (g + .01*dir3);
      if (r4>=255){
        dir1 *= -1;
      }
      else if (g>=255){
        dir2 *= -1;
      }
      else if (b>=255){
        dir3 *= -1;
      }
      else if (r4<=0){
        dir1 *= -1;
      }
      else if (g<=0){
        dir2 *= -1;
      }
      else if (b<=0){
        dir3 *= -1;
      }
      contour.getPolygonApproximation();
      contour.draw();
    }
    menu();
  }
 }
class Ball {
  float x, y;
  float direction1;
  float direction2;
  float checker;
  int score=5;
  Ball(float xpos, float ypos, float direction_1,float direction_2 ) {
    x = xpos;
    y = ypos;
    direction1 = direction_1;
    direction2 = direction_2;
  }
  void move() {
    x = x+ direction1;
    y = y+ direction2;
    if ((x > (width - 20))) {
      direction1 = -8;
      if (millis() >= checker+1000){
        score-=1;
      }
      checker=millis();
    }
    else if (x < 20) {
      direction1 = 8;
      if (millis() >= checker+1000){
        score-=1;
      }
      checker=millis();
    }
    else if ((y > (height-60))) {
      direction2 = -10;
      if (millis() >= checker+1000){
        score-=1;
      }
      checker=millis();
    }
    else if (y<(height/8) + 20) {
      direction2 = 10;
      if (millis() >= checker+1000){
        score-=1;
      }
      checker=millis();
    }
  }
  void display() {
    ellipseMode(CENTER);
    ellipse(x, y, 20, 20);
  }
}
void menu() {
    noStroke();
    fill(255,219,88);
    rect(width/2, (height/16), (width), (height/8));
    stroke(255,228,129);
    strokeWeight(5);
    line(width/2,0,width/2,height/8);
    //line(width*2/3,0,width*2/3,height/8);
    fill(r1,0,0);
    text("1 player", width/4, height/16);
    fill(r2,0,0);
    text("2 player", width*3/4, height/16);
    //fill(r3,0,0);
    //text("x", width*5/6, height/16);
    if (mousePressed && mouseX<width/2 && mouseY<height/8){
      state="screen1";
      count=0;
      counter1=0;
      ball1.score=5;
      gameover1=false;
      ball1.x = width/8 + 30;
      ball1.y = height/8 + 30;
      ball1.direction1= 8;
      ball1.direction2= 10;
    }
    else if (mouseX<width/2 && mouseY<height/8){
      r1=255;
    }
    else if (mouseX>width/2 && mouseY>height/8){
      r1=200;
    }
    else if (mousePressed && mouseX>width/2 && mouseY<height/8){
      state="screen2";
      count=0;
      counter1=0;
      counter2=0;
      gameover2=false;
      ball2.x=width/2;
      ball2.y=height/2;
      ball2.direction1=0;
      ball2.direction2=-10;
    }
    else if (mouseX>width/2 && mouseY<height/8){
      r2=255;
    }
    else if(mouseX<width/2 && mouseY > height/8){
      r2=200;
    }
    /*
    else if (mousePressed && mouseX>width*2/3 && mouseY<height/8){
      state="screen3";
      count=0;
    }
    else if (mouseX>width*2/3&& mouseY<height/8){
      r3=255;
    }
    else if (mouseX<width*2/3&& mouseY>height/8){
      r3=200;
    }
    */
}