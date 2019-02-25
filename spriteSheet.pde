public class spriteSheet{

  private PImage image;
    
  public spriteSheet(PImage image){
  
    this.image = image;
    
  }

public PImage grabImage(int col, int row, int myWidth, int myHeight){    
    PImage img = this.image.get((col*myWidth) - myWidth, (row*myHeight) - myHeight, myWidth, myHeight);
    return img;  
  }


}
