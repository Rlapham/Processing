class Triangle {
  
  //variables (data)
  
  PVector a, b, c; 
  
  //contructor
  Triangle(PVector p1, PVector p2, PVector p3){
    a = p1; 
    b = p2; 
    c = p3; 
  }
  
  //methods
  void display(){
   vertex(a.x, a.y); 
   vertex(b.x, b.y); 
   vertex(c.x, c.y); 
  }
  
  void triColor(){
  //float angle = (frameRate % 20);   
  //color myColor = color(abs(sin(angle) * 255), abs(cos(angle) * 255), abs(cos(angle) * abs(sin(angle)) * 255), 8);  
  color myColor2 = color(random(0, 255), random(0, 255), random(0, 255), 50); 
  fill(myColor2); 
  noStroke(); 
  }
  
}