public handler handler = new handler();
public camera camera = new camera(0, 0);
public Texture tex;
public textBox b;
public gameObject player;

private final int UP_KEY    = 38;
private final int LEFT_KEY  = 37;
private final int RIGHT_KEY = 39;
private final int SPACE = 32;

public boolean dangerZone = false;

public int level = 3;
public int state, lastBulletTime;
public float OFFSET = 0;

public boolean lastKeyPressed = false; 

public cutscene one = new cutscene();
public cutscene two = new cutscene();
public cutscene three = new cutscene();

void setup() {

  size(849, 480, P3D); 
  tex = new Texture();
  b = new textBox(width/2 - 250, height/2, "BIG CHUNGUS' SON!", 50);
  levelOneBackground = loadImage("/OneDrive - University of Toronto/image/bg.jpg");
  bg = loadImage("/OneDrive - University of Toronto/image/chung.png");
  level3Background = loadImage("/OneDrive - University of Toronto/image/back3.jpg");
  level3Background2 = loadImage("/OneDrive - University of Toronto/image/bak.png");
  setCutscene();
  //player = handler.obj.get(0);
  state = MENU;
}

void draw() {    


  if (state == GAME) {
    handler.tick();
    camera.tick(handler.obj.get(0));

    if (level == 3) {
      pushMatrix();
      rotateZ(-PI/30);
      rotateY(-PI/30);
      translate(camera.getX(), camera.getY());  
      handler.updateGraphics(); 
      translate(-camera.getX(), -camera.getY());    
      popMatrix();
    } else {
      translate(camera.getX(), camera.getY());  
      handler.updateGraphics(); 
      translate(-camera.getX(), -camera.getY());
    }

    fill(128, 128, 128);
    rect(45, 45, 10, 100);
    fill(0, 255, 255);
    rectMode(CORNERS);
    rect(46, 143, 54, 46 + (98 - map(player.HEALTH, 0, MAX_HEALTH, 0, 98)));
    rectMode(CORNER);
  } else if (state == CUTSCENE) {
    cutSceneDriver();
  } else if (state == MENU) {
    handler.menuScreen();
  }
  // println(player.x + " " + player.y);
}


void keyPressed() {
  switch (keyCode) {
  case UP_KEY:
    if (!player.jumping && (!lastKeyPressed)) { 
      player.jumping = true;
      player.velY = -MULT * VELY;
      lastKeyPressed = true;
    }
    break;
  case LEFT_KEY:  
    player.velX = -VELX;
    player.facing = LEFT;
    break;
  case RIGHT_KEY:
    player.velX = VELX;
    player.facing = RIGHT;
    break;
  }
}

void keyReleased() {
  switch (keyCode) {
  case LEFT_KEY:
    player.velX = 0;
    player.facing = LEFT;
    break;
  case RIGHT_KEY:
    player.velX = 0;
    player.facing = RIGHT;
    break;
  case UP_KEY: 
    lastKeyPressed = false;
    break;
  case SPACE:
    if (player.facing == RIGHT) handler.obj.add(new Bullet((int)player.x + tileSpecs, (int) (player.y + (tileSpecs/2)), BULLET_VEL));
    else handler.obj.add(new Bullet((int)player.x, (int) (player.y + (tileSpecs/2)), -BULLET_VEL));
    break;
  case 13:
    state = MENU;
    break;
  }
}

void mousePressed() {
  if (state == CUTSCENE) { 
    state = GAME;
  }
}
