
PImage level1, level2, level3, image = null;

void levelLoader(int level) {  

  switch(level) {

  case 1: 
    {
      handler.clearArrays();
      this.level1 =loadImage("/OneDrive - University of Toronto/image/res.png");
      getObjects(this.level1);
      break;
    }
  case 2: 
    {
      println(level);
      handler.clearArrays();
      delay(50);
      this.level2 = loadImage("/OneDrive - University of Toronto/image/res2.png");
      getObjects(this.level2);
      break;
    }
  case 3:
    {
      handler.clearArrays();
      level3 = loadImage("/OneDrive - University of Toronto/image/res3.png");
      b = new textBox(500, 256, "Save me son! -Big Chungus' Stomach", 22);
      getObjects(this.level3);
      break;
    } 

  default:
    {
      println("AN ERROR OCCURRED WHILE LOADING LEVEL IMAGES, CHECK LEVEL INPUT in levelLoader fucntion");
      println("No more levels");
    }
  }
}


void getObjects(PImage image) {

  if  (image != null) {
    int h = image.height;
    int w = image.width;
    int pixel = 0, red = 0, green = 0, blue = 0;


    image.loadPixels();

    for (int i = 0; i < w; i++) {
      for (int j = 0; j < h; j++) {    
        pixel = image.pixels[j*w + i];
        red  = (pixel >> 16) & 0xff;
        green = (pixel >> 8) & 0xff;
        blue = (pixel) & 0xff;


        if (red == 255 && green == 106 && blue == 0) {
          handler.obj.add(new platform(i * tileSpecs, j *tileSpecs, 2));
        } else if (red == 50 && green == 225 && blue == 68) {
          handler.obj.add(new platform(i * tileSpecs, j *tileSpecs, 5)) ;
        } else if (red == 0 && green == 255 && blue == 255) {
          gameObject temp = handler.obj.get(0);
          handler.obj.set(0, new player(i*tileSpecs, j*tileSpecs));
          handler.obj.add(temp);
        } else if (red == 255 && green == 25 && blue == 251) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 1)) ;
        } else if (red == 140 && green == 255 && blue == 0) {
          handler.obj.add(new Flag(i * tileSpecs, j * tileSpecs));
        } else if (red == 122 && green == 255 && blue == 168) {
          handler.obj.add(new object(i * tileSpecs, j * tileSpecs, WINDOW));
        } else if (red == 123 && green == 15 && blue == 255) {
          handler.obj.add(new basicEnemy(i * tileSpecs, j * tileSpecs));
        } else if (red == 255 && green == 127 && blue == 237) {
          handler.obj.add(new cube(i * tileSpecs, j * tileSpecs));
        } else if (red == 255 && green == 255 && blue == 20) {
          handler.obj.add(new shooterEnemy(i * tileSpecs, j * tileSpecs, ENEMY));}
        else if (red == 0 && green == 255 && blue == 250) {
          handler.obj.add(new shooterEnemy(i * tileSpecs, j * tileSpecs, BOSS));
        } 


        // non updating
        else if (red == 255 && green == 25 && blue == 251) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 1)) ;
        } else if (red == 86 && green == 255 && blue == 224) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 2)) ;
        } else if (red == 255 && green == 58 && blue == 94) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 3)) ;
        } else if (red == 255 && green == 216 && blue == 0) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 4)) ;
        } else if (red == 165 && green == 255 && blue == 127) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 5)) ;
        } else if (red == 0 && green == 0 && blue == 0) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 6)) ;
        } else if (red == 255 && green == 251 && blue == 61) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 7)) ;
        } else if (red == 72 && green == 0 && blue == 255) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 8)) ;
        } else if (red == 63 && green == 127 && blue == 98) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 9)) ;
        } else if (red == 255 && green == 2 && blue == 23) {
          handler.nonTicking.add(new object(i * tileSpecs, j *tileSpecs, ELEVATOR)) ;
        } else if (red == 82 && green == 82 && blue == 82) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 11)) ;
        } else if (red == 255 && green == 109 && blue == 99) {
          handler.nonTicking.add(new platform(i * tileSpecs, j *tileSpecs, 10)) ;
        }
      }
    }
  }
}
