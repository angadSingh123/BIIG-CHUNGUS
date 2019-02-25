class basicEnemy extends gameObject {

  int chosenImage = (int) (random(32768) % 3) + 9;
  collRect myRect;

  public basicEnemy(int gx, int gy) {
    super(gx, gy, ENEMY); 
    velX = (random(-1,1) >= 0 ) ? 3 : -3;            
    this.w = 32;
    this.h = 32;
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


  void collision() {

    gameObject obj;

    for (int i = 0; i < handler.obj.size(); i++) {      

      obj = handler.obj.get(i);

      myRect = this.getBoundsTop(); 

      if (obj.type == BLOCK && intersection(myRect, obj.getBoundsLeft())) {
        this.velX *= -1;
      } else if (obj.type == BLOCK && intersection(myRect, obj.getBoundsRight())) {
        this.velX *= -1;
      } else if (obj.type == BULLET && intersection(myRect, obj.getBoundsTop())) {
        this.HEALTH--;
        if (this.HEALTH <= 0) {
          handler.obj.remove(this);
        }
      }
    }
  }

  public void tick() {
    x += velX;
    collision();
  }

  public void render() {

    //rect(x, y, 32, 32);
    //rect( (float) getBoundsTop().x, (float) getBoundsTop().y, getBoundsTop().getWidth(), getBoundsTop().getHeight());
    image(tex.player_list.get(chosenImage), x, y);
  }
}
