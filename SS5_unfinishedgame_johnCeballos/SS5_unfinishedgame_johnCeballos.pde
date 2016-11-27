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
float r4,g,b;

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
 opencv.startBackgroundSubtraction(100, 2, .1);
 video.start();
 ball1 = new Ball(width/8,height/8, 8, 10);
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
    else if (count>100){
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
      }
    }
    noStroke();
    fill(255,219,88);
    rect(width/2, (height/16), (width), (height/8));
    stroke(255,228,129);
    strokeWeight(5);
    line(width/3,0,width/3,height/8);
    line(width*2/3,0,width*2/3,height/8);
    fill(r1,0,0);
    text("1 player", width/6, height/16);
    fill(r2,0,0);
    text("2 player", width*3/6, height/16);
    fill(r3,0,0);
    text("x", width*5/6, height/16);
    
    if (mousePressed && mouseX<width/3 && mouseY<height/8){
      state="screen1";
      count=0;
    }
    else if (mouseX<width/3 && mouseY<height/8){
      r1=255;
    }
    else if (mouseX>width/3 && mouseY>height/8){
      r1=200;
    }
    else if (mousePressed && mouseX<width*2/3 && mouseX>width/3 && mouseY<height/8){
      state="screen2";
      count=0;
    }
    else if (mouseX<width*2/3 && mouseX>width/3 && mouseY<height/8){
      r2=255;
    }
    else if(mouseX > width*2/3 && mouseY > height/8){
      r2=200;
    }
    else if(mouseX < width/3 && mouseY > height/8){
      r2=200;
    }
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
  }
  if (state=="screen1"){
    //image(video,0,0);
    /*
    video.loadPixels();
    for(int i=0; i<cols; i++){
      for(int j = 0; j<rows; j++){
         int x = i*cellsize + cellsize/2;
         int y = j*cellsize + cellsize/2;
         int loc = x + y * width;
         color c = video.pixels[loc];
         pushMatrix();
         translate(x,y);
         fill(c);
         noStroke();
         rectMode(CENTER);
         rect(0,0,cellsize,cellsize);
         popMatrix();
      }
    }
    */
    background(255,228,129);
    
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
       else if (contour.containsPoint(int(ball1.x+10), int(ball1.y)) ==true){
         ball1.x = ball1.x;
         ball1.y = ball1.y;
         ball1.direction1 = -8;
       }
       else if (contour.containsPoint(int(ball1.x), int(ball1.y+10)) ==true){
         ball1.x = ball1.x;
         ball1.y = ball1.y;
         ball1.direction2 = -10;
       }
       else if (contour.containsPoint(int(ball1.x), int(ball1.y-10)) ==true){
         ball1.x = ball1.x;
         ball1.y = ball1.y;       
         ball1.direction2 = 10;
       }
       else if (contour.containsPoint(int(ball1.x-7), int(ball1.y-7)) ==true){
         ball1.x = ball1.x;
         ball1.y = ball1.y;       
         ball1.direction1 = 8;
         ball1.direction2 = 10;
       }
       else if (contour.containsPoint(int(ball1.x+7), int(ball1.y-7)) ==true){
         ball1.x = ball1.x;
         ball1.y = ball1.y;       
         ball1.direction1 = -8;
         ball1.direction2 = 10;
       }
       else if (contour.containsPoint(int(ball1.x+7), int(ball1.y+7)) ==true){
         ball1.x = ball1.x;
         ball1.y = ball1.y;       
         ball1.direction2 = -8;
         ball1.direction1 = -10;
       }
       else if (contour.containsPoint(int(ball1.x+7), int(ball1.y-7)) ==true){
         ball1.x = ball1.x;
         ball1.y = ball1.y;       
         ball1.direction2 = -8;
         ball1.direction1 = 10;
       }
       
    }
    fill(171,5,255);
    ball1.move();
    ball1.display();
    
    noStroke();
    fill(255,219,88);
    rect(width/2, (height/16), (width), (height/8));
    stroke(255,228,129);
    strokeWeight(5);
    line(width/3,0,width/3,height/8);
    line(width*2/3,0,width*2/3,height/8);
    fill(r1,0,0);
    text("1 player", width/6, height/16);
    fill(r2,0,0);
    text("2 player", width*3/6, height/16);
    fill(r3,0,0);
    text("x", width*5/6, height/16);
    
    if (mousePressed && mouseX<width/3 && mouseY<height/8){
      state="screen1";
      count=0;
    }
    else if (mouseX<width/3 && mouseY<height/8){
      r1=255;
    }
    else if (mouseX>width/3 && mouseY>height/8){
      r1=200;
    }
    else if (mousePressed && mouseX<width*2/3 && mouseX>width/3 && mouseY<height/8){
      state="screen2";
      count=0;
    }
    else if (mouseX<width*2/3 && mouseX>width/3 && mouseY<height/8){
      r2=255;
    }
    else if(mouseX > width*2/3 && mouseY > height/8){
      r2=200;
    }
    else if(mouseX < width/3 && mouseY > height/8){
      r2=200;
    }
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
  }
  if (state=="screen2"){
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

    fill(255,0,0);
    stroke(255, 0, 0);
    strokeWeight(3);
    for (Contour contour : opencv.findContours()) {
      contour.getPolygonApproximation();
      contour.draw();
       if (contour.containsPoint(int(ball2.x-10), int(ball2.y)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;
         ball2.direction1 = 8;
       }
       if (contour.containsPoint(int(ball2.x+10), int(ball2.y)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;
         ball2.direction1 = -8;
       }
       if (contour.containsPoint(int(ball2.x), int(ball2.y+10)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;
         ball2.direction2 = -10;
       }
       if (contour.containsPoint(int(ball2.x), int(ball2.y-10)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;       
         ball2.direction2 = 10;
       }
       if (contour.containsPoint(int(ball2.x-7), int(ball2.y-7)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;       
         ball2.direction1 = 8;
         ball2.direction2 = 10;
       }
       if (contour.containsPoint(int(ball2.x+7), int(ball2.y-7)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;       
         ball2.direction1 = -8;
         ball2.direction2 = 10;
       }
       if (contour.containsPoint(int(ball2.x+7), int(ball2.y+7)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;       
         ball2.direction2 = -8;
         ball2.direction1 = -10;
       }
       if (contour.containsPoint(int(ball2.x+7), int(ball2.y-7)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;       
         ball2.direction2 = -8;
         ball2.direction1 = 10;
       }
       
    }
    fill(0,0,255);
    stroke(255, 0, 0);
    strokeWeight(3);
    for (Contour contour2 : opencv.findContours()) {
      contour2.getPolygonApproximation();
      contour2.draw();
       if (contour2.containsPoint(int(ball2.x-10), int(ball2.y)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;
         ball2.direction1 = 8;
       }
       else if (contour2.containsPoint(int(ball2.x+10), int(ball2.y)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;
         ball2.direction1 = -8;
       }
       else if (contour2.containsPoint(int(ball2.x), int(ball2.y+10)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;
         ball2.direction2 = -10;
       }
       else if (contour2.containsPoint(int(ball2.x), int(ball2.y-10)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;       
         ball2.direction2 = 10;
       }
       else if (contour2.containsPoint(int(ball2.x-7), int(ball2.y-7)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;       
         ball2.direction1 = 8;
         ball2.direction2 = 10;
       }
       else if (contour2.containsPoint(int(ball2.x+7), int(ball2.y-7)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;       
         ball2.direction1 = -8;
         ball2.direction2 = 10;
       }
       else if (contour2.containsPoint(int(ball2.x+7), int(ball2.y+7)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;       
         ball2.direction2 = -8;
         ball2.direction1 = -10;
       }
       else if (contour2.containsPoint(int(ball2.x+7), int(ball2.y-7)) ==true){
         //ball2.x = ball2.x;
         //ball2.y = ball2.y;       
         ball2.direction2 = -8;
         ball2.direction1 = 10;
       }
       
    }

    fill(171,5,255);
    ball2.move();
    ball2.display();
    if (ball2.x > width/2){
      inc2 =1;
      inc1=0;
    }
    else if (ball2.x < width/2){
      inc1 = 1;
      inc2=0;
    }
    counter1 = counter1 +inc1;
    counter2 = counter2+inc2;
    fill(255);
    text(counter1/frameRate, 50, height/8 + 50);
    text(counter2/frameRate, width - 50, height/8 + 50);
    //println(frameRate);
    noStroke();
    fill(255,219,88);
    rect(width/2, (height/16), (width), (height/8));
    stroke(255,228,129);
    strokeWeight(5);
    line(width/3,0,width/3,height/8);
    line(width*2/3,0,width*2/3,height/8);
    fill(r1,0,0);
    text("1 player", width/6, height/16);
    fill(r2,0,0);
    text("2 player", width*3/6, height/16);
    fill(r3,0,0);
    text("x", width*5/6, height/16);
    
    if (mousePressed && mouseX<width/3 && mouseY<height/8){
      state="screen1";
      count=0;
    }
    else if (mouseX<width/3 && mouseY<height/8){
      r1=255;
    }
    else if (mouseX>width/3 && mouseY>height/8){
      r1=200;
    }
    else if (mousePressed && mouseX<width*2/3 && mouseX>width/3 && mouseY<height/8){
      state="screen2";
      count=0;
    }
    else if (mouseX<width*2/3 && mouseX>width/3 && mouseY<height/8){
      r2=255;
    }
    else if(mouseX > width*2/3 && mouseY > height/8){
      r2=200;
    }
    else if(mouseX < width/3 && mouseY > height/8){
      r2=200;
    }
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

    noStroke();
    fill(255,219,88);
    rect(width/2, (height/16), (width), (height/8));
    stroke(255,228,129);
    strokeWeight(5);
    line(width/3,0,width/3,height/8);
    line(width*2/3,0,width*2/3,height/8);
    fill(r1,0,0);
    text("1 player", width/6, height/16);
    fill(r2,0,0);
    text("2 player", width*3/6, height/16);
    fill(r3,0,0);
    text("x", width*5/6, height/16);
    
    if (mousePressed && mouseX<width/3 && mouseY<height/8){
      state="screen1";
      count=0;
    }
    else if (mouseX<width/3 && mouseY<height/8){
      r1=255;
    }
    else if (mouseX>width/3 && mouseY>height/8){
      r1=200;
    }
    else if (mousePressed && mouseX<width*2/3 && mouseX>width/3 && mouseY<height/8){
      state="screen2";
      count=0;
    }
    else if (mouseX<width*2/3 && mouseX>width/3 && mouseY<height/8){
      r2=255;
    }
    else if(mouseX > width*2/3 && mouseY > height/8){
      r2=200;
    }
    else if(mouseX < width/3 && mouseY > height/8){
      r2=200;
    }
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
  }
}

class Ball {
  
  float x, y;
  float direction1;
  float direction2;
  
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
    }
    else if (x < 20) {
      direction1 = 8;
    }
    else if ((y > (height-60))) {
      direction2 = -10;
    }
    else if (y<(height/8) + 20) {
      direction2 = 10;
    }
  }
  void display() {
    ellipseMode(CENTER);
    ellipse(x, y, 20, 20);
  }
}