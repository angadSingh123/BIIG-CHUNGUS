class cube extends gameObject {

  float var = 0;
  int col = (int)random(255);
  cube(int x, int y) {
    super(x, y, CUBE);
  }

  collRect getBoundsRight() {
    return null;
  }
  collRect getBoundsLeft() {
    return null;
  }
  collRect getBoundsTop() {
    return null;
  }
  collRect getBoundsBottom() {
    return null;
  }

  void tick() {
    var += 0.05;
  }

  void render() {

    pushMatrix();
    translate(x, y, 50);
    rotateX(var);
    rotateY(var);
    fill(col, 255, col);
    box(40);
    popMatrix();
  }
  
}
