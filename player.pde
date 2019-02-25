
class player extends gameObject {


  Animation right = new Animation(5, tex.player_list.get(0), tex.player_list.get(1), tex.player_list.get(2), tex.player_list.get(6));   

  Animation left  = new Animation(5, tex.player_list.get(3), tex.player_list.get(4), tex.player_list.get(5), tex.player_list.get(7));


  player(int x, int y) {   

    super(x, y, PLAYER);

    this.falling = true;        

    this.w = PLAYER_WIDTH;

    this.h = PLAYER_HEIGHT;
  }

  collRect getBoundsRight() {
    return new collRect((int) this.x + PLAYER_WIDTH - 5, (int) this.y, 5, (int) this.h);
  }
  collRect getBoundsLeft() {
    return new collRect((int) this.x - 5, (int) this.y, (int) 5, (int) this.h);
  }
  collRect getBoundsTop() {
    return new collRect((int) this.x + 5, (int) this.y - 10, (int) this.w - 10, 10);
  }
  collRect getBoundsBottom() {
    return new collRect((int) this.x, (int) this.y + PLAYER_HEIGHT, (int) this.w - 5, 5);
  }

  void tick() {
    this.x += this.velX;
    this.y += this.velY;

    if (jumping || falling) {
      this.velY += GRAVITY;
      if (velY > MAX_SPEED) {
        velY = MAX_SPEED;
      }
    }

    //if (this.y > 800) exit();

    right.runAnimation();
    left.runAnimation();    
    collision();
  }

  void render() {

    //rect(this.x, this.y, this.w, this.h);    
    try {
      if (velX > 0) {
        right.drawAnimation((int)x, (int)y + 4); 
        OFFSET -= .5;
      } else if (velX < 0) {
        OFFSET += 0.5;
        left.drawAnimation((int) x, (int) y + 4);
      } else {
        if (facing == RIGHT) right.pauseAnimation((int) x, (int) y + 4);
        else left.pauseAnimation((int) x, (int) y + 4);
      }
    } 
    catch (Exception e) {
      println("Image not yet initialized " + this.toString());
    }
  }


  void collision() {

    gameObject temp;  

    for (int j = 1; j < handler.obj.size(); j++) {
      temp = handler.obj.get(j);
      intersects(temp);
    }
  }

  void intersects(gameObject object) {

    collRect r = object.getBoundsTop();

    switch((int) object.type) {

    case BLOCK: 

      collRect myRect;

      myRect = this.getBoundsTop(); 

      if (intersection(myRect, r)) {
        velY = 0;
        this.y = object.y +  (PLAYER_HEIGHT*2);
      } else {
        falling  = true;
      }

      myRect = this.getBoundsBottom();                

      if (intersection(myRect, r)) {
        this.jumping = false;
        falling= false;
        this.y = object.getY() - PLAYER_HEIGHT - 5;        
        this.velY = 0;
      } else {
        falling = true;
      } 


      myRect = this.getBoundsLeft(); 

      if (intersection(myRect, r)) {

        velX = 0;
        x = object.getX() + (object.w+5);
      } 


      myRect = this.getBoundsRight(); 

      if (intersection(myRect, r)) {

        velX = 0;
        x = object.getX() - object.w;
      }
      break;

    case FLAG:
      myRect = this.getBoundsRight(); 
      if (intersection(myRect, r)) {        
        state = MENU;
      }     
      break;

    case ENEMY:
      myRect = this.getBoundsRight();
      if (intersection(myRect, r)) {
        HEALTH-=3;
      }     
      break;

    case BULLET:
      myRect = this.getBoundsRight();
      if (intersection(myRect, r)) {
        HEALTH-=3;
      }        
      break;
    }
  }
}



//rect( (float) getBoundsBottom().x, (float) getBoundsBottom().y, getBoundsBottom().getWidth(), getBoundsBottom().getHeight());
//rect( (float) getBoundsTop().x, (float) getBoundsTop().y, getBoundsTop().getWidth(), getBoundsTop().getHeight());
//rect( (float) getBoundsLeft().x, (float) getBoundsLeft().y, getBoundsLeft().getWidth(), getBoundsLeft().getHeight());
//rect( (float) getBoundsRight().x, (float) getBoundsRight().y, getBoundsRight().getWidth(), getBoundsRight().getHeight());
//println(this.x + " " +this.y + " " + this.w + " " + this.h + " player" + mouseX + " "  +mouseY);
//println("col " + (tempRect.getY() + tempRect.getHeight()) + " " + object.getBoundsTop().getY());
