public class platform extends gameObject {


  public platform(int x, int y, int type) {
    super(x, y, BLOCK);
    this.angle = type;
    this.x = x;
    this.y = y;
    this.w = 32;
    this.h = 32;
  }

  collRect getBoundsRight() {
    return new collRect((int) (this.x + w), (int) this.y, 5, 32);
  }
  collRect getBoundsLeft() {
    return new collRect((int)this.x - 5, (int) this.y, 5, 32);
  }
  collRect getBoundsTop() {
    return new collRect((int)this.x, (int) this.y, (int)this.w, (int)this.h);
  }
  collRect getBoundsBottom() {
    return null;
  }

  void render() { 
    switch((int)angle) {
    case 1: 
      image(tex.block_list.get(0), x, y); 
      break;
    case 2: 
      image(tex.block_list.get(1), x, y); 
      break;
    case 3: 
      image(tex.block_list.get(2), x, y); 
      break;
    case 4: 
      image(tex.block_list.get(3), x, y); 
      break;
    case 5: 
      image(tex.block_list.get(4), x, y); 
      break;    
    case 6: 
      image(tex.block_list.get(5), x, y); 
      break;
    case 7: 
      image(tex.block_list.get(6), x, y); 
      break;
    case 8: 
      image(tex.block_list.get(7), x, y); 
      break;    
    case 9: 
      image(tex.block_list.get(18), x, y); 
      break;
    case 10: 
      image(tex.block_list.get(19), x, y); 
      break;
    case 11: 
      image(tex.block_list.get(16), x, y); 
      break;
    }    
    //rect(this.x,this.y, this.w, this.h);
    //rect( (float) getBoundsLeft().x, (float) getBoundsLeft().y, getBoundsLeft().getWidth(), getBoundsLeft().getHeight());
    //rect( (float) getBoundsRight().x, (float) getBoundsRight().y, getBoundsRight().getWidth(), getBoundsRight().getHeight());
  }

  void tick() {
  }
}
