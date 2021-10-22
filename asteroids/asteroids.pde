//asteroids october 4th

import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

Minim minim;
AudioPlayer gamesong;


//modes
int mode;
final int INTRO = 0;
final int CONTROLS = 1;
final int GAME = 2;
final int PAUSE = 3;
final int GAMEOVER = 4;

boolean upkey, downkey, leftkey, rightkey, spacekey, teleport;
Ship myShip;
Ufo myUfo;
ArrayList<GameObjects> myObjects;

//images/fonts etc
PImage img1;
PImage asteroid1;

PImage [] gif;
int numberOfFrames;
int g;
int f;

PImage [] gif1;
int numberOfFrames1;
int g1;
int f1;

PImage [] gif2;
int numberOfFrames2;
int g2;
int f2;



PFont font1;

//asteroid counter
int winCount;

//ufo
int ufotimer;


void setup() {
  mode = INTRO;
  winCount = 0;
 
  rectMode(CENTER);
  size (800, 600);
  myShip = new Ship();
  myUfo = new Ufo();
  myObjects = new ArrayList<GameObjects>();
  myObjects.add(myShip);
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
  myObjects.add(new Asteroid());
      myObjects.add(myUfo);




  //images/fonts etc
  img1 = loadImage("stars.jpg");
  asteroid1 = loadImage("asteroid.png");
  numberOfFrames = 27;
  gif = new PImage[numberOfFrames];
  
  int g = 0;
  while(g<numberOfFrames){
  gif[g] = loadImage("frame_"+g+"_delay-0.05s.gif");
  g = g +1;
  }
  
  numberOfFrames1 = 29;
  gif1 = new PImage[numberOfFrames1];
  
  int g1 = 0;
  while(g1<numberOfFrames1){
  gif1[g1] = loadImage("frame_"+g1+"_delay-0.03s.gif");
  g1 = g1 +1;
  }
  
   numberOfFrames2 = 159;
  gif2 = new PImage[numberOfFrames2];
  
  int g2 = 0;
  while(g2<numberOfFrames2){
  gif2[g2] = loadImage("frame_"+g2+"_delay-0.06s.png");
  g2 = g2 +1;
  }
  
   font1 = createFont("marola.TTF", 200);

}

void draw() {
  background(0);
  
  
  //modes
  if (mode == INTRO) {
    intro();
  } else if (mode == CONTROLS) {
    keyPressed();
    keyReleased();
    mousePressed();
  } else if (mode == GAME) {
    game();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == PAUSE) {
    pause();
  } else {
    println("Error: Mode = " + mode);
  }
}
