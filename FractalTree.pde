private double fractionLength = .7; 
private int smallestBranch = 80; 
private double branchAngle = 1; 
private int counter = 0;
public void setup() 
{   
	size(500, 500);
  noLoop();
} 
public void draw() 
{   
	background(255);
  stroke(0, 255, 0);
  line(250, 400, 250, 300);
  
  smallestBranch = (int)(smallestBranch * Math.pow(0.7, counter));
  
	drawBranches(250, 300, 80, 3*PI/2);  //will add later 
  fill(#9D6116);
  noStroke();
  ellipse(250, 400, 50, 50); 
} 

public void mouseClicked(){
  if (counter < 4){
    counter++;
    redraw();
  }
}

public void drawBranches(float x,float y, double branchLength, double angle) 
{   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  
  float endX1 = (float)(x + (branchLength * Math.cos(angle1)));
  float endY1 = (float)(y + (branchLength * Math.sin(angle1)));
  float endX2 = (float)(x + (branchLength * Math.cos(angle2)));
  float endY2 = (float)(y + (branchLength * Math.sin(angle2)));
  
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);
  
  if (branchLength <= smallestBranch)
    return;
  else{
    drawBranches(endX1, endY1, branchLength * fractionLength, angle1);
    drawBranches(endX2, endY2, branchLength * fractionLength, angle2);
  }
} 
