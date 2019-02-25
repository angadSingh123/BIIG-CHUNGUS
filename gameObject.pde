final int PLAYER = 1;
final int ENEMY = 2;
final int BOSS = 3;
final int BLOCK = 4;
final int BULLET = 5;
final int ELEVATOR = 6;
final int FLAG = 7;
final int WINDOW = 8;
final int CUBE = 9;


final int BULLET_LIFETIME = 3 * 1000;
final int BULLET_VEL = 10;

final int MAX_HEALTH = 20;

final int LEFT = 1;
final int RIGHT = 2;

final int MAX_SPEED = 100;
final float GRAVITY = 2.1;
final int VELX = 5;
final int VELY = 5;
final int MULT = 5;

final int PLAYER_HEIGHT = 32;
final int PLAYER_WIDTH = 32;

final int MENU = 0;
final int GAME = 1;
final int CUTSCENE = 2;

final int tileSpecs = 34;

PFont font; 

protected PImage player_image, enemy_image, block_image, bullet_image;

abstract class gameObject {

  protected float type, x, y, z, HEALTH, velX, velY, facing, h, w, angle;
  boolean jumping = !true, falling = !true, rotating = !true;  


  gameObject(int x, int y, int type) {
    this.x = x;
    this.y = y;
    this.type = type;
    switch(type) {
    case PLAYER: 
      this.HEALTH = MAX_HEALTH; 
      break;
    case ENEMY: 
      this.HEALTH = 20;  
      break;
    case BOSS:
      this.HEALTH = 100;
      break;
    }
  }

  abstract void render();

  abstract void tick();

  void setPosx(float x) {
    this.x = x;
  }

  void setPosy(float y) {
    this.y = y;
  }

  void setVelx(float velx) {
    this.velX = velx;
  } 


  void setVely(float vely) {
    this.velY = vely;
  }

  void setHealth(float x) {
    this.HEALTH = x;
  }   

  float getY() {
    return this.y;
  }

  float getX() {
    return this.x;
  }

  float getHeight() {
    return this.h;
  }

  boolean intersection(collRect myRect, collRect r) {  

    if ( r.x < myRect.x + myRect.bwidth &&
      r.x + r.bwidth > myRect.x &&
      r.y < myRect.y + myRect.bheight &&
      r.y + r.bheight > myRect.y)
      return true;
    else return false;
  }

  abstract collRect getBoundsRight();
  abstract collRect getBoundsLeft();
  abstract collRect getBoundsTop();
  abstract collRect getBoundsBottom();
}
