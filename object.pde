class object extends gameObject {

  Animation windowAnimation;

  object(int x, int y, int TYPE_OF_OBJECT) {

    super(x, y, TYPE_OF_OBJECT);
    this.angle = TYPE_OF_OBJECT;

    switch((int) this.angle) {

    case WINDOW:

      int size =  tex.block_list.size() - 23;

      PImage[] array = new PImage[size];

      for (int i = 0; i < size; i++) array[i] =  tex.block_list.get(22 + i);

      windowAnimation = new Animation(10, array);

      break;
    }
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

  void tick() {

    switch((int) angle) {

    case WINDOW: 
      windowAnimation.runAnimation(); 
      break;
    }
  }

  void render() {

    switch((int) angle) {          

    case ELEVATOR: 
      image(tex.block_list.get(20), x, y); 
      break;      

    case WINDOW: 
      try {
        strokeWeight(10);
        stroke(128,128,128);
        rect(x, y, 300, 200);
        stroke(0);
        strokeWeight(1);
        windowAnimation.drawAnimation((int)x, (int)y);
      } 
      catch(Exception e) {
      } 
      break;
    }
  }
}
