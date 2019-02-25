class textBox {


  private String data = "";
  private int x, y;
  private int boxWidth = 320;
  final int charLimit = 25;  
  private int rows = 1,  rectHeight, size;
  ArrayList <Integer> indeces =  new ArrayList();
  
  textBox(int x, int y, String data, int size) {

    this.x = x;
    this.y = y;
    this.data = data;  
    this.size = size;
    textSize(size);
    findSpaceIndeces();
    rows = ceil((float) data.length() / (float) charLimit);


    if (data.length() > charLimit) {
      boxWidth = tex.block_list.get(9).width * ceil((int) textWidth(data.substring(0, charLimit)) / tex.block_list.get(9).width);
    } else {
      boxWidth = tex.block_list.get(9).width * ceil((int) textWidth(data.substring(0)) / tex.block_list.get(9).width);
    }    

    rectHeight = ceil(textHeight()/tex.block_list.get(9).height) * tex.block_list.get(9).height; // heihg ot indi rec
  }
  
  
  textBox(int x, int y, String data, int size, int rows) {

    this.x = x;
    this.y = y;
    this.data = data;  
    
    textSize(size);
    findSpaceIndeces();
    this.rows = rows;


    if (data.length() > charLimit) {
      boxWidth = tex.block_list.get(9).width * ceil((int) textWidth(data.substring(0, charLimit)) / tex.block_list.get(9).width);
    } else {
      boxWidth = tex.block_list.get(9).width * ceil((int) textWidth(data.substring(0)) / tex.block_list.get(9).width);
    }    

    rectHeight = ceil(textHeight()/tex.block_list.get(9).height) * tex.block_list.get(9).height; // heihg ot indi rec
  }

  void display() {

    createBoundingBox();

    fill(255);
    textAlign(LEFT);
    textSize(size);
    int curr = charLimit, i =0;

    for ( i = 0; i < ceil((float) data.length() / (float) charLimit) - 1; i++) {


      text(data.substring(curr*i, charLimit + curr*(i)) , x - 2, y + (textHeight()*i) + textHeight());
    }

    text(data.substring(curr*(i)), x - 2, y + (textHeight()*i) + textHeight());
  }


  void createBoundingBox() {

    fill(0);
    
    if (state != MENU)
    rect(x, y, boxWidth, rectHeight * rows);     

    // along the edges
    for (int i = 0; i < boxWidth/tex.block_list.get(9).width; i ++) 
      image(tex.block_list.get(9), x + tex.block_list.get(9).width*i, y -tex.block_list.get(9).height );

    for (int i = 0; i < boxWidth/tex.block_list.get(14).width; i ++) 
      image(tex.block_list.get(14), x + tex.block_list.get(14).width*i, y + rectHeight*rows);

    //println(rectHeight * rows);

    for (int i = 0; i < (rectHeight * rows) / tex.block_list.get(14).height; i ++) 
      image(tex.block_list.get(11), x - tex.block_list.get(11).width, y + (tex.block_list.get(14).height * i));    

    for (int i = 0; i < (rectHeight * rows) / tex.block_list.get(14).height; i ++) 
      image(tex.block_list.get(12), x + boxWidth, y + (tex.block_list.get(14).height * i));  

    //corners 
    image(tex.block_list.get(8), x - (tex.block_list.get(8).width), y - (tex.block_list.get(8).height)); 
    image(tex.block_list.get(10), x + boxWidth, y - (tex.block_list.get(8).width));
    image(tex.block_list.get(13), x - (tex.block_list.get(13).width), y + rectHeight*rows);
    image(tex.block_list.get(15), x + boxWidth, y + rectHeight*rows);
  }

  int textHeight() {

    return (int) (textAscent() + textDescent());
  }


  void findSpaceIndeces() {

    for (int i =0; i < data.length(); i++) {

      if (data.charAt(i) == ' ') {

        indeces.add(i);
      }
    }
  }
}
