public class Animation {
  
  int speed, frames, index, count;
  
  PImage [] images;
  PImage currImg;
  
      public Animation(int speed, PImage... args) {

        this.speed = speed;

        images = new PImage[args.length];

        for (int i = 0; i < args.length; i++) {

            images[i] = args[i];

        }
        
        frames = args.length - 1;

    }

    
    
    public void runAnimation() {
        index++;
        if (index > speed) {

            index = 0;
            nextFrame();
        }

    }
    
    void pauseAnimation(int x, int y){
    
      currImg = images[images.length-1];
      image(currImg, x, y);
    
    }

    public void nextFrame() {
      
      
        for (int i = 0; i < frames; i++) {
            if (count == i) {
                currImg = images[i];
            }
        }

        count++;

        if (count > frames) {
            count = 0;

        }

    }

    public void drawAnimation( int x, int y) {

        image(currImg, x, y ); 
      
    }
      
}
