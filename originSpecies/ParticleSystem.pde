class ParticleSystem {
  ArrayList<Particle> particles;

  ParticleSystem(PVector position, float sentValue, String sent, float length1, float length2, float length3, float length4, float length5) {
    particles = new ArrayList<Particle>();
  }

  void addParticle(float x, float y, float floatVal, String stringVal, float L1, float L2, float L3, float L4, float L5) {
    particles.add(new Particle(x, y, floatVal, stringVal, L1, L2, L3, L4, L5));
  }

  void display() {
    for (Particle p : particles) {
      p.display();
    }
  }

  void applyForce(PVector f) {
    for (Particle p : particles) {
      p.applyForce(f);
    }
  }

  void intersection() {
    for (Particle p : particles) {
      p.intersects(particles);
    }
  }


  void update() {
    for (int i = particles.size()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.update();
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }


//old
  //void run() {
  //  for (int i = particles.size()-1; i >= 0; i--) {
  //    Particle p = particles.get(i);
  //    p.run();
  //    if (p.isDead()) {
  //      particles.remove(i);
  //    }
  //  }
  //}
}