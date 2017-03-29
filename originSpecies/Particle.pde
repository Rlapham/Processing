class Particle {
 //variables 
 float radius, sentValue, radValue, lifespan; 
 float r = 6;
//float length1, length2, length3, length4, length5, length6; 
 String[] joinedArray = {}; 
 String sent; 
 PVector velocity, acceleration, position;  
 
 //constructor 
 Particle(float x, float y, float _sentValue, String _sent, float _length1, float _length2, float _length3, float _length4, float _length5){
  length1 = _length1; 
  length2 = _length2; 
  length3 = _length3; 
  length4 = _length4; 
  length5 = _length5; 
  sent = _sent; 
  sentValue = _sentValue; 
  radius = sentValue*8; 
  
  acceleration = new PVector(); 
  velocity = PVector.random2D(); 
  position = new PVector(x, y); 
  float lifeVal = map(sentValue, 0, 5, 255, 150); 
  lifespan = lifeVal;
 }
 
 void run(){
   update(); 
   display(); 
 }
 
 //methods
   void intersects(ArrayList<Particle> particles) {
    for (Particle other : particles) {
      if (other != this) {
        PVector dir = PVector.sub(position, other.position);
        if (dir.mag() < radius) {
          dir.setMag(.5); 
          applyForce(dir);
          
          ///mixing sentences
          if (sent != null && other.sent != null){
          String[] firstArray = splitTokens(sent); 
          String[] secondArray = splitTokens(other.sent);
          joinedArray = splice(joinedArray, firstArray, 0);
          joinedArray = splice(joinedArray, secondArray, 1);
          String joinedString = join(joinedArray, " "); 
          particleCalc(joinedString);
          
          //store - signal new particle
          holdPos = other.position;
          holdVal = totVal; 
          holdSent = cutSent;
          pushP = true;          
    
          //reset
          reset();
          joinedArray = new String[0];    
          } //sent null 
        } // radius
      }
    }
  }

  void applyForce(PVector f) {
    acceleration.add(f);
  }
  
  
  void update(){
    if (position.x < 0) position.x = width; 
    if (position.x > width) position.x = 0; 
    
    if (position.y < 0) position.y = height; 
    if (position.y > height) position.y = 0; 
    
    velocity.add(acceleration);
    position.add(velocity); 
    acceleration.mult(0);
    lifespan -= 2.0;
  }
  
  void display(){
    //general
    fill(255, lifespan); 
    noStroke(); 
    pushMatrix();
    translate(position.x, position.y); 
    fill(255, lifespan - 10);
    ellipse(0, 0, radius*(length1), radius*(length1)); 
    fill(255, lifespan - 20);
    ellipse(0, 0, radius*(length2), radius*(length2)); 
    fill(255, lifespan - 30);
    ellipse(0, 0, radius*(length3), radius*(length3)); 
    fill(255, lifespan - 40);
    ellipse(0, 0, radius*(length4), radius*(length4)); 
    fill(255, lifespan - 50);
    ellipse(0, 0, radius*(length5), radius*(length5)); 
    popMatrix();
    
    

  }
 
   // Is the particle still useful?
  boolean isDead() {
    if (lifespan < 0.0) {
      return true;
    } else {
      return false;
    }
  }
  
  
  
}