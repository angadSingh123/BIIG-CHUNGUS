class Bullet extends gameObject {

  int timeStart;

  public Bullet(int gx, int gy, int velX) {
    super(gx, gy, BULLET);
    this.velX = velX;
    timeStart = millis();
    lastBulletTime = millis(); 
    w = 10;//
    h = 5;
  }

  public void tick() {        
    x += this.velX;    
    if (millis() - timeStart > BULLET_LIFETIME) handler.obj.remove(this);
  }

  collRect getBoundsRight() {
    return null;
  }
  collRect getBoundsLeft() {
    return null;
  }
  collRect getBoundsTop() {
    return new collRect((int)this.x, (int) this.y, (int)this.w, (int)this.h);
  }
  collRect getBoundsBottom() {
    return null;
  }

  public void collision() {

    gameObject tempObject = handler.obj.get(0);
    collRect myRect = getBoundsTop();

    if (tempObject.type == PLAYER) {
      if (intersection(myRect, tempObject.getBoundsRight())) {
        tempObject.HEALTH --;
        handler.obj.remove(this);
      }

      if (intersection(myRect, tempObject.getBoundsLeft())) {
        tempObject.HEALTH --;
        handler.obj.remove(this);
      }
    } else if (tempObject.type == ENEMY) {
      if (intersection(myRect, tempObject.getBoundsTop())) {        
        tempObject.HEALTH--;
      }
    }
  }

  public void render() {    
    fill(255, 255, 45);
    rect(x, y, w, h);
  }
}
