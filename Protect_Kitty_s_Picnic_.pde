int level = 1;
boolean spawn = true;
int killCount = 0;
int totalCount;
int spawnTimer = 0;
int spawnDelay = 180;
int timerCount = 0;
Player player;
ArrayList<Enemy> enemies=new ArrayList<Enemy>();

void setup(){
  size(1200, 800);
  player=new Player(new PVector(width/2, height/2), new PVector(0,0));
  spawnRound();
  PFont font=loadFont("ComicSansMS-Bold-48.vlw");
    textFont(font);
    textSize(30);
    
}

void draw(){
  noStroke();
  background(100);
  bg();
  player.update();
  player.drawChar();
  if (up) player.accelerate(upAcc);
  if (left) player.accelerate(leftAcc);
  if (right) player.accelerate(rightAcc);
  if(down) player.accelerate(downAcc);
  
  for (int i=0; i<enemies.size(); i++) {
    Enemy e=enemies.get(i);
    e.update();
    e.drawMe();
}
  player.hp();
  
 if(enemies.size() == 0 && !spawn){
  if(level == 3){
    level = 4;
  } 
  else{
    player.pos.x = width/2;
    player.pos.y = height/3;

    spawn = true;
    spawnTimer = spawnDelay;
  }
}
if(spawn){
  spawnTimer--;
  if (player.pos.x < width/3){
     player.pos.x = width/2; player.pos.y = height/3;
    }
    if (player.pos.x > 520){
      player.pos.x = width/2; player.pos.y = height/3;
    }
    if (player.pos.y < 15){
      player.pos.x = width/2; player.pos.y = height/3;
    }
    if (player.pos.y > height -110){
      player.pos.x = width/2; player.pos.y = height/3;
    }
    pushMatrix();
    textSize(50);
    fill(0);
    text("NEW ROUND COMING", width/2-275, height/4);
    if(spawnTimer>0) timerCount = 1;
    if(spawnTimer>60) timerCount = 2;
    if(spawnTimer>120) timerCount = 3;
    if(spawnTimer==0) timerCount = 0;
    text(timerCount, width/2-15, height/2.1);
    popMatrix();
    
  if(spawnTimer <= 0){
    level++;
    spawnRound();
    spawn = false;
  }
}
if(level>3){
  
   winScreen(); 
  }
}

void spawnRound(){
 if(level==1){
   totalCount = 5;
   for (int i=0; i<5; i++) {
    enemies.add(new Enemy(new PVector(random(width/2, width-width/2), 
    random(width/2, height-width/2)), 
    new PVector(random(-5, 5), random(-5, 5)),2));
   }
 }
 if(level==2){
   totalCount = 10;
   killCount = 0;
  for (int i=0; i<10; i++) {
    enemies.add(new Enemy(new PVector(random(width/2, width-width/2), 
    random(width/2, height-width/2)), 
    new PVector(random(-5, 5), random(-5, 5)),2));
   } 
 }
 if(level==3){
   totalCount = 11;
   killCount = 0;
  for (int i=0; i<10; i++) {
    enemies.add(new Enemy(new PVector(random(width/2, width-width/2), 
    random(width/2, height-width/2)), 
    new PVector(random(-5, 5), random(-5, 5)),2));
   }
   enemies.add(new BossEnemy(new PVector(500,400), new PVector(10,10), 8));
 }
 
 spawn = false;
}


void bg(){
  fill(100, 150, 100);
  rect(width/40, height/40, width-60, height-100);
  fill(245);
  rect(width/3, height/4, width/3, height/4);
  fill(225, 75, 75);
  rect(width/3, height/4, width/10, height/12);
  rect(width/1.765, height/4, width/10, height/12);
  rect(width/3, height/2.4, width/10, height/12);
  rect(width/1.765, height/2.4, width/10, height/12);
  rect(width/2.3, height/3, width/7.67, height/12);
  
  fill(255);
  textSize(30);
  textAlign(LEFT);
  text("Space to shoot! Arrow keys to move! Dodge & shoot birds but don't touch the walls!", 20, 35);
  text("Level "+level+"   Enemies Killed: "+killCount+"/"+totalCount, 400, 670);
  
}

void winScreen(){
  noStroke();
  fill(150, 150, 250);
  rect(-100, -100, 1400, 1000);
  fill(255, 210, 0);
  ellipse(1200, 0, 400, 400);
  fill(150);
  rect(-100, 500, 1400, 20);
  fill(100, 200, 100);
  rect(-100, 520, 1400, 500);
  fill(240);
  rect(250, 575, 700, 10);
  fill(250, 100, 100);
  rect(250, 575, 230, 10);
  rect(720, 575, 230, 10);
  
  pushMatrix();
  translate(600,430);
  scale(4);
  fill(50);
   // body
   ellipse(0, 0, 50, 50);
   
   //arms
   ellipse(0-30, 0+10, 10, 10);
   ellipse(0+30, 0+10, 10, 10);
   
   //ears
   triangle(0-25, 0-10, 0-10, 0-50, 0, 0-10);
   triangle(0+25, 0-10, 0+10, 0-50, 0, 0-10);
   
   //feet
   ellipse(0-10, 0+30, 15, 15);
   ellipse(0+10, 0+30, 15, 15);
   
   //eyes
       fill(200, 150, 0);
       ellipse(0-10, 0, 15, 20);
       ellipse(0+10, 0, 15, 20);
       fill(50);
       ellipse(0-10, 0, 10, 10);
       ellipse(0+10, 0, 10, 10);
       
       fill(200, 150, 0);
       ellipse(0-10, 5, 10, 10);
       ellipse(0+10, 5, 10, 10);
       
     //mouth
       fill(200, 0, 0);
       triangle(0-5, 0+10, 0+5, 0+10, 0, 0+15);
       
       fill(255);
       textAlign(CENTER);
       text("YOU WIN!", 0, -60);
   popMatrix();
}
