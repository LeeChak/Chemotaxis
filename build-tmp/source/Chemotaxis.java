import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class Chemotaxis extends PApplet {

Bacteria hue;
 public void setup()   
 {     
 	size(800,800);
 	hue = new Bacteria(100,100,166);  
 }   
 public void draw()   
 {    
 	background(0,255,0);
 	hue.move();
 	hue.show(); 
 }  

 class Bacteria    
 {     
 	int myX, myY, colorBact;
 	Bacteria(int x, int y, int z){
 		myX=x;
 		myY=y;
 		colorBact=z;
 	}
 	public void move(){
 		myX=myX+((int)(Math.random()*5))-2;
 		myY=myY+((int)(Math.random()*5))-2;
 	}
 	public void show(){
 		fill(colorBact);
 		ellipse(myX,myY,50,50);
 	}
 }    
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "Chemotaxis" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
