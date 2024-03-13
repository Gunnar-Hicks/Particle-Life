/*
Made for the Processing IDE

Set desired number of particles by changing numTypes
Set desired number of particles by changing numParticles. Higher values will result in higher resource usage.

Press any key while the simulation is running to randomize particle attributes.
*/

int numTypes = 10;
int colorStep = 360/numTypes;
int numParticles = 1000;
ArrayList<particle> swarm;

float[][] forces;
float[][] minDistances;
float[][] radii;


void setup() {
  size(1920, 1080);
  colorMode(HSB, 360, 100, 100);
  noStroke();
  swarm = new ArrayList<particle>();
  for(int i = 0; i < numParticles; i++) {
    swarm.add(new particle());
  }
  forces = new float[numTypes][numTypes];
  minDistances = new float[numTypes][numTypes];
  radii = new float[numTypes][numTypes];
  setParameters();
}

void draw(){
  background(0);
  for(particle p: swarm){
    p.update();
    p.display();
  }
}

void keyPressed(){
  setParameters(); 
}

void setParameters(){
  for(int i = 0; i < numTypes; i++) {
    for(int j = 0; j < numTypes; j++) {
      forces[i][j] = random(0.3,1.0);
      if(random(100) < 50) {
        forces[i][j] *= -1;
      }
      minDistances[i][j] = random(30, 50);
      radii[i][j] = random(70, 250);
    }
  }
}
