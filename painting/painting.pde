// The world pixel by pixel 2017
// Richard Lapham 


PImage slider;
boolean square = false;  
boolean circle = false; 
boolean line = false;
boolean squiggly = true;
boolean particle = false;

int background = 255; 
int bannerY = 40; 
color theColor; 
int NUM_PARTICLE = 1;
Particle[] ourParticles = new Particle[NUM_PARTICLE];
int bSize = 50;


void setup() {
  size(1000, 800,P3D);
  background(background);                                     
  slider = loadImage("slider.png");
}

void draw() {  
  ///legend 
  pushMatrix(); 
  fill(0); 
  rect(0,0, width - bannerY, bannerY);
  fill(255);
  text("LEGEND:", 30, 25); 
  text("r : reset", 120, 25); 
  text("q : box", 200, 25); 
  text("w : circle", 300, 25); 
  text("e : brush", 400, 25); 
  text("t : particle", 500, 25); 
  text("y : line", 600, 25); 
  popMatrix(); 
  
  //image
  image(slider,width-350,2);
  if (mouseY < bannerY){
    colorPicker(); 
  }
  ///guides
  ///square
  if (keyPressed){
      if (key == 'q'){
        square = true; 
        circle = false; 
        squiggly = false; 
        particle = false;
        line = false;
      }
  }
  //circle
    if (keyPressed){
      if (key == 'w'){
        circle = true; 
        square = false; 
        squiggly = false; 
        particle = false;
        line = false;
      }
  }
  //squiggly
      if (keyPressed){
      if (key == 'e'){
        squiggly = true; 
        circle = false; 
        square = false; 
        particle = false;
        line = false;
      }
  }
   //particle
    if (keyPressed){
      if (key == 't'){
        particle = true; 
        circle = false; 
        square = false; 
        squiggly = false;
        line = false;
      }
  }
   ///line
  if (keyPressed){
      if (key == 'y'){
        line = true;
        square = false; 
        circle = false; 
        squiggly = false; 
        particle = false;
      }
  }
  
  //up/down 
    if (keyPressed){
      if (key == '+'){
        bSize += 3; 
      }
  }
   if (keyPressed){
      if (key == '-'){
        bSize -= 3; 
      }
    if (bSize < 0){
        bSize = 3;     
    }
   }
  
      if (keyPressed){
      if (key == 'r'){
       background(background);  
      }
  } 
}

void colorPicker() {
  //find the color under the mouse pointer//
  if (mousePressed){
  theColor = get(mouseX, mouseY);
  fill(theColor);
  rect(width - bannerY, 0, bannerY, bannerY); 
  println(theColor);
  return; 
  }
}

void mouseDragged(){  
 if (mouseY > bannerY){ 
 loadPixels();

///circle
if (circle){
  noStroke(); 
  fill(theColor); 
  //int CircRadius = 20; 
  ellipse(mouseX, mouseY, bSize, bSize);
}

//square
if (square){
  //int radius = 20;
  // for (int w = 0; w < radius; w++){ 
  //  for (int a = 0; a < radius; a++){
  //    float pixelUnderMouse = (mouseX-a+mouseY*width) - width * w;  
  //    //println(int(pixelUnderMouse1));
  //    constrain(pixelUnderMouse, 0, (pixelWidth*pixelHeight)); 
  //    pixels[abs(int(pixelUnderMouse))]= color(theColor);  
 //}//
//}
translate(mouseX, mouseY); 
fill(theColor); 
stroke(255);
box(bSize, bSize, mouseX); 
}

//line
if (line){
  int radius = bSize;
   for (int w = 0; w < radius; w++){ 
      float pixelUnderMouse1 = (mouseX+mouseY*width) - width * w;  
      //println(int(pixelUnderMouse1));
      constrain(pixelUnderMouse1, 0, (pixelWidth*pixelHeight)); 
      pixels[abs(int(pixelUnderMouse1))]= color(theColor);  
}
}

//squiggly
if (squiggly){
  int radius = bSize;
   for (int w = 0; w < radius; w++){ 
    for (int a = 0; a < radius; a++){
      float pixelUnderMouse1 = (mouseX-(random(a, a+20))+mouseY*width) - width * (random(w, w - 5));  
      //println(int(pixelUnderMouse1));
      constrain(pixelUnderMouse1, 0, (pixelWidth*pixelHeight)); 
      pixels[abs(int(pixelUnderMouse1))]= color(theColor);  
 }
}
}

//square
if (particle){
 for (int i = 0; i < NUM_PARTICLE; i++) {
    ourParticles[i] = new Particle();
  }
 
  //end create particles

  for (int i = 0; i < NUM_PARTICLE; i++) {

    ourParticles[i].move(); 
    ourParticles[i].render();
  } 
} // end particle

 updatePixels(); 
 }
}

/// particle class

class Particle {
  
 //variables 
 float radius, maxSpeed, maxDistance; 
 
 PVector velocity, acceleration, position; 
 
 ArrayList<Particle> neighbours; 
 
 //constructor 
 Particle(){
  radius = 40;
  maxSpeed = .3;
  maxDistance = 30; 
 
  
  velocity = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed)); 
  acceleration = new PVector(0, 0); 
  position = new PVector (mouseX+random(-50,50), mouseY+random(-50, 50)); 
 }
 
 //methods
  void move(){
    
    if (position.x < 0) position.x = width; 
    if (position.x > width) position.x = 0; 
    
    if (position.y < 0) position.y = height; 
    if (position.y > height) position.y = 0; 
    
    position.add(velocity); 
  }
  
  void render(){

    fill(theColor);
    noStroke(); 
    ellipse(position.x, position.y, bSize, bSize); 
  } 
}