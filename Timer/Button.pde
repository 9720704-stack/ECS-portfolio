class Button {
  //Member varibales
  int x, y, w, h;
  String label;
  color c1, c2;
boolean over;
  // Constuctor
  Button(int x, int y, int w, int h, String label, color c1, color c2) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.label = label;
    this.c1 = c1;
    this.c2 =c2;
    over = false;
  }

  //Member Methods
  void display() {
    if(over == true) {
      fill(c1);
    }    else{
      fill(c2);
    }
    rectMode(CENTER);
    rect(x, y, w, h, 50);
    fill(255, 255, 255);
    textAlign(CENTER, CENTER);
    textSize(25);
    text(label, x, y-5);
  }
  boolean hover() {
    if(mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
       over = true;
    }else {
      over = false;
    }
    return over;
  }
  
}
