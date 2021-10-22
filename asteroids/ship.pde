class Ship extends GameObjects {

  //instance variables

  PVector direction;
  int shotTimer, threshold;
  boolean immunity, immunity1;
  int timerImmune, timerImmune1;
  color Stroke;
  int teleTime;
  int teleFill;



  //construct
  Ship() {
    lives = 3;
    Stroke = 255;
    teleTime = 0;
   teleFill = teleTime;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 20;
    immunity = true;
    immunity1 = true;
    timerImmune = 180;
    timerImmune1 = 5;
  }

  //behaviour 
  void show() {
    stroke(255);
    strokeWeight(5);
    fill(255, 0, 0);
    rectMode(CORNER);
    rect(10, 20, 40, teleFill);
 

   pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading());
    noFill();
    strokeWeight(5);
    stroke(Stroke);
    triangle(-25, -12.5, -25, 12.5, 25, 0);
    popMatrix();
  }

  void act() {
    super.act();
    
    teleTime++;
    teleFill++;
    
  
    //ufo bullets

    int in = 0;
    while (in<myObjects.size()) {
      GameObjects myObj = myObjects.get(in);
      if (myObj instanceof ufoBullet) {

        if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <= 50) {

          if (immunity == true) {
            timerImmune--;

            if (timerImmune < 0) {
              immunity = false;
              Stroke = 255;
              timerImmune = 180;
            }
          }
          if (immunity == false) {

            lives = lives - 1;
            immunity = true;
          }
        }
      }
      in++;
    }
    if (winCount == 21) {
      mode = GAMEOVER;
    }

    shotTimer++;

    if (upkey) { 
      velocity.add(direction);
      myObjects.add(new Fire());
      myObjects.add(new Fire());
      myObjects.add(new Fire());
    }
    if (downkey) velocity.sub(direction);
    if (leftkey) direction.rotate(radians(-5));
    if (rightkey) direction.rotate(radians(5));
    if (spacekey && shotTimer > threshold) {
       myObjects.add (new Bullet());
      shotTimer = 0;
    }
    
   if (teleTime > 180) {
          teleFill = 0;
    if (teleport) {


      location.x = random(0, width);
        location.y = random(0, height);
     
       int i = 0;
    while (i<myObjects.size()) {
      GameObjects myObj = myObjects.get(i);
      if (myObj instanceof Asteroid) {
        while (dist(location.x, location.y, myObj.location.x, myObj.location.y)<200){
               immunity1 = true;
           location.x = random(0, width);
        location.y = random(0, height);
        }
       
      }
      i++;
    }
     teleTime = 0;

    }
  }


    if (immunity == false) {
      int i = 0;
      while (i<myObjects.size()) {
        GameObjects myObj = myObjects.get(i);
        if (myObj instanceof Asteroid) {
          if (dist(location.x, location.y, myObj.location.x, myObj.location.y) <90) {
            lives--;
            immunity = true;
          }
        }
        i++;
      }
    }

    if (immunity == true) {
      Stroke = #D357D3;
      timerImmune--;
      if (timerImmune < 0) {
        immunity = false;
        Stroke = 255;
        timerImmune = 180;
      }
    }

   if (immunity1 == true) {

      timerImmune1--;
      if (timerImmune1 < 0) {
        immunity1 = false;
        Stroke = 255;
        timerImmune1 = 5;
      }
    }
    if (lives == 0) {
      mode = GAMEOVER;
       lives = 3;
    Stroke = 255;
    teleTime = 0;
   teleFill = teleTime;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0);
    direction = new PVector(0, -0.1);
    shotTimer = 0;
    threshold = 20;
    immunity = true;
    immunity1 = true;
    timerImmune = 180;
    timerImmune1 = 5;

    }
  }
}
