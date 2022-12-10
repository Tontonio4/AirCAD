//comment wise, only this and ___ left

import g4p_controls.*;

float economyPercent;
float businessPercent;

//number of seats wide each class is
int firstClassWidth;
int economySidesWidth;
int economyMiddleWidth;
int businessSidesWidth;
int businessMiddleWidth;
int planeDistance;

int planeSize;

Plane plane;

void setup(){
  size(1300, 700);
  createGUI();
  getValues();
  
  plane = new Plane();
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
  
  planeDistance = int(travelDistance.getText());
  planeSize = PlaneSizeSlider.getValueI();
  
  economyPercent = EconomyPercentage.getValueI()/100.0;
  businessPercent = BusinessPercentage.getValueI()/100.0;
}
