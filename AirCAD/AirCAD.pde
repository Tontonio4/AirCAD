import g4p_controls.*;
float economyPercent;
float businessPercent;

//number of seats wide each class is
int firstClassWidth;
int economySidesWidth;
int economyMiddleWidth;
int businessSidesWidth;
int businessMiddleWidth;

float firstClassPrice = 10;
float econPrice;
float buisPrice;

int planeSize;

Plane plane = new Plane();

void setup(){
  size(1300, 700);
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
  
}

void getValues() {
  businessSidesWidth = int(BusinessSideDrop.getSelectedText());
  businessMiddleWidth = int(BusinessMidDrop.getSelectedText());
  economySidesWidth = int(EconomySideDrop.getSelectedText());
  economyMiddleWidth = int(EconomyMidDrop.getSelectedText());
  firstClassWidth = 3;
  
  econPrice = float(economySeatPrice.getText());
  buisPrice = float(businessSeatPrice.getText());
  
  planeSize = PlaneSizeSlider.getValueI();
  
  economyPercent = EconomyPercentage.getValueI()/100.0;
  businessPercent = BusinessPercentage.getValueI()/100.0;
}
