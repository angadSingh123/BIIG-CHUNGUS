class collRect {

  int x, y, bwidth, bheight;

  collRect(int myX, int myY, int myWidth, int myHeight) {    
     this.x = myX;
     this.y = myY;
     this.bwidth = myWidth;
     this.bheight = myHeight;
  }

  float getX() {
    return this.x;
  };

  float getY() {
    return this.y;
  };

  int getWidth() {
    return this.bwidth;
  }

  int getHeight() {
    return this.bheight;
  }

} 
