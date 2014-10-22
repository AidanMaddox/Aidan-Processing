/*
Coded by Aidan Maddox
October 22, 2014
*/

import ddf.minim.spi.*;//importing all needed librarys to run sketch
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
import processing.serial.*;
import org.firmata.*;
import cc.arduino.*;

Arduino arduino;
float p1x;//variable for player 1 x
float p1y=600;
float p2y=600;
float p2x;// variable for player 2 x

float z=0;
float y=0;

float p1score=0;//player scores
float p2score=0;

int pot1 = 0;//sets the pis on arduino
int pot2=1;
int led=12;
int led2=11;


int read1;//funtion that reads the pots
int read2;

Minim minim;
AudioPlayer player;

p1Rock p1r=new p1Rock();//calls apon the classes that create the falling objects
p2Rock p2r=new p2Rock();
void setup(){
  size(800,700);//sets size of window
  arduino = new Arduino(this, Arduino.list()[2], 57600); //sets up the arduino inputs and outputs
    arduino.pinMode(pot1, Arduino.INPUT);
    arduino.pinMode(pot2, Arduino.INPUT);
    arduino.pinMode(led,Arduino.OUTPUT);
    arduino.pinMode(led2,Arduino.OUTPUT);
    
    
    minim = new Minim(this);
    player = minim.loadFile("Kraddy Android.mp3");//loads the music file
    player.play();//starts playing the music file

}

void draw(){
  read1=arduino.analogRead(pot1);//makes read1 and read2 the value of the pot1 and 2
  read2=arduino.analogRead(pot2);
  
  p1x=map(read1, 980, 1023,20,370); //changes the range given by the pots to needed range
  p2x=map(read2,980,1023,420,775);
 
  background(0,0,255);//sets the background to refresh every frame
  p1r.display();//displays the falling objects
  p2r.display();
  rectMode(CENTER);//makes all of the rectangles values start from their center
  rect(width/2,height/2,10,800);//creates the wall
  if(p1x<20){  //prevent player from moving of screen
  p1x=25;
  }
  if(p2x<430){    //prevents player from moving into p1x space
    p2x=430;
  }
  for(int i=0;i<=17.5; i++){    //attempt at making the players less twitchy
    z=20+(i*20);
    if(p1x>=z-15 && p1x<=z+15){
      p1x=z;
      break;
    }
  }
for(int y=0;y<=17.5; y++){  //attempt at making the players less twitchy
    z=20+(y*20);
    if(p2x>=z-15 && p2x<=z+15){
      p2x=z;
      break;
    }
  }
  ellipse(p1x,600,50,50);//creates player 1
  ellipse(p2x,600,50,50);//creates player 2
  println(p2x);//prints the pot values
  println(p1x);
}

