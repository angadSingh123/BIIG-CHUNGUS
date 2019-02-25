public class Texture {

  private spriteSheet ps, ts, bs, fs;

  public PImage block_sheet = null;
  public PImage player_sheet = null;
  public PImage text_sheet= null;
  public PImage fauna_sheet = null;
    public PImage bos = null;

  public ArrayList <PImage> block_list = new ArrayList <PImage>();
  public ArrayList <PImage> player_list = new ArrayList <PImage>();

  public Texture() {  

    player_sheet = loadImage("/OneDrive - University of Toronto/image/ps.png");
    block_sheet = loadImage("/OneDrive - University of Toronto/image/ts.png");
    text_sheet = loadImage("/OneDrive - University of Toronto/image/tbox.png");
    fauna_sheet = loadImage("/OneDrive - University of Toronto/image/fauna.png");
    bos = loadImage("/OneDrive - University of Toronto/image/boss.png");
    //println("loade");
    ts = new spriteSheet(block_sheet);
    ps = new spriteSheet(player_sheet);
    bs = new spriteSheet(text_sheet);
    fs = new spriteSheet(fauna_sheet);
    getTexture();
  }

  void getTexture() {
    //right
    player_list.add(ps.grabImage(1, 2, 33, 33));    
    player_list.add(ps.grabImage(2, 2, 33, 33));   
    player_list.add(ps.grabImage(3, 2, 33, 33));
    //left
    player_list.add(ps.grabImage(1, 1, 33, 33));    
    player_list.add(ps.grabImage(2, 1, 33, 33));   
    player_list.add(ps.grabImage(3, 1, 33, 33));
    //right stationary
    player_list.add(ps.grabImage(4, 2, 33, 33));
    //left stationary
    player_list.add(ps.grabImage(4, 1, 33, 33));

    //blocks
    block_list.add(ts.grabImage(1, 1, 34, 34));
    block_list.add(ts.grabImage(2, 1, 34, 34));
    block_list.add(ts.grabImage(3, 1, 34, 34));    
    block_list.add(ts.grabImage(4, 1, 34, 34));

    //more blocks
    block_list.add(ts.grabImage(1, 2, 34, 34));
    block_list.add(ts.grabImage(2, 2, 34, 34));
    block_list.add(ts.grabImage(3, 2, 34, 34));
    block_list.add(ts.grabImage(4, 2, 34, 34));

    //text box bloakcs
    block_list.add(bs.grabImage(1, 1, 8, 8)); //8
    block_list.add(bs.grabImage(2, 1, 8, 8)); //9
    block_list.add(bs.grabImage(3, 1, 8, 8)); //10
    block_list.add(bs.grabImage(1, 2, 8, 8)); //11 
    block_list.add(bs.grabImage(3, 2, 8, 8)); //12
    block_list.add(bs.grabImage(1, 3, 8, 8)); //13 
    block_list.add(bs.grabImage(2, 3, 8, 8)); //14
    block_list.add(bs.grabImage(3, 3, 8, 8)); //15

    //more blockses
    block_list.add(ts.grabImage(5, 1, 34, 34)); //16
    block_list.add(ts.grabImage(6, 1, 34, 34)); //17 
    block_list.add(ts.grabImage(5, 2, 34, 34)); //18
    block_list.add(ts.grabImage(6, 2, 34, 34)); //19

    //ele
    block_list.add(ts.grabImage(4, 1, 68, 68)); //20

    //flag
    block_list.add(fs.grabImage(5, 1, 32, 64)); //21

    //enemies    
    //train
    player_list.add(ps.grabImage(5, 1, 34, 34)); //9
    //idk orange thing
    player_list.add(ps.grabImage(5, 2, 34, 34)); //10
    //eggnog singh
    player_list.add(ps.grabImage(6, 1, 34, 34));//11
    // upside dwon singh
    player_list.add(ps.grabImage(6, 2, 34, 34));//12
    //big enemy
    player_list.add(ps.grabImage(4, 1, 68, 68));//13

    loadOtherTexture(25);
    
    player_list.add(bos);

    // println("Added " + (block_list.size() + player_list.size()) + " images" );//;+ "\n" + block_list.toString());
  }

  void loadOtherTexture(int number) {

    for (int i = 0; i < number; i++) {

      String begin = "frame_";

      String end = "_delay-0.1s";

      String zero = "0";

      String newNumber = Integer.toString(i);

      if (i < 10) {
        newNumber = zero + newNumber;
      }

      begin = begin.concat(newNumber);

      begin = begin + end;

      begin = "/OneDrive - University of Toronto/image/gifs/" + begin + ".png";

      begin.trim();    

      block_list.add(loadImage(begin));
    }
  }
}
