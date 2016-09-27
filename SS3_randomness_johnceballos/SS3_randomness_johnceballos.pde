//john ceballos, randomness
float R;
float G;
float B;
float X=255;
float Y=255;
float Z=255;
PFont f;

void setup(){
  size(800,800);
  background(255);
  rectMode(CENTER);
  ellipseMode(CENTER);
  f = createFont("Georgia", 16);
  textAlign(CENTER);
}
void draw(){
  background(X,Y,Z);
  for (int X=0; X<=800; X=X+10){
    R = random(255);
    G = random(255);
    B = random(255);
    stroke(R,G,B);
    line(X,0,X,800);
    stroke(R,G,B);
    line(0,X,800,X);
  }
  if(mouseX<=200 && mouseY<=200){
   fill(206,146,250);
   ellipse(100,100,200,200);
 }
 else if(mouseY>=350 && mouseY<=450 && mouseX>=350 && mouseX<=450){
   fill(250,245,146);
   rect(400,400,100,100);
 }
else if(mouseY>=650 && mouseY<750 && mouseX>=650 && mouseX<=750){
  fill(146,239,250);
  rect(700,700,100,100);
 }
}  

void mousePressed(){
textFont(f, 36);
fill(0);
text("wow", 400,400);
}
 void keyPressed(){
   X=random(255);
   Y=random(255);
   Z=random(255);
 }