 final int offset = 250;
 class camera {

   float x, y; 

  public camera(float x, float y) {
    this.x = x;
    this.y = y;
  }

  public void tick(gameObject Player) {

    this.x = -Player.x + offset;
  }

  public  void setX(float getX) { 
    camera.x = getX;
  }

  public  void setY(float getY) { 
    camera.y = getY;
  }

  public  float getX() {
    return camera.x;
  }

  public  float getY() {
    return camera.y;
  }
}
