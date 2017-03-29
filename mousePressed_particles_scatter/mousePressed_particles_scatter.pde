// Richard Lapham 

///1

int NUM_PARTICLE = 1;

Particle[] ourParticles = new Particle[NUM_PARTICLE];


void setup() {
  size(1024, 768, P2D);  
  //blendMode(ADD);


}

void draw() {
  background(255);  
  
  if (mousePressed == true){
   for (int i = 0; i < NUM_PARTICLE; i++) {
    ourParticles[i] = new Particle();
  }
 
  //end create particles

  for (int i = 0; i < NUM_PARTICLE; i++) {

    ourParticles[i].move(); 
    ourParticles[i].render();
  } 
 
  } //end mousePressed
} //end of draw loop


/// particle class

class Particle {
  
 //variables 
 float radius, maxSpeed, maxDistance, dist; 
 
 PVector velocity, acceleration, position; 
 
 ArrayList<Particle> neighbours; 
 
 //constructor 
 Particle(){
  radius = 40;
  maxSpeed = .3;
  maxDistance = 80; 
  dist = dist(mouseX+30, mouseY+30, mouseX, mouseY);  
  
  velocity = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed)); 
  acceleration = new PVector(0, 0); 
  position = new PVector (mouseX+random(-100,100), mouseY+random(-100, 100)); 
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
    noFill(); 
    ellipse(position.x, position.y, 3, 3); 
    
    //////test
    fill(0);
    //stroke(255);
    ellipse(position.x, position.y, maxDistance, maxDistance); 
  }
 
  
  
}