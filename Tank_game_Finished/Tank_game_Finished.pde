// AARON JENSEN | Tank Game | 4/14/26
PImage bg;
Tank tank1;
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<Projectile> projectiles = new ArrayList<Projectile>(); // [cite: 141]
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>(); // [cite: 141]
int score;
Timer obsTimer, puTimer;

void setup() {
  size(500, 500);
  bg = loadImage("BG1.png");
  tank1 = new Tank(); 
  score = 0;
  obsTimer = new Timer(1000); 
  obsTimer.start(); 
  puTimer = new Timer(5000);
  puTimer.start(); 
}

void draw() {
  background(127); 
  imageMode(CORNER); 
  image(bg, 0, 0);

 
  if (obsTimer.isFinished()) { 
    obstacles.add(new Obstacle(40, 40)); 
    obsTimer.start(); 
  }

 
  if (puTimer.isFinished()) { 
    powerups.add(new PowerUp(int(random(width)), -100));
    puTimer.start();
  }

 
  for (int i = powerups.size() - 1; i >= 0; i--) {
    PowerUp pu = powerups.get(i);
    pu.display(); 
    pu.move();

    if (pu.reachedSide()) {
      powerups.remove(i);
      continue;
    }
    if (pu.intersect(tank1)) { 
      if (pu.type == 'h') { 
        tank1.health = tank1.health + 100;
      } else if (pu.type == 'a') {
        tank1.laserCount = tank1.laserCount + 100;
      } else if (pu.type == 't') {
        tank1.turretCount = tank1.turretCount + 1;
      }
      powerups.remove(i); 
    }
  }

 
  for (int i = obstacles.size() - 1; i >= 0; i--) {
    Obstacle o = obstacles.get(i); 
    o.display(); 
    o.move(); 
    if (o.reachedSide()) { 
      obstacles.remove(i); 
      continue;
    }
    if (tank1.intersect(o)) {
      tank1.health -= 10; 
      obstacles.remove(i);
    }
  }

 
  for (int i = projectiles.size() - 1; i >= 0; i--) { 
    Projectile p = projectiles.get(i);
    boolean destroyed = false;
    
    for (int j = obstacles.size() - 1; j >= 0; j--) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) { 
        score = score + 100; 
        projectiles.remove(i); 
        obstacles.remove(j); 
        destroyed = true;
        break; 
      }
    }
    if (destroyed) continue;

    p.display(); 
    p.move(); 
    if (p.reachedSide()) { 
      projectiles.remove(i);
    }
  }

  tank1.display(); 
  scorepanel();
  
  println("Objects in Memory:" + obstacles.size());
  println("Projectiles in Memory:" + projectiles.size());
}

void scorepanel() {
  fill(127, 127); 
  rectMode(CENTER); 
  rect(width/2, 30, width, 60); 
  fill(255); 
  textSize(30); 
  textAlign(CENTER); 
  text("Score:" + score, width/2, 50); 
  text("Health:" + tank1.health, width/2-150, 30); 
  text("Ammo:" + tank1.laserCount, width/2+150, 30); 
}

void keyPressed() {
  if (key == 'w' || key == 'W') { 
    tank1.move('w'); 
  } else if (key == 's' || key == 'S') {
    tank1.move('s'); // [cite: 160]
  } else if (key == 'a' || key == 'A') {
    tank1.move('a'); // [cite: 161]
  } else if (key == 'd' || key == 'D') { 
    tank1.move('d'); 
  }
}


void mousePressed() {
  if (tank1.laserCount > 0) {
    projectiles.add(new Projectile(int(tank1.x), int(tank1.y)));
    tank1.laserCount--;
  }
}
