class Player extends Character{
  float dampening;
  boolean hurt = false;
  ArrayList<Projectile> bullets;
  int eCooldown = 0;
  int healChance = 0;
  int hurtCooldown = 0;
  int healWidth = 200;
  float xHeal = width/2;
  float yHeal = height/2.7;
  float bounce = 0;
  
  
  Player(PVector pos, PVector vel) {
  super(pos, vel, 100, 100, 3);
   dampening = 0.9;
   bullets = new ArrayList<Projectile>();
   
  }
  
  void accelerate(PVector acc) {
   vel.add(acc); 
  }
  
  void enemyCollision(Enemy e){
  if(!e.dying && eCooldown == 0 && abs(pos.x-e.pos.x)<charWidth/5+e.eWidth/2 && abs(pos.y-e.pos.y)<charWidth/5+e.eWidth/2){
   health -= 1;
   eCooldown = 60;
  }
 }
  
  void hp(){
   if(health==3){
    fill(250,0,0);
    ellipse(275, 725, 50, 50);
    ellipse(325, 725, 50, 50);
    triangle(250, 725, 350, 725, 300, 790);
    healChance = 0;
    hurt = false;
    
    ellipse(580, 725, 50, 50);
    ellipse(630, 725, 50, 50);
    triangle(555, 725, 655, 725, 605, 790);
    
    ellipse(885, 725, 50, 50);
    ellipse(935, 725, 50, 50);
    triangle(860, 725, 960, 725, 910, 790);
   }
   
   if(health==2){
     fill(250,0,0);
    ellipse(275, 725, 50, 50);
    ellipse(325, 725, 50, 50);
    triangle(250, 725, 350, 725, 300, 790);
    
    ellipse(580, 725, 50, 50);
    ellipse(630, 725, 50, 50);
    triangle(555, 725, 655, 725, 605, 790);
    hurt = false;
   }
    
    if(health==1){
    fill(250,0,0);
    ellipse(275, 725, 50, 50);
    ellipse(325, 725, 50, 50);
    triangle(250, 725, 350, 725, 300, 790);
    hurt = true;
    
    }
    
    if(health<3 && health>=0){
     healChance +=3;
       if(health<2){
        healChance +=5; 
       }
     }
     
     if(healChance >= 1200){
     grabHeal();
     }
    
    
  
  if(health<=0){
    healChance = 0;
   fill(250,0,0);
   rect(0,0,1200,800);
   fill(255);
   textSize(30);
   textAlign(LEFT);
   text("YOU DIED :(", 500, 300);
  }
  
  }
  void fire(){
   bullets.add(new Projectile(new PVector(pos.x, pos.y), new PVector(0,-15))); 
  }
  
  void handleWalls() {
    if (pos.x < 50){
     pos.x = width/2; pos.y = height/3;
     health += -1;
    }
    if (pos.x > width -50){
      pos.x = width/2; pos.y = height/3;
      health += -1;
    }
    if (pos.y < 15){
      pos.x = width/2; pos.y = height/3;
      health += -1;
    }
    if (pos.y > height -110){
      pos.x = width/2; pos.y = height/3;
      health += -1;
    }
  }
  
  void update(){
   super.update();
   vel.mult(dampening);
   
   if(abs(vel.x) > 0.1 || abs(vel.y) > 0.1){
  bounce += 0.2;
  }
   
   if (eCooldown > 0) {
     eCooldown -= 1;
   }
   
   for (int i = enemies.size() - 1; i >=0; i--){
     Enemy e = enemies.get(i);
     enemyCollision(e);
   }

   for (int i = bullets.size() - 1; i >= 0; i--) {
    Projectile b = bullets.get(i);
    b.update();
    b.drawMe();
    
    for (int j = enemies.size() - 1; j >= 0; j--) {
      Enemy e = enemies.get(j);
      b.hit(e);
    }

    if (!b.isAlive) bullets.remove(i);
  }
   }
  
  void grabHeal(){
    drawHeal();
    if(abs(pos.x-xHeal)<charWidth/4+healWidth/2 && abs(pos.y-yHeal)<charWidth/4+healWidth/5){
   health += 1;
   healChance = 0;
  }
  }
  
  void drawHeal(){
   fill(235,200,150);
   ellipse(width/2,height/2.7,healWidth,40);
   fill(255);
   rect(width/2.1,height/2.9,60,40);
   fill(235,200,150);
   ellipse(width/2-10,height/2.75,20,20);
   ellipse(width/2+10,height/2.75,20,20);
   triangle(width/2-20,height/2.75,width/2+20,height/2.75,width/2,height/2.55);
  }
  
  void drawChar(){
   float yOffset = sin(bounce) * 5;
   fill(50);
   // body
   ellipse(pos.x, pos.y + yOffset, 50, 50);
   
   //arms
   ellipse(pos.x-30, pos.y+10 + yOffset, 10, 10);
   ellipse(pos.x+30, pos.y+10 + yOffset, 10, 10);
   
   //ears
   triangle(pos.x-25, pos.y-10 + yOffset, pos.x-10, pos.y-50, pos.x, pos.y-10);
   triangle(pos.x+25, pos.y-10 + yOffset, pos.x+10, pos.y-50, pos.x, pos.y-10);
   
   //feet
   ellipse(pos.x-10, pos.y+30 - yOffset, 15, 15);
   ellipse(pos.x+10, pos.y+30 + yOffset*2, 15, 15);
   
   
   if(hurt){
     //eyes
       fill(200, 150, 0);
       ellipse(pos.x-10, pos.y, 15, 25);
       ellipse(pos.x+10, pos.y, 15, 25);
       fill(50);
       ellipse(pos.x-10, pos.y, 10, 10);
       ellipse(pos.x+10, pos.y, 10, 10);
     //mouth
       fill(200, 0, 0);
       triangle(pos.x-5, pos.y+15, pos.x+5, pos.y+15, pos.x, pos.y+10);
   }
   else{
     //eyes
       fill(200, 150, 0);
       ellipse(pos.x-10, pos.y, 15, 20);
       ellipse(pos.x+10, pos.y, 15, 20);
       fill(50);
       ellipse(pos.x-10, pos.y, 10, 10);
       ellipse(pos.x+10, pos.y, 10, 10);
     //mouth
       fill(200, 0, 0);
       triangle(pos.x-5, pos.y+10, pos.x+5, pos.y+10, pos.x, pos.y+15);
   }
  }
  
}
