Bacteria hue;
 void setup()   
 {     
 	size(800,800);
 	hue = new Bacteria(100,100,166);  
 }   
 void draw()   
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
 	void move(){
 		myX=myX+((int)(Math.random()*5))-2;
 		myY=myY+((int)(Math.random()*5))-2;
 	}
 	void show(){
 		fill(colorBact);
 		ellipse(myX,myY,50,50);
 	}
 }    