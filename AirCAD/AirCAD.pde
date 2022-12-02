import g4p_controls.*;
int economyPercent;
int businessPercent;

//number of seats wide each class is
int firstClassWidth;
int businessSidesWidth;
int economySidesWidth;
int businessMiddleWidth;
int economyMiddleWidth;

//price per seat
float economyPrice = 10;
float businessPrice = 10;
float firstClassPrice = 10;

int planeSize;

Plane plane = new Plane();

void setup(){
  size(1300, 500);
  createGUI();
  getValues();
  
  Plane plane = new Plane();
  plane.updateValues();
  

  
}

void draw(){
  
  background(255);
  getValues();
  plane.updateValues();
  plane.drawPlane();
 //line(0,height/2, width, height/2);
  
}

void getValues() {
 
  businessMiddleWidth = int(BusinessMidDrop.getSelectedText());
  businessSidesWidth = int(BusinessSideDrop.getSelectedText());
  economyMiddleWidth = int(EconomyMidDrop.getSelectedText());
  economySidesWidth = int(EconomySideDrop.getSelectedText());
  firstClassWidth = 3;
  
  planeSize = PlaneSizeSlider.getValueI();
  
  economyPercent = EconomyPercentage.getValueI();
  businessPercent = BusinessPercentage.getValueI();
}
