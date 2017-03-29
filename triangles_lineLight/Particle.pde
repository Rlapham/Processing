class Particle {
  
 //variables 
 float radius, maxSpeed, maxDistance; 
 
 PVector velocity, acceleration, position; 
 
 ArrayList<Particle> neighbours; 
 
 //constructor 
 Particle(){
  radius = 50;
  maxSpeed = .3;
  maxDistance = 80; 
  
  velocity = new PVector(random(-maxSpeed, maxSpeed), random(-maxSpeed, maxSpeed)); 
  acceleration = new PVector(0, 0); 
  position = new PVector (random(width), random(height)); 
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
    ellipse(position.x, position.y, 1, 1); 
    
    //////test
    //noFill();
    //stroke(255);
    //ellipse(position.x, position.y, maxDistance, maxDistance); 
  }
 
  
  
}