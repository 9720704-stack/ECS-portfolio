class Obstacle {
  float x, y, w, h, speed, health;
  PImage obst1;
  char idir;

  Obstacle(float w, float h) {
    this.w = w; 
    this.h = h; 
    speed = 5; 
    health = 100; 
    
    int randChoice = int(random(4));
    if (randChoice == 0) {
      idir = 'w'; 
      x = random(width); 
      y = height + 100; 
    } else if (randChoice == 1) {
      idir = 'd'; 
      x = -100; 
      y = random(height); 
    } else if (randChoice == 2) {
      idir = 'a'; 
      x = width + 100; 
      y = random(height); 
    } else {
      idir = 's'; 
      x = random(width); 
      y = -100; 
    }
    obst1 = loadImage("obstical.png"); 
  }
  
  void display() {
    imageMode(CENTER); 
    image(obst1, x, y); 
  }
  
  void move() {
    switch(idir) { // [cite: 16]
      case 'w': y = y - speed; break;
      case 'a': x = x - speed; break; 
      case 's': y = y + speed; break; 
      case 'd': x = x + speed; break; 
    }
  }
  
  boolean reachedSide() {
    return x >= width+150 || x <= -150 || y > height + 150 || y < -150; 
  }
}
