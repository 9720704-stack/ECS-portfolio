// Aaron Jensen | 2/26/26 | B4
void setup() {
  size(950,400);
}
void draw() {
  background(#1FCAE0);
  drawRef();
  histEvent(200,185,"1999",true,"Oct 1999: GeForce \n 256 (First GPU)");
  histEvent(250,315,"2010",false,"GeForce GTX 480 (Fermi/Tessellation)");
  histEvent(350,185,"2016",true,"GeForce GTX 1080 (Pascal architecture)");
  histEvent(850,315,"2026",false,"Possible Releadse of 60 Series (Unknown Archeticture)");
  histEvent(515,185,"2020",true,"RTX 30 Series (Ampere architecture) ");
  histEvent(600,315,"2022",false,"RTX 40 Series (Ada Lovelace architecture) ");
  histEvent(400,315,"2018",false, "RTX 20 Series (Ray Tracing/Turing)");
  histEvent(715,185,"2024",true,"RTX 50 Series (Blackwell Architecture)");
}
void drawRef() {
  textAlign(CENTER);
  textSize(38);
  fill(#2C1FE0);
  text("GPU's:Timeline", width/2, 80);
  textSize(30);
   text("by Aaron Jensen", width/2, 105);
   strokeWeight(2);
   line(50,250,900,250);
   //ticks
 line(50,230,50,270);
 line(900,230,900,270);
 line(470,230,470,270);
 line(670,230,670,270);
 line(250,230,250,270);
 line(250,230,250,270);
 line(250,230,250,270);
 line(250,230,250,270);
 line(250,230,250,270);
 strokeWeight(1);
 textSize(20);
 text("1990",50,290);
 text("2027",900,295);
}
void histEvent(int x,int y, String title, boolean top, String detail) {
  if(top == true) {
     line(x-20,y,x-45,y+65);
  }else{
    line(x-20,y,x-45,y-65);
  }
  rectMode(CENTER);
  fill(#8EBCE0);
  rect(x-30,y,120,30,10);
  fill(0,0,0);
  text(title,x-25,y+5);
  if(mouseX > x-50 && mouseX < x+50 && mouseY > y-15 && mouseY < y+15) {
    text(detail,width/2,350);
  }
}
