class cutscene {

  int step = 0, x, y = 500;

  color back = color(80, 192, 128); 
  textBox b;

  PImage images;

  ArrayList <textBox> boxes = new ArrayList();

  void addText(int x, int y, String data, int size) {

    boxes.add( new textBox(x, y, data, size) );
  }

  void addText(int x, int y, String data, int size, int rows) {

    boxes.add( new textBox(x, y, data, size, rows) );
  }

  void addImage(String path) {

    try {
      images = loadImage(path);
    } 
    catch (Exception e) { 
      e.printStackTrace();
    }    
    this.x = width/2;
    this.y = height/2;
  }

  void addImage(String path, int x, int y ) {

    images = loadImage(path);
    this.x = x;
    this.y = y;
  }

  void setBackground(color c) {
    this.back = c;
  }

  void display() {       

    background(back);

    if (step < this.x) {          
      step+= 5;
    }

    delay(1);

    imageMode(CENTER);
    try {
      image(images, step, y);
    } 
    catch(Exception e) {
    }
    imageMode(CORNER);
    for (textBox b : boxes) {
      b.display();
    }
  }
}


void setCutscene() {

  one.setBackground( color(0, 0, 0));
  one.addImage("/OneDrive - University of Toronto/image/tsnow.jpg", width/2, height/2);
  one.images.resize(400, 266);
  one.addText(width/2, height/2 + 95, "Hmmm. Stormy. I must get back to Queen's Park. Ryerson is closed and so is york, only UofT is open!!!!", 20);
  one.boxes.get(0).x = one.boxes.get(0).x - one.boxes.get(0).boxWidth/2;

  two.setBackground( color(0, 0, 0));
  two.addImage("/OneDrive - University of Toronto/image/bil.jpg", width/2, height/2);
  two.images.resize(400, 266);
  two.addText(width/2, height/2 + 90, "Oopsie. BACK to Myhal 4th. Forgot bottle.", 20);
  two.boxes.get(0).x = one.boxes.get(0).x - one.boxes.get(0).boxWidth/2;
  
  three.setBackground( color(255, 248, 253));
  three.addImage("/OneDrive - University of Toronto/image/chungus.png", width/2, height/2);
  three.images.resize(400, 266);
  three.addText(width/2, height/2 + 95, "The elevator explodes and you land on the forbidden, out of bounds eighth floor haunted by Burbulla's ghost", 20);
  three.boxes.get(0).x = one.boxes.get(0).x - one.boxes.get(0).boxWidth/2;
  
}

void cutSceneDriver() {

  switch (level) {
  case 1:
    one.display();   
    break;

  case 2:     
    two.display();    
    break;

  case 3:
    three.display();
    break;
  }
}
