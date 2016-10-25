//Angela creater the cheese class, John Ceballos and Leo Wang added the colorChange method and changed move method for diagonal motion. title: pink and purple cheese
Cheese[] cheese;

 
void setup() {
  size(700, 700);
  int numCheese = 100;
  int dia = height/numCheese;
  
  
  cheese = new Cheese[numCheese];
  
  //initialize objects by calling the constructor with a for loop
  for (int i = 0; i < cheese.length; i++) {
    float x = dia/2 + i*dia;
    float y = dia/2 + i*dia;
    float rate = random(0.1, 2.0);
    cheese[i] = new Cheese(x, y, dia, rate);
  }
 noStroke ();
}
 
void draw() {
  fill(0, 12);
  rect(0, 0, width, height);
  
  
  
  fill(171,5,255);
  for (int i = 0; i< cheese.length; i++) {
    cheese[i].colorChange();
    cheese[i].move();
    cheese[i].display();
    cheese[i].change();
  }
}
class Cheese {
  
  float diameter;
  float speed;
  float x, y;
  int direction1 = 1;
  int direction2 = 1;


 
  //Constructor
  Cheese(float xpos, float ypos, float dia, float sp) {
    x = xpos;
    y = ypos;
    diameter = dia;
    speed = sp;
  }
 
  void move() {
    x += (speed * direction1);
    y += ((speed * .5) * direction2);
    if ((x> (width - diameter))) {
      direction1 *= -1;
    }
    if (x<(diameter)) {
      direction1 *= -1;
    }
    if ((y > (height-diameter))) {
      direction2 *= -1;
    }
    if (y<(diameter)) {
      direction2 *= -1;
    }
}
 
void change(){
  if (x > 200) {
    direction1 *= 1;
    direction2 *= 1;
}
}
void colorChange(){
  if(mouseX<x+3.5 && mouseX>x-3.5 && mouseY<y+3.5 && mouseY>y-3.5){
    fill(255,5,193);
  }
}
void display() {
  ellipse(x, y, diameter*3, diameter);
}
}