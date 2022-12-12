//comment wise, only this left

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

void savePlane () {
  
  PrintWriter saveFile = createWriter("save.txt");
  
  saveFile.println(economySidesWidth+","+economyMiddleWidth+","+businessSidesWidth+","+businessMiddleWidth+","+int(economyPercent*100)+","+int(businessPercent*100)+","+planeDistance+","+planeSize);
  saveFile.flush();
  saveFile.close();
}

void loadPlane () {
  
  String[] saveFile = loadStrings("save.txt");
  saveFile = saveFile[0].split(",");
  int midSize;
  
  if (int(saveFile[1]) == 0) midSize = 0;
  else if (int(saveFile[1]) == 3) midSize = 1; 
  else midSize = 2;
  
  EconomySideDrop.setSelected(int(saveFile[0])-1);
  EconomyMidDrop.setSelected(midSize);
  BusinessSideDrop.setSelected(int(saveFile[2])-1);
  BusinessMidDrop.setSelected(int(saveFile[3]));
  EconomyPercentage.setValue(int(saveFile[4]));
  BusinessPercentage.setValue(int(saveFile[5]));
  travelDistance.setText(saveFile[6]);
  PlaneSizeSlider.setValue(int(saveFile[7]));
  
}
