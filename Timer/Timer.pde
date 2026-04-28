// Aaron Jensen | 3/26/26 | Timer
// I could not for the life get the sound to work
//import processing.sound.*;
//SoundFile alarm;
Button btnStart, btnStop, btnReset;
int totalTime = 10;
int startTime = 0;
int timeLeft = 0;
boolean running = false;

void setup() {
  size(500, 500);
  //alarm = new SoundFile (this, alarm.mp3);
  btnStart = new Button(400, 100, 100, 30, "Start", color(200), color(10));
  btnStop = new Button(100, 100, 100, 30, "Stop", color(200), color(10));
  btnReset = new Button(250, 100, 100, 30, "Reset", color(200), color(10));
  timeLeft = totalTime;
}

void draw() {
  background(100, 50, 255);

  if (running == true) {
    int elapsed = (millis() - startTime)/1000;
    timeLeft = totalTime - elapsed;

    if (timeLeft <= 0) {
      timeLeft = 0;
      running = false;
    }
  }

  btnStart.display();
  btnStart.hover();
  btnStop.display();
  btnStop.hover();
  fill(100);
  rect(width/2, height/2, 100, 100);
  fill(255, 0, 0);
  textSize(100);
  text(timeLeft, width/2, height/2-15);
  btnReset.display();
  btnReset.hover();
 
}

void mousePressed() {
  if (btnStart.over == true) {
    running = true;
    startTime = millis();
 
  }
}
