void intro() {
   
   
  imageMode(CORNER);
image(gif[f], 0, 0, width, height);
  f = f + 1;
  if (f == numberOfFrames) f = 0;
  
//title
   textFont(font1);
   textSize(100);
   fill(255);
  text("ASTEROIDS", 130, 300);
  textSize(40);

  text("press T to teleport", 20, 50);
  text("bar on the left shows teleport limit", 20, 100);
  text("spacebar to shoot", 20, 150);
  
  //start button

  stroke(255);
  rectMode(CORNER);
  fill(#6881B2);
  strokeWeight(5);
  rect(200, 400, 400, 100, 50);
  fill(255);
  textSize(95);
  text("START", 265, 489);
}

void introClicks() {
  if (mouseX > 200 && mouseX < 600 && mouseY> 400 && mouseY < 500) {
      mode = GAME;
          minim = new Minim (this);
    gamesong = minim.loadFile("gamesong.mp3");
    gamesong.play();
  }


}
