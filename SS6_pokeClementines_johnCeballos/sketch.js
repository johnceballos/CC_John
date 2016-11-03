//poke the clementine, john ceballos, mouse interaction isnt perfect but use mouse to poke at the bouncing clementine

var img;
var x = 200;
var y = 300;
var speed1 = 2;
var speed2 = 2;

function preload(){//to load image
  img=loadImage("clementine.png");
}

function setup() {
  createCanvas(displayWidth,displayHeight);
  imageMode(CENTER);
}

function draw() {
  background(171,232,230);
  image(img,x,y,100,100);
  move(x,y,speed1,speed2)
}
function move(){
  
  x = x+ speed1;
  y = y+ speed2;
  
  if ((x >= (width - 50))) {
    x = width -50;
    speed1 = (speed1 * -1);
  }
  else if (x <= 50) {
    x = 50;
    speed1 = (speed1 * -1);
  }
  else if ((y >= (height-50))) {
    y = height -50;
    speed2 = (speed2 * -1);
  }
  else if (y<=50) {
    y = 50;
    speed2 = (speed2 * -1);
  }
  else if (x>mouseX-50 && x<mouseX+50 && y>mouseY-50 && y<mouseY+50){
    speed1 = (speed1 * -1);
    speed2 = (speed2 * -1);
  }
}