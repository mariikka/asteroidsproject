class Ufo extends GameObjects {

  PVector direction;

  int y;
  int x;
  int shotTimer, threshold;




  Ufo() {

     shotTimer = 0;
    threshold = 50;



    lives = 1;
    y = int(random(0, height));
    x = -10;


    location = new PVector (x, y);
    velocity = new PVector (0, 1);
  }

  void show() {
    strokeWeight(1);
    stroke(255);
    fill(0, 255, 0);
    ellipse(location.x, location.y, 30, 40);
    fill(255);
    ellipse(location.x, location.y, 20, 10);
  }

  void act() {
    
     if (location.x > width+50) lives = 0;
    location.x++;
     shotTimer++;

    int i = 0;
    while (i<myObjects.size()) {
      GameObjects myObj = myObjects.get(i);
      if (myObj instanceof Bullet) {       
      if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <35){
      lives = 0;
    
      }
      }
      i++;
    }
   
    if (shotTimer > threshold){
        myObjects.add(new ufoBullet());
        shotTimer = 0;
    }
  }
}
