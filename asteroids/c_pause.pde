void pause() {
  imageMode(CORNER);
  rectMode(CENTER);
image(gif2[f2], 0, 0, width, height);
  f2 = f2 + 1;
  if (f2 == numberOfFrames2) f2 = 0;
  
  textSize(100);
  textFont(font1);
  fill(255);
  text("PAUSED", 50, 300);
  
  //return button
  stroke(255);
  fill(255);
  rect(400, 400, 300, 100, 7);
  textSize(40);
  fill(0);
  text("return to game", 260, 410);
  
}

void pauseClicks() {
 if (mouseX > 400 && mouseX < 700 && mouseY > 400 && mouseY < 500){
 mode = GAME;

 }
 }
