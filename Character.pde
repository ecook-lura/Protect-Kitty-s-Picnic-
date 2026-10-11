class Character{
  
  PVector pos, vel;
  float charWidth;
  float charHeight;
  float health;

  Character(PVector pos, PVector vel, float charWidth, float charHeight, float health) {
    this.pos = pos;
    this.vel = vel;
    this.charWidth = charWidth;
    this.charHeight = charHeight;
    this.health=health;
  }

  void move() {
    pos.add(vel);
  }

  void handleWalls() {
    if (pos.x < -charWidth/2) pos.x = width + charWidth/2;
    if (pos.x > width + charWidth/2) pos.x = -charWidth/2;
    if (pos.y < -charWidth/2) pos.y = height + charWidth/2;
    if (pos.y > height + charWidth/2) pos.y = -charWidth/2;
  }

  void update() {
    move();
    handleWalls();
  }
  
  void drawChar(){
    
  }
  
  void accelerate(PVector acc) {
   vel.add(acc); 
  }
  
}
