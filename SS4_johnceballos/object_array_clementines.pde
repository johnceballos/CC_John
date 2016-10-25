Clementine clementine; //create object/class
Clementine [] clem = new Clementine[1000];
PImage img;//image setup

void setup(){
  size(800,800);
  img=loadImage("clementine.png");//load
  for (int i=0; i< clem.length; i++){
    clem [i] = new Clementine(random(width),random(height-10000,800),random(100));//initiate
  }
}
void draw(){
  background(255,183,106);
  textSize(36);
  fill(255);
  for  (int i=0; i< clem.length; i++){
  clem[i].display();
  if(mousePressed){
    clem[i].gravity();
  }
  }
}

class Clementine{
  float x;//variable setup
  float y;
  float size;
  float speed;
  Clementine(float tempX, float tempY, float tempsize){ //constructor
    x=tempX;
    y=tempY;
    size=tempsize;
  }
  void gravity(){
    speed = 10;
    y = y+speed;
  }
  void display(){ //display
    image(img,x,y,size,size);
  }
}