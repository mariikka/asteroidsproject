void gameover() {
  imageMode(CENTER);
  rectMode(CENTER);
  image(gif1[f1], 400, 300, width, height);
  f1 = f1 + 1;
  if (f1 == numberOfFrames1) f1 = 0;

  if (winCount == 21) {
    textFont(font1);
    fill(255);
    textSize(150);
    text("YOU WIN!", 93, 200);
  }

  if (winCount < 21) {
    textFont(font1);
    fill(255);
    textSize(150);
    text("YOU LOSE.", 93, 200);
  }

  //play again button
  rectMode(CORNER);
  stroke(255);
  fill(255);
  rect(75, 450, 250, 100, 7);
  fill(0);
  textSize(55);
  text("replay", 117, 517);

  //exit button
  fill(255);
  rect(475, 450, 250, 100, 7);
  fill(0);
  textSize(69);
  text("exit", 545, 517);
}


void gameoverClicks() {

  // rect(475, 450, 250, 100, 7); (leave)
  if (mouseX> 475 && mouseX < 675+50 && mouseY > 450 && mouseY < 550) {
    exit();
  }

  //rect(75, 450, 250, 100, 7); (restart)
  if (mouseX > 75 && mouseX< 325 && mouseY> 450 && mouseY < 550) {

    mode = INTRO;
    gamesong.pause();
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
    myObjects.add(new Asteroid());
  }
}
