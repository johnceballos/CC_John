//unfinished game, john ceballos, the final plan is to have it so that your motion can change the balls direction

import gab.opencv.*;
import processing.video.*;
int cellsize=20;
int cols,rows;
Ball ball1;
Capture video;
OpenCV opencv;

void captureEvent(Capture video){ //reads camera
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
  video.loadPixels();//causes pixelated effect and records pixel color
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
  
  opencv.updateBackground();
  
  opencv.dilate();
  //opencv.erode();

  fill(255,0,0);
  stroke(255, 0, 0);
  strokeWeight(3);
  for (Contour contour : opencv.findContours()) {// draws contours in live video feed
    contour.draw();
  }
  
  fill(171,5,255);
  ball1.move();
  ball1.display();
}

class Ball {//classic bouncing ball class
  
  float x, y;
  int direction1 = 2;
  int direction2 = 2;
  
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
  ellipse(x, y, 20, 20);
  }
}