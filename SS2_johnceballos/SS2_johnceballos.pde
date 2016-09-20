//PartyBox
//keypress to clear background in new color
//mousepress to create
int number=0;
float R;
float G;
float B;
float X;
float Y;
float Z;

void setup(){
  size (800,800);
}
void draw() {
}

void keyPressed() {
R = random(255);
G = random(255);
B = random(255);
  background(R,G,B);
}

void mousePressed() {
redraw();
  R = random(255);
G = random(255);
B = random(255);
X = random(400);
Y = random(800);
Z = random(800);
    noFill();
    stroke(R,G,B);
    strokeWeight(20);
      ellipseMode(CENTER);
     ellipse(mouseX,mouseY,X,X);
     noStroke();
     fill(R,G,B);
     rectMode(CENTER);
     rect(Y,Z,20,20);
}

  
     