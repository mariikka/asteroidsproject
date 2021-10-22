class Bullet extends GameObjects {

  int timer;

  //construct
  Bullet() {
    timer = 90;
    lives = 1;
    location = new PVector(myShip.location.x, myShip.location.y);
    velocity = new PVector (myShip.direction.x, myShip.direction.y);
    velocity.setMag(5);
    velocity.add(myShip.velocity);
    size = 5;
  }

  void show() {
    strokeWeight(5);
    stroke(255);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    super.act();
    timer--;
    if (timer ==0) {
      lives = 0;
    }
    
    if (mode == GAMEOVER){
    lives = 0;
    }
  }
}
