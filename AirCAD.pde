//comment wise, only this left

//inports GUI tools
import g4p_controls.*;

//sets global variables
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

//sets up the screen, GUI (and its values) and plane, then updates the planes values
void setup(){
  size(1300, 700);
  createGUI();
  getValues();
  
  plane = new Plane();
  plane.updateValues();
  
}

//draws the plane after updating its (and the GUI's) values
void draw(){
  
  background(255);
  getValues();
  plane.updateValues();
  plane.drawPlane();
}

//gets the value that each of the sliders is set to then sets if to what its coorisponding global variable is
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

//Saves what the current values of all the sliders are in a save txt file
void savePlane () {
  
  PrintWriter saveFile = createWriter("save.txt");
  
  saveFile.println(economySidesWidth+","+economyMiddleWidth+","+businessSidesWidth+","+businessMiddleWidth+","+int(economyPercent*100)+","+int(businessPercent*100)+","+planeDistance+","+planeSize);
  saveFile.flush();
  saveFile.close();
}

//loads the slider values from the save txt file
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
