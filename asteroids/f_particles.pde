class Particles extends GameObjects {

  int t;//transparency
  PVector direction;



  Particles (float x, float y) {
    lives = 1;
    size = 10;
    t = int(random (200, 255));
    location = new PVector (x, y);
    velocity = new PVector(0, 5);
     direction = new PVector(0, -0.1);
    velocity.rotate(random(0, TWO_PI));

  }

  void show() {
    noStroke();
    fill(int(random(100, 255)), int(random(0, 255)), int(random(100, 255)), t);
    square(location.x, location.y, size);
  }

  void act() {
    direction.rotate(radians(-5));
    super.act();
    t = t - 7;
    if (t <= 0) {
      lives = 0;
     
    }
  }
}
