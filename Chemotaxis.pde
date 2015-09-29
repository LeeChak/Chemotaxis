Bacteria[] chaser = new Bacteria[1];
int clickedX = 400;
int clickedY = 400;
void setup()   
{     
	size(1000,1000);
	for(int i=0; i<chaser.length; i++){
		 chaser[i] = new Bacteria(200+(20*i),200+(20*i),randomColor());
		 chaser[i].show();
	} 
 	frameRate(100);
}   
void draw()   
{  
 	background((int)(chaser.length/5),255-(int)(chaser.length/5),0);
 	for(int j=0; j<chaser.length; j++)
 	{
 		for(int b=0;b<chaser.length;b++){
 			if(chaser[j].touching(b)==true && j!=b){
 				chaser[j].myX+=highRandom();
 				chaser[j].myY+=highRandom();
 				chaser[j].bactColor=randomColor();
 			}
 			if(chaser[j].caught()==true){
 				chaser = (Bacteria[]) append(chaser, new Bacteria(mouseX+highRandom()*3,mouseY+highRandom()*3,randomColor()));
 				chaser[j].myX+=highRandom()*3;
 				chaser[j].myY+=highRandom()*3;
 				chaser[j].bactSize+=3;
 			}
 		}
 		chaser[j].move();
 		chaser[j].show();
 	}
 	strokeWeight(30);
 	stroke(0);
 	noFill();
 	rect(100,100,800,800,25);
 	fill(randomColor());
 	stroke(randomColor());
 	strokeWeight(5);
 	ellipse(mouseX,mouseY,30,30);
}

 class Bacteria
 {     
 	int myX, myY, bactColor, bactSize;
 	Bacteria(int x, int y, int z){
 		myX=x;
 		myY=y;
 		bactColor=z;
 		bactSize=15;
 	}
 	void move(){
 		if(myX<120+(bactSize/2))
 			myX=120+(bactSize/2);
 		if(myX>880-(bactSize/2))
 			myX=880-(bactSize/2);
 		if(myY<120+(bactSize/2))
 			myY=120+(bactSize/2);
 		if(myY>880-(bactSize/2))
 			myY=880-(bactSize/2);
 		if(mouseX>myX)
 			myX=myX+((int)(Math.random()*9))-3;
 		else
 			myX=myX+((int)(Math.random()*9))-5;
		if(mouseY>myY)
 			myY=myY+((int)(Math.random()*9))-3;
 		else
 			myY=myY+((int)(Math.random()*9))-5;
 	}
 	void show(){
 		stroke(randomColor());
 		strokeWeight(2);
 		fill(bactColor);
 		ellipse(myX,myY,bactSize,bactSize);
 	}
 	boolean touching(int bactNum){
 		if(Math.abs(myX-chaser[bactNum].myX)<(bactSize+chaser[bactNum].bactSize)/2 && Math.abs(myY-chaser[bactNum].myY)<(bactSize+chaser[bactNum].bactSize)/2)
 			return true;
 		return false;
 	}
	boolean caught(){
 		if(Math.abs(myX-mouseX)<(bactSize+30)/2 && Math.abs(myY-mouseY)<(bactSize+30)/2)
 			return true;
 		return false;
 }    

}

int highRandom(){
 	int temp=0;
 	while(temp>-20 && temp<20){
 		temp=(int)(Math.random()*60)-30;
 	}
 	return temp;
}
int randomColor(){
	return color((int)(Math.random()*256),(int)(Math.random()*256),(int)(Math.random()*256));
}