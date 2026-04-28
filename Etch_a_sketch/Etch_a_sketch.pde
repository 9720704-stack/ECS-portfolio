// Aaron Jensen | March 17 2026 | Etch a sketch
int x, y;
PImage Etch;

void setup() {
  size(500, 400);      
  background(200);    
  strokeWeight(3);   
  stroke(50);          
  Etch = loadImage("Etch.png");
  image(Etch, 0, 0, 500, 400); 
  
  x = width / 2;
  y = height / 2;
}

void draw() {
  
}

void keyPressed() {
  int step = 3;
  
  if (key == CODED) {
    if (keyCode == UP) {
      moveU(step);
    } else if (keyCode == DOWN) {
      moveD(step);
    } else if (keyCode == LEFT) {
      moveL(step);
    } else if (keyCode == RIGHT) {
      moveR(step);
    }
  } else {
    if (key == '9') {
      background(200); 
      x = width / 2;
      y = height / 2;
    }
  }
}

void moveR(int l) {
  line(x, y, x+l, y);
  x += l;
}

void moveL(int l) {
  line(x, y, x-l, y);
  x -= l;
}

void moveU(int l) {
  line(x, y, x, y-l);
  y -= l;
}

void moveD(int l) {
  line(x, y, x, y+l);
  y += l;
}

void mouseReleased() {
   saveFrame("line-######.png");
}
