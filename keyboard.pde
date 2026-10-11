PVector upAcc = new PVector(0, -1);
PVector downAcc = new PVector(0, 1);
PVector leftAcc = new PVector(-1, 0);
PVector rightAcc = new PVector(1, 0);
boolean up, down, left, right;

void keyPressed() {
 if (key==CODED) {
  if (keyCode==LEFT) left=true;
  if(keyCode==UP) up=true;
  if(keyCode==DOWN) down=true;
  if(keyCode==RIGHT) right=true;
 }
 if(key==' '){
   player.fire(); 
  }
}

void keyReleased() {
 if (key==CODED) {
  if (keyCode==LEFT) left=false;
  if(keyCode==UP) up=false;
  if(keyCode==DOWN) down=false;
  if(keyCode==RIGHT) right=false;
 }
}
