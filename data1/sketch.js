var chart,rowCount;

function preload(){
  chart = loadTable('chart.csv');
}

function setup() {
  rectMode(CENTER);
  createCanvas(displayWidth,displayHeight);
  background(255,230,129);
  rowCount = chart.getRowCount();
  normal = [];
  fire = [];
  water = [];
  electric = [];
  grass = [];
  ice = [];
  fighting = [];
  poison = [];
  ground = [];
  flying = [];
  psychic = [];
  bug = [];
  rock = [];
  ghost = [];
  dragon = [];
  dark = [];
  steel = [];
  fairy = [];

  for(var i = 1; i < rowCount; i++){
    
    normal[i] = chart.get(i,1);
    fire[i] = chart.get(i,2);
    water[i] = chart.get(i,3);
    electric[i] = chart.get(i,4);
    grass[i] = chart.get(i,5);
    ice[i] = chart.get(i,6);
    fighting[i] = chart.get(i,7);
    poison[i] = chart.get(i,8);
    ground[i] = chart.get(i,9);
    flying[i] = chart.get(i,10);
    psychic[i] = chart.get(i,11);
    bug[i] = chart.get(i,12);
    rock[i] = chart.get(i,13);
    ghost[i] = chart.get(i,14);
    dragon[i] = chart.get(i,15);
    dark[i] = chart.get(i,16);
    steel[i] = chart.get(i,17);
    fairy[i] = chart.get(i,18);
  }
}

function draw() {
  stroke(230,230,129);
  strokeWeight(2);
  noFill();
  for(var i = 1; i < rowCount; i++){
    if (normal[i] == 2){
      fill(255);
      rect(width* 1/19, height * i/19, 40,40);
      noFill();
    }
    if(normal[i] == 1){
      rect(width* 1/19, height * i/19, 20,20);
      rect(width* 1/19, height * i/19, 10,10);
    }
    if(normal[i] == .5){
      rect(width* 1/19, height * i/19, 10,10);
    }
    if (fire[i] == 2){
      fill(255,0,0);
      rect(width* 2/19, height * i/19, 40,40);
      noFill();
    }
    if(fire[i] == 1){
      rect(width* 2/19, height * i/19, 20,20);
      rect(width* 2/19, height * i/19, 10,10);
    }
    if(fire[i] == .5){
      rect(width* 2/19, height * i/19, 10,10);
    }
    if (water[i] == 2){
      fill(129,193,255);
      rect(width* 3/19, height * i/19, 40,40);
      noFill();
    }
    if(water[i] == 1){
      rect(width* 3/19, height * i/19, 20,20);
      rect(width* 3/19, height * i/19, 10,10);
    }
    if(water[i] == .5){
      rect(width* 3/19, height * i/19, 10,10);
    }
    if (electric[i] == 2){
      fill(244,255,129);
      rect(width* 4/19, height * i/19, 40,40);
      noFill();
    }
    if(electric[i] == 1){
      rect(width* 4/19, height * i/19, 20,20);
      rect(width* 4/19, height * i/19, 10,10);
    }
    if(electric[i] == .5){
      rect(width* 4/19, height * i/19, 10,10);
    }
    if (grass[i] == 2){
      fill(149,227,105);
      rect(width* 5/19, height * i/19, 40,40);
      noFill();
    }
    if(grass[i] == 1){
      rect(width* 5/19, height * i/19, 20,20);
      rect(width* 5/19, height * i/19, 10,10);
    }
    if(grass[i] == .5){
      rect(width* 5/19, height * i/19, 10,10);
    }
    if (ice[i] == 2){
      fill(203,255,251);
      rect(width* 6/19, height * i/19, 40,40);
      noFill();
    }
    if(ice[i] == 1){
      rect(width* 6/19, height * i/19, 20,20);
      rect(width* 6/19, height * i/19, 10,10);
    }
    if(ice[i] == .5){
      rect(width* 6/19, height * i/19, 10,10);
    }
    if (fighting[i] == 2){
      fill(191,147,81);
      rect(width* 7/19, height * i/19, 40,40);
      noFill();
    }
    if(fighting[i] == 1){
      rect(width* 7/19, height * i/19, 20,20);
      rect(width* 7/19, height * i/19, 10,10);
    }
    if(fighting[i] == .5){
      rect(width* 7/19, height * i/19, 10,10);
    }
    if (poison[i] == 2){
      fill(width,95,242)
      rect(width* 8/19, height * i/19, 40,40);
      noFill();
    }
    if(poison[i] == 1){
      rect(width* 8/19, height * i/19, 20,20);
      rect(width* 8/19, height * i/19, 10,10);
    }
    if(poison[i] == .5){
      rect(width* 8/19, height * i/19, 10,10);
    }
    if (ground[i] == 2){
      fill(113,87,58);
      rect(width* 9/19, height * i/19, 40,40);
      noFill();
    }
    if(ground[i] == 1){
      rect(width* 9/19, height * i/19, 20,20);
      rect(width* 9/19, height * i/19, 10,10);
    }
    if(ground[i] == .5){
      rect(width* 9/19, height * i/19, 10,10);
    }
    if (flying[i] == 2){
      fill(216);
      rect(width* 10/19, height * i/19, 40,40);
      noFill();
    }
    if(flying[i] == 1){
      rect(width* 10/19, height * i/19, 20,20);
      rect(width* 10/19, height * i/19, 10,10);
    }
    if(flying[i] == .5){
      rect(width* 10/19, height * i/19, 10,10);
    }
    if (psychic[i] == 2){
      fill(255,170,255);
      rect(width* 11/19, height * i/19, 40,40);
      noFill();
    }
    if(psychic[i] == 1){
      rect(width* 11/19, height * i/19, 20,20);
      rect(width* 11/19, height * i/19, 10,10);
    }
    if(psychic[i] == .5){
      rect(width* 11/19, height * i/19, 10,10);
    }
    if (bug[i] == 2){
      fill(28,255,37);
      rect(width* 12/19, height * i/19, 40,40);
      noFill();
    }
    if(bug[i] == 1){
      rect(width* 12/19, height * i/19, 20,20);
      rect(width* 12/19, height * i/19, 10,10);
    }
    if(bug[i] == .5){
      rect(width* 12/19, height * i/19, 10,10);
    }
    if (rock[i] == 2){
      fill(152,140,100);
      rect(width* 13/19, height * i/19, 40,40);
      noFill();
    }
    if(rock[i] == 1){
      rect(width* 13/19, height * i/19, 20,20);
      rect(width* 13/19, height * i/19, 10,10);
    }
    if(rock[i] == .5){
      rect(width* 13/19, height * i/19, 10,10);
    }
    if (ghost[i] == 2){
      fill(122,86,147);
      rect(width* 14/19, height * i/19, 40,40);
      noFill();
    }
    if(ghost[i] == 1){
      rect(width* 14/19, height * i/19, 20,20);
      rect(width* 14/19, height * i/19, 10,10);
    }
    if(ghost[i] == .5){
      rect(width* 14/19, height * i/19, 10,10);
    }
    if (dragon[i] == 2){
      fill(255,122,21);
      rect(width* 15/19, height * i/19, 40,40);
      noFill();
    }
    if(dragon[i] == 1){
      rect(width* 15/19, height * i/19, 20,20);
      rect(width* 15/19, height * i/19, 10,10);
    }
    if(dragon[i] == .5){
      rect(width* 15/19, height * i/19, 10,10);
    }
    if (dark[i] == 2){
      fill(67,5,98);
      rect(width* 16/19, height * i/19, 40,40);
      noFill();
    }
    if(dark[i] == 1){
      rect(width* 16/19, height * i/19, 20,20);
      rect(width* 16/19, height * i/19, 10,10);
    }
    if(dark[i] == .5){
      rect(width* 16/19, height * i/19, 10,10);
    }
    if (steel[i] == 2){
      fill(100);
      rect(width* 17/19, height * i/19, 40,40);
      noFill();
    }
    if(steel[i] == 1){
      rect(width* 17/19, height * i/19, 20,20);
      rect(width* 17/19, height * i/19, 10,10);
    }
    if(steel[i] == .5){
      rect(width* 17/19, height * i/19, 10,10);
    }
    if (fairy[i] == 2){
      fill(255,3,251);
      rect(width* 18/19, height * i/19, 40,40);
      noFill();
    }
    if(fairy[i] == 1){
      rect(width* 18/19, height * i/19, 20,20);
      rect(width* 18/19, height * i/19, 10,10);
    }
    if(fairy[i] == .5){
      rect(width* 18/19, height * i/19, 10,10);
    }
  }
}