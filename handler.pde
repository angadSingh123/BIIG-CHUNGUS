PImage bg, levelOneBackground, level3Background, level3Background2;

public boolean entered = false;

class handler {
  public ArrayList<gameObject> obj = new ArrayList(); 
  public ArrayList <gameObject> nonTicking = new ArrayList();
  int i;

  void tick()
  {    
    if (state == GAME) {
      for ( i = 0; i < obj.size(); i ++) { 
        obj.get(i).tick();
      }
    }
  }

  void updateGraphics() {     

    switch(level) {
    case 1:
      background(0);
      for (i = 0; i < 2; i++)
        image(levelOneBackground, obj.get(0).x + levelOneBackground.width*i + OFFSET - 250, 0); 
      break;

    case 2:         
      background(160, 160, 160, 140);
      b = new textBox(800, 256, "Wait for the elevator. Don't worry. It'll be here.", 22);
      b.display();        
      break;

    case 3:         

      background(0, 0, 0);

      for (i = 0; i < 3; i++)
        image(level3Background, obj.get(0).x + level3Background.width*i + OFFSET - 250, 0);

      if (handler.obj.get(0).x > 4701) {
        for (i = 0; i < 8; i++)
          image(level3Background2, obj.get(0).x + level3Background2.width*i + OFFSET -250, 0);
        dangerZone = true;
      }

      if (dangerZone && !entered) {

        for (i = 0; i < 15; i++)
          handler.obj.add(new platform(4680, (0 + i) *32, 1));
        player.x = 4708;
        entered = true;
      }

      textBox bb = new textBox(5600, 128, "We ate fat Chungus, you're late bunny", 22);
      bb.display();
      break;
    }

    for ( i = 1; i < obj.size(); i++) {
      obj.get(i).render();
    }

    obj.get(0).render();

    for ( i = 0; i < nonTicking.size(); i++) { 
      nonTicking.get(i).render();
    }
  }

  void menuScreen() {

    background(0);
    translate(-camera.getX(), -camera.getY());
    textSize(60);
    fill(80, 192, 128);
    image(bg, 0, 0);
    textBox bbbb = new textBox(width/2 - 250, height/2, "BIG CHUNGUS' SON!", 50);
    bbbb.display();
    fill(255, 0, random(65));
    textSize(23);
    text("ENTER TO ESCAPE TO MENU AT ANYTIME SPACE IS BULLET ARROW KEYS NAVIGATE ",width/2 - 350, height/2 + 100);
    rect(width/2 - 50, height/2 + 100, 100, 25);
    rect(width/2 - 50, height/2 + 130, 100, 25);
    rect(width/2 - 50, height/2 + 160, 100, 25);
    rect(width/2 - 50, height/2 + 190, 100, 25);
    if (mouseX > (width/2 - 50) &&
      mouseX < (width/2 - 50) + 100 &&
      mouseY > (height/2 + 100) && mouseY < (height/2 + 100 +25) && mousePressed
      ) {
      state = CUTSCENE;
      level = 1;
      levelLoader(1);
      player= handler.obj.get(0);
    }

    if (mouseX > (width/2 - 50) &&
      mouseX < (width/2 - 50) + 130 &&
      mouseY > (height/2 + 130) && mouseY < (height/2 + 130 +25) && mousePressed
      ) {
      state = CUTSCENE;
      level = 2;
      levelLoader(2);
      player= handler.obj.get(0);
    }

    if (mouseX > (width/2 - 50) &&
      mouseX < (width/2 - 50) + 160 &&
      mouseY > (height/2 + 160) && mouseY < (height/2 + 160 +25) && mousePressed
      ) {
      state = CUTSCENE;
      level = 3;
      levelLoader(3);
      player= handler.obj.get(0);
    }
  }

  void clearArrays() {      
    obj.clear();
    nonTicking.clear();
  }
}
