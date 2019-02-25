public class shooterEnemy extends gameObject {

  long lastBullet = 0;

  public shooterEnemy(int gx, int gy, int type) {
    super(gx, gy, ENEMY);            
    w = 96; 
    h = 128;
    this.HEALTH = 250;
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
  @Override
    public void tick() {

    int curr = (int) (this.x - handler.obj.get(0).x);

    if (abs(curr) <= 350) {

      if (curr > 0) {                      

        if (millis() - this.lastBullet > 750) {
          this.lastBullet = millis();
          handler.obj.add(new Bullet((int)x, (int)y+98, -BULLET_VEL));
        }
      } else {
        if (millis() - this.lastBullet > 750) {
          this.lastBullet = millis();
          handler.obj.add(new Bullet((int)x, (int)y+98, +BULLET_VEL));
        }
      }
    }

    collision();
  }


  void collision() {

    collRect m = getBoundsTop();

    for (int i = 1; i < handler.obj.size(); i++) {

      gameObject temp = handler.obj.get(i);

      if (temp.type == BULLET && intersection(m, temp.getBoundsTop())) {

        this.HEALTH -= 4 ;
      }
    }
  }

  public void render() {

    image(tex.player_list.get(tex.player_list.size() - 1), x, y);
  }
}
