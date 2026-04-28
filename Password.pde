// Aaron Jensen | Password Game | April 28, 2026

String secretPassword = "1234";
String currentInput = "";
int attempts = 3;
String status = "ENTER PASSWORD";
boolean lockedOut = false;
boolean approved = false;

void setup() {
  size(500, 500);
}

void draw() {
  background(40);


  fill(100);
  rectMode(CENTER);
  rect(width/2, 50, width, 60);


  fill(255);
  textAlign(CENTER, CENTER);
  textSize(24);
  text(status, width/2, 50);


  fill(200);
  rect(width/2, height/2, 300, 50);


  fill(0);
  textSize(30);
  text(currentInput, width/2, height/2);


  fill(255);
  textSize(16);
  text("Attempts remaining: " + attempts, width/2, height/2 + 60);

  if (!lockedOut && !approved) {
  } else if (lockedOut) {
    fill(255, 0, 0);
    text("SYSTEM LOCKED - RESTART PROGRAM", width/2, height - 50);
  }
}

void keyPressed() {
  if (lockedOut || approved) return; 

  if (key == ENTER || key == RETURN) {
    checkPassword();
  } else if (key == BACKSPACE) {
    if (currentInput.length() > 0) {
      currentInput = currentInput.substring(0, currentInput.length() - 1);
    }
  } else if (key != CODED && currentInput.length() < 12) {
   
    currentInput += key;
  }
}

void checkPassword() {
  if (currentInput.equals(secretPassword)) {
    status = "APPROVED";
    approved = true;
  } else {
    attempts--;
    currentInput = "";

    if (attempts <= 0) {
      status = "DENIED - LOCKED";
      lockedOut = true;
    } else {
      status = "DENIED";
    }
  }
}
