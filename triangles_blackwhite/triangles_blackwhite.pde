int NUM_PARTICLE = 200;

Particle[] ourParticles = new Particle[NUM_PARTICLE];

ArrayList < Triangle > triangles; 

//float angle; 

void setup() {
  size(1024, 768, P2D);  
  //blendMode(ADD);

  for (int i = 0; i < NUM_PARTICLE; i++) {
    ourParticles[i] = new Particle();
  }

  triangles = new ArrayList<Triangle>();
}

void draw() {
  background(20);  

  for (int i = 0; i < NUM_PARTICLE; i++) {

    ourParticles[i].move(); 
    ourParticles[i].render();
  } 
  Particle thisParticle, otherParticle; 

  for (int i =0; i < NUM_PARTICLE; i++) {
    thisParticle = ourParticles[i]; 
    thisParticle.neighbours = new ArrayList<Particle>();

    //adding itself to list of close particles
    thisParticle.neighbours.add(thisParticle); 

    for (int j = 0; j < NUM_PARTICLE; j++) {
      otherParticle = ourParticles[j];  
      //measure distance between the two
      float dist = PVector.dist(thisParticle.position, otherParticle.position); 

      if (dist > 0 && dist < thisParticle.maxDistance) thisParticle.neighbours.add(otherParticle);
    } //end of otherParticle loop 

    // .size is the same as saying .length for arraylists
    if (thisParticle.neighbours.size() > 1) {
      //add a triangle
      addTriangle(thisParticle.neighbours); 
    }
  } //end of thisParticle loop
  
  drawTriangles();
  triangles.clear(); 
  
  //angle += .01; 
} //end of draw loop

void addTriangle(ArrayList<Particle> neighboursList) {

  int sizeOfList = neighboursList.size(); 
  if (sizeOfList > 2) {

    for (int i = 0; i < sizeOfList -1; i++) {
      for (int j = i + 1; j <sizeOfList; j++) {
        triangles.add(new Triangle(neighboursList.get(0).position, neighboursList.get(i).position, neighboursList.get(j).position));
      } //end of j
    } //end of i
  } //end of addTriangle
} //end addTriangle loop

void drawTriangles(){
  
  
 //color myColor = color(abs(sin(angle) * 255), abs(cos(angle) * 255), abs(cos(angle) * abs(sin(angle)) * 255), 8);  
 //noStroke(); 
 //fill(myColor); 
 
 beginShape(TRIANGLES);
 
 for (int i = 0; i < triangles.size(); i++)
 {
   Triangle t = triangles.get(i); 
   t.display(); 
   t.triColor(); 
 } //end of new triangle
 
 endShape();
}