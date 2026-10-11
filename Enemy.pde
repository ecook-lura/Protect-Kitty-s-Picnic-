class Enemy extends Character {
  float eWidth;
  int eHealth = 2;
  boolean dying = false;
  int deathTimer = -1;
  
 Enemy(PVector pos, PVector vel, int eHealth) {
  super(pos, vel, 50, 50, 2);
  this.eHealth=eHealth;
  eWidth = 50;
}

void update() {
  super.update();
  if(dying){
   deathTimer --;
  }
  if(deathTimer == 0){
    enemies.remove(this);
    dying = false;
  }
  
}
  
  void killed() {
    dying = true;
    deathTimer = 60;
    killCount++;
}

  void drawMe() {
    if(!dying){
    pushMatrix();
    fill(0);
    translate(pos.x, pos.y);
    ellipse(0, 0, eWidth-25, eWidth);
    triangle(0, 0, -30, -10, -10, 10);
    triangle(0, 0, 30, -10, 10, 10);
    fill(255,0,0);
    ellipse(-5, 20, 5, 5);
    ellipse(5, 20, 5, 5);
    
    popMatrix();
    }
    if(dying){
     pushMatrix();
     float shrink = map(deathTimer, 60, 0, eWidth, 0);
     fill(255,0,0);
     translate(pos.x, pos.y);
     ellipse(0, 0, shrink, shrink);
     triangle(0*shrink, 0*shrink, -30/shrink, -10/shrink, -10/shrink, 10/shrink);
     triangle(0, 0, 30/shrink, -10/shrink, 10/shrink, 10/shrink);
     fill(255,0,0);
     ellipse(-5, 20, 5+shrink, 5+shrink);
     ellipse(5, 20, 5+shrink, 5+shrink);
    
     popMatrix();
    }
  }
}
