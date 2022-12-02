import g4p_controls.*;
int EconomyPercent;
int BusinessPercent;
  
  
//number of blocks of seats each class has
int firstNum; 
int buisnessNum;
int economyNum;

//number of seats long each class is
int firstLen;
int buisnessLen;
int economyLen;

//number of seats wide each class is
int firstClassWidth;
int businessSidesWidth;
int economySidesWidth;
int businessMiddleWidth;
int economyMiddleWidth;

//seat size
int economySize;
int businessSize;
int firstClassSize;

float businessSpacing = businessSize/5;
float economySpacing = economySize/7;
float firstClassSpacing = firstClassSize/3;

//price per seat
float economyPrice = 10;
float businessPrice = 10;
float firstClassPrice = 10;

void resetvalues(){
}

void setup(){
  size(1000, 500);
  createGUI();
  getValues();
  
  //noLoop();
  
  Seat_Block b = new Seat_Block(500, 250, 5, 10, 20);

  b.drawBlock();
}

void draw(){
  
  background(255);
  getValues();
  
  //noLoop();
  
  Seat_Block b = new Seat_Block(500, 250, 5, 10, 20);

  b.drawBlock();
  
}

void getValues() {
 
  businessMiddleWidth = int(BusinessMidDrop.getSelectedText());
  businessSidesWidth = int(BusinessSideDrop.getSelectedText());
  economyMiddleWidth = int(EconomyMidDrop.getSelectedText());
  economySidesWidth = int(EconomySideDrop.getSelectedText());
  
  businessSpacing = businessSize/3;
  economySpacing = economySize/5;
  firstClassSpacing = firstClassSize/2;
  
  economySize = 10;
  businessSize = 13;
  firstClassSize = 30;
  
  EconomyPercent = EconomyPercentage.getValueI();
  BusinessPercent = BusinessPercentage.getValueI();
}
