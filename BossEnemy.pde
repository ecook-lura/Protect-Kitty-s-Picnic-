class BossEnemy extends Enemy{
 
  int bHealth = 6;
  ArrayList<Projectile> birds;
  int frames;
  
  
  BossEnemy(PVector pos, PVector vel, int bHealth){
   super(pos, vel, 6);
   this.bHealth=bHealth;
   birds = new ArrayList<Projectile>();
  }
  
  void killed(){
   super.killed();
   deathTimer = 180;
  }
  
  void update(){
   super.update();
   if(!dying && frames%15==0){
     enemyFire();
  }
  for(int i = birds.size()-1; i >= 0; i--){
  Projectile b = birds.get(i);

  b.update();
  b.drawEvilMe();
  b.hitPlayer(player);

  if(!b.isAlive) birds.remove(i);
}
  
  }
  
  
  void enemyFire(){
   birds.add(new Projectile(new PVector(pos.x, pos.y), new PVector(1,10)));
    }
  
  
  void drawMe(){
    frames++;
    pushMatrix();
    if(!dying){
    fill(255,0,0);
    translate(pos.x, pos.y);
    scale(3,3);
    ellipse(0, 0, eWidth-25, eWidth);
    triangle(0, 0, -30, -10, -10, 10);
    triangle(0, 0, 30, -10, 10, 10);
    fill(0);
    ellipse(-5, 20, 5, 5);
    ellipse(5, 20, 5, 5);
    textAlign(CENTER);
    textSize(10);
    text(eHealth, 0,0);
    
    }
    if(dying){
     float shrink = map(deathTimer, 60, 0, eWidth, 0);
     fill(255,0,0);
     translate(width/2,height/2.5);
     ellipse(0, 0, shrink, shrink);
     triangle(0*shrink, 0*shrink, -30/shrink, -10/shrink, -10/shrink, 10/shrink);
     triangle(0, 0, 30/shrink, -10/shrink, 10/shrink, 10/shrink);
     ellipse(-5, 20, 5+shrink, 5+shrink);
     ellipse(5, 20, 5+shrink, 5+shrink);
    } 
    popMatrix();
  }
  
}
