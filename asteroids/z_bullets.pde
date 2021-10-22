class ufoBullet extends GameObjects {

  int timer;

  //construct
  ufoBullet() {
  
    lives = 1;
      timer = 90;
    location = new PVector(myUfo.location.x, myUfo.location.y);
    velocity = new PVector (myShip.location.x-myUfo.location.x, myShip.location.y-myUfo.location.y);
    velocity.setMag(5);
    velocity.add(myUfo.velocity);
    size = 5;
  }

  void show() {
    stroke(255, 0, 0);
    strokeWeight(5);
    noFill();
    ellipse(location.x, location.y, size, size);
  }

  void act() {
    
     timer--;
    if (timer == 0) {
      lives = 0;
    }
    super.act();
   
  }
}
