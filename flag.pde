class Flag extends gameObject {

  Texture tex = new Texture(); 
  public Flag(int gx, int gy) {
    super(gx, gy, FLAG);
  }
  public void tick() {
  }
  collRect getBoundsRight() {
    return null;
  }
  collRect getBoundsLeft() {
    return null;
  }
  collRect getBoundsTop() {
    return new collRect((int)this.x, (int) this.y, PLAYER_WIDTH, PLAYER_HEIGHT);
  }
  collRect getBoundsBottom() {
    return null;
  } 
  public void render() {
    image(tex.block_list.get(21), x, y);
  }
  
}
