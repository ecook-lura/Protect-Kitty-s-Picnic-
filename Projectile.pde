class Projectile {
 PVector pos, vel, dim;
 boolean isAlive;
 
 Projectile(PVector pos, PVector vel){
  this.pos=pos;
  this.vel=vel;
  dim=new PVector(5,25);
  isAlive=true;
 }
 
 void handleWalls(){
  if (abs(pos.x-width/2)>width/2||abs(pos.y-height/2)>height/2){
   isAlive=false; 
  }
 }
 
 void move(){
  pos.add(vel); 
 }
 
 void update(){
  move();
  handleWalls();
 }
 
 void hitPlayer(Player p){
  if(p.eCooldown==0 && abs(pos.x-p.pos.x)<dim.x/2+p.charWidth/2 &&
     abs(pos.y-p.pos.y)<dim.y/2+p.charWidth/2){
    p.eCooldown = 6;
    p.health--;
    isAlive=false;
  }
}
 
 void hit(Enemy e){
  if(!e.dying && abs(pos.x-e.pos.x)<dim.x/2+e.eWidth/2 && abs(pos.y-e.pos.y)<dim.y/2+e.eWidth/2){
   e.eHealth--;
   isAlive=false;
   if(e.eHealth<=0) e.killed();
  }
 }
 
 void drawMe(){
  pushMatrix();
  translate(pos.x,pos.y);
  noStroke();
  fill(150,150,250);
  ellipse(0,0,15,30);
  triangle(0,0,-15,25,5,15);
  triangle(0,0,25,25,0,15);
  fill(0);
  ellipse(-5,-10,5,5);
  fill(100,100,200);
  ellipse(0,4,7,7);
  fill(150,150,250);
  ellipse(0,2,7,7);
  popMatrix();  
 }
 
 void drawEvilMe(){
  pushMatrix();
    translate(pos.x,pos.y);
    noStroke();
    fill(0);
    ellipse(0, 0, 25, 50);
    triangle(0, 0, -30, -10, -10, 10);
    triangle(0, 0, 30, -10, 10, 10);
    fill(255,0,0);
    ellipse(-5, 20, 5, 5);
    ellipse(5, 20, 5, 5);
    popMatrix();
 }
 
}
