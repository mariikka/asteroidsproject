class Asteroid extends GameObjects {

  Asteroid() {
    lives = 1;
    location = new PVector (random (0, width), random (0, height));
    velocity = new PVector (0, 1);
    velocity.rotate (random(0, TWO_PI));
    size = 100;
  }

  Asteroid(int s, float x, float y) {
    lives = 1;
    location = new PVector (x, y);
    velocity = new PVector (0, 1);
    velocity.rotate (random(0, TWO_PI));
    size = s;
  }
  void show() {

    noFill();
    strokeWeight(5);
    stroke(255);
    ellipse(location.x, location.y, size, size);
    imageMode(CENTER);
    image(asteroid1, location.x, location.y, size, size);
    
  }

  void act() {
    super.act();

    int i = 0;
    while (i<myObjects.size()) {
      GameObjects myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {

        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= size/2+myObj.size) {

          if (size > 25) {
           particle();
            myObj.lives = 0;
            lives = 0;
            myObjects.add(new Asteroid(size/2, location.x, location.y));
            myObjects.add(new Asteroid(size/2, location.x, location.y));
              winCount ++;
          } else {
            lives = 0;
           particle();
            winCount ++;
          }
        }
      }
      i++;
    }
    if (winCount == 21){
    mode = GAMEOVER;
  lives = 0;
    
    }
    
    if (mode == GAMEOVER){
          size = 100;
      lives = 0;

  
}
  }
  
  void particle(){
myObjects.add(new Particles(location.x, location.y));
myObjects.add(new Particles(location.x, location.y));
myObjects.add(new Particles(location.x, location.y));
myObjects.add(new Particles(location.x, location.y));
myObjects.add(new Particles(location.x, location.y));
myObjects.add(new Particles(location.x, location.y));
myObjects.add(new Particles(location.x, location.y));
myObjects.add(new Particles(location.x, location.y));
myObjects.add(new Particles(location.x, location.y));
myObjects.add(new Particles(location.x, location.y));
  
   
  
  
  }
  
  
  
}
