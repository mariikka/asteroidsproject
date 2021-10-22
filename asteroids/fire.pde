class Fire extends GameObjects {

  int t;//transparency
  PVector nudge;



  Fire() {
    lives = 1;
    size = int(random(5, 12));
    t = int(random (200, 255));
    location = myShip.location.copy();
    nudge = myShip.direction.copy();
    nudge.rotate(PI);
    nudge.setMag(27);
    location.add(nudge);
    velocity = myShip.direction.copy();
    velocity.rotate(PI+random(-0.5, 0.5));
    velocity.setMag(5);
  }

  void show() {
    noStroke();
    fill(int(random(0, 169)), int(random(0, 255)), int(random(100, 255)), t);
    circle(location.x, location.y, size);
  }

  void act() {
    super.act();
    t = t - 20;
    if (t <= 0) {
      lives = 0;
    }
  }
}
