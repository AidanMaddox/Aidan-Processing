class p2Rock{  //sets up a new class
  float number=random(400,780);//all of the variables for the player 1
  float size = random(10,50);
  float y=0;
  int score=0;
  int health=10;
  int m;
  void display(){//starts the display loop function
    ellipse(number,y,size,size);//makes the falling object at a random place with a random size
    if(y<height+size){//makes the object appear to fall
      y=y+10;
    }
    if(y>height+size){//respawns the object at a new random location
      y=0;
      number = random(400,780);
      size = random(10,50);
        
    }
     if (y<=p2y+25+(size/2) && y>=p2y-25-(size/2) && number>=p2x-25-(size/2) && number<=p2x+25+(size/2)){//code inside the () detects if the object has come in contact with the player
      y = 0;//next 2 lines reset the object
      number = random(420,800);
      size = random(10,50);
      score=score + 1;//adds one point to score
      m=millis();//starts a clock
      arduino.digitalWrite(led2,Arduino.HIGH);//turns on the led
    }
      if(millis()-m>500){//if the clock has been running for .5 second
        arduino.digitalWrite(led2,Arduino.LOW);//turn the led off
      
      
      
     }
    
    textSize(50);//sizes score text
    text(score,500,75);//prints the score
  }
}
