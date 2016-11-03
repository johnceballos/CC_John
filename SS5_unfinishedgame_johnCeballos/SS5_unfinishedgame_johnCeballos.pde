import gab.opencv.*;
import processing.video.*;
int cellsize=20;
int cols,rows;
Ball ball1;
Capture video;
OpenCV opencv;
Contour contour;

void captureEvent(Capture video){
  video.read();
  cols = width/cellsize;
  rows = height/cellsize;
}
void setup(){
 size(640,480);
 video = new Capture(this,width,height);
 opencv = new OpenCV(this, width, height);
  
 opencv.startBackgroundSubtraction(5, 3, .7);
 video.start();
 ball1 = new Ball(20,20);
}
void draw(){
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
       ball1.direction1 = ball1.direction1* -1;
     }
     if (contour.containsPoint(int(ball1.x+10), int(ball1.y)) ==true){
       ball1.direction1 = ball1.direction1* -1;
     }
     if (contour.containsPoint(int(ball1.x), int(ball1.y+10)) ==true){
       ball1.direction2 = ball1.direction2*  -1;
     }
     if (contour.containsPoint(int(ball1.x), int(ball1.y-10)) ==true){
       ball1.direction2 = ball1.direction2* -1;
     }
     
     if (contour.containsPoint(int(ball1.x-10), int(ball1.y-10)) ==true){
       ball1.direction1 = ball1.direction2*-1;
       ball1.direction2 = ball1.direction1* -1;
     }
     if (contour.containsPoint(int(ball1.x+10), int(ball1.y-10)) ==true){
       ball1.direction1 = ball1.direction2*-1;
       ball1.direction2 = ball1.direction2* -1;
     }
     if (contour.containsPoint(int(ball1.x+10), int(ball1.y+10)) ==true){
       ball1.direction2 = ball1.direction1*-1;
       ball1.direction1 = ball1.direction2*-1;
     }
     if (contour.containsPoint(int(ball1.x+10), int(ball1.y-10)) ==true){
       ball1.direction2 = ball1.direction1*-1;
       ball1.direction1 = ball1.direction2*-1;
     }
     
  }
  fill(171,5,255);
  ball1.move();
  ball1.display();
}

class Ball {
  
  float x, y;
  float direction1 = 2;
  float direction2 = 2.5;
  
  Ball(float xpos, float ypos) {
    x = xpos;
    y = ypos;
  }
 
  void move() {
    x = x+ direction1;
    y = y+ direction2;
    if ((x > (width - 20))) {
      direction1 *= -1;
    }
    if (x < 20) {
      direction1 *= -1;
    }
    if ((y > (height-20))) {
      direction2 *= -1;
    }
    if (y<20) {
      direction2 *= -1;
    }
  }
  void display() {
    ellipseMode(CENTER);
    ellipse(x, y, 20, 20);
  }
}