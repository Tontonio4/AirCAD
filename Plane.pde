
//width of seats 10 (econ), 13 (buis), first later
// bathroom: 

//input will be percentage for each class of sear, automatically makes blocks based on length. 
//input is plane length and % of each class

class Plane {
  //how long/ wide the plane is in pixels
  float planeWidth;
  float planeLength;

  //how wide each block is depending on class
  int firstWidth;
  int buisSideWidth;
  int buisMidWidth;
  int econSideWidth;
  int econMidWidth;
  
  float buisSpacing;
  float econSpacing;
  float firstSpacing;

  float buisSeatSize;
  float econSeatSize;
  float firstSeatSize;
  int numCorridors;
  
  float buisSeatPrice;
  float econSeatPrice;
  
  float buisTotalPrice;
  float econTotalPrice;
  
  float totalPrice;
  
  PrintWriter econPos;
  PrintWriter buisPos;
  PrintWriter planeInfo;
  PrintWriter exitPos;

  Plane(){

    //uses plane length and % of each class to get the the number of blocks of each class and width to get the side and mid width of each class   

    this.updateValues();

  }
  
  
  void updateValues () {
    
    this.firstWidth = firstClassWidth;
    this.buisSideWidth = businessSidesWidth;
    this.buisMidWidth = businessMiddleWidth;
    this.econSideWidth = economySidesWidth;
    this.econMidWidth = economyMiddleWidth;
    
    this.buisSeatPrice = buisPrice;
    this.econSeatPrice = econPrice;
    
    this.planeLength = width*0.98;
    
    this.econSeatSize = (this.planeLength/planeSize)*0.6;
    this.buisSeatSize = this.econSeatSize*1.15;
    this.firstSeatSize = this.econSeatSize*4;
    
    this.buisSpacing = this.buisSeatSize/2.5;
    this.econSpacing = this.econSeatSize/3;
    this.firstSpacing = this.firstSeatSize/3;
    
    
    
    if ((this.econMidWidth > 0 && economyPercent > 0) || (this.buisMidWidth > 0 && businessPercent > 0)) this.numCorridors = 2;
    else this.numCorridors = 1;
    
    if (economyPercent != 0) {
      
      this.planeWidth = this.econSeatSize*this.econSideWidth*2 + this.econSeatSize*this.econMidWidth + numCorridors*this.econSeatSize*1.5;

      if (this.planeWidth < this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5 && businessPercent != 0) {
        this.planeWidth = this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5;
      }   
    }
    else {

      this.planeWidth = this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5;
    }
    
  }
  
  ArrayList<Plane_Part> calculatePlane () {
    
    int numExits;
    int numBlocks;
    float x = width/2 - this.planeLength/2.0;
    float exitSize = this.buisSeatSize*2;
    int numBuisRows;
    int numEconRows;
    Exit exit;
    Seat_Block block;
    
    ArrayList<Plane_Part> parts = new ArrayList<Plane_Part>();
    
    if (planeSize >= 45) numExits = 4;
    else if (planeSize >= 33) numExits = 3;
    else numExits = 2;
    
    numBlocks = numExits - 1;
    
    numBuisRows = int(((this.planeLength - numExits*exitSize)*businessPercent)/(this.buisSeatSize+this.buisSpacing));
    if (economyPercent != 0) {
    numEconRows = int((this.planeLength - numExits*exitSize - (this.buisSeatSize+this.buisSpacing)*numBuisRows)/(this.econSeatSize+this.econSpacing));
    }
    else numEconRows = 0;
    
    this.econTotalPrice = numEconRows*this.econSeatPrice*this.econSideWidth*2 + numEconRows*this.econSeatPrice*this.econMidWidth;
    this.buisTotalPrice = numBuisRows*this.buisSeatPrice*this.buisSideWidth*2 + numBuisRows*this.buisSeatPrice*this.buisMidWidth;
    
    this.totalPrice = this.econTotalPrice+this.buisTotalPrice;
    
    exit = new Exit(x, height/2, exitSize, this);
    parts.add(exit);
    x += exitSize;
    
    if (numBlocks == 1) {
      
      block = new Seat_Block(x, height/2, 0, numBuisRows, numEconRows, this);
      parts.add(block);
      x += (this.buisSeatSize+this.buisSpacing)*numBuisRows + (this.econSeatSize+this.econSpacing)*numEconRows - this.econSpacing;
      exit = new Exit(x, height/2, exitSize, this);
      parts.add(exit);
      
    }
    else if (numBlocks == 2) {
      
      if (businessPercent >= 0.3 && businessPercent <= 0.5) {
        
        block = new Seat_Block(x, height/2, 0, numBuisRows, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*numBuisRows - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        
        block = new Seat_Block(x, height/2, 0, 0, numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRows - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        
      }
      
      else if (businessPercent <= 0.3) {
        
        int numEconRowsPlaced = int((this.planeLength/2 - 1.5*exitSize - (this.buisSeatSize+this.buisSpacing)*numBuisRows)/(this.econSeatSize+this.econSpacing));
        
        block = new Seat_Block(x, height/2, 0, numBuisRows, numEconRowsPlaced, this);
        parts.add(block);
        x += ((this.buisSeatSize+this.buisSpacing)*numBuisRows + (this.econSeatSize+this.econSpacing)*numEconRowsPlaced) - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        
        numEconRows -= numEconRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, 0, numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRows - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        
      }
      else {
        
        int numBuisRowsPlaced = int((this.planeLength/2 - 1.5*exitSize)/(this.buisSeatSize+this.buisSpacing));
        
        block = new Seat_Block(x, height/2, 0, numBuisRowsPlaced, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*numBuisRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        numBuisRows -= numBuisRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, numBuisRows, numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRows + (this.buisSeatSize+this.buisSpacing)*numBuisRows - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        
      }
      
    }
    else {
       
      if (businessPercent >= 0.2 && businessPercent <= 0.4) {
      
        int numEconRowsPlaced = int(((this.planeLength - numExits*exitSize)*(1.0/3.0))/(this.econSeatSize+this.econSpacing));
        
        block = new Seat_Block(x, height/2, 0, numBuisRows, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*numBuisRows - this.econSpacing;                
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        numEconRows -= numEconRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, 0, numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRows - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        block = new Seat_Block(x, height/2, 0, 0, numEconRowsPlaced, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        
      }
      else if (businessPercent <= 0.2) {
        
        int numEconRowsPlaced = int(((this.planeLength - numExits*exitSize)*(1.0/3.0))/(this.econSeatSize+this.econSpacing));
        numEconRows -= 2*numEconRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, numBuisRows, numEconRows, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*numBuisRows + (this.econSeatSize+this.econSpacing)*numEconRows - this.econSpacing;                
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        block = new Seat_Block(x, height/2, 0, 0, numEconRowsPlaced, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        numEconRows -= numEconRowsPlaced;        
        block = new Seat_Block(x, height/2, 0, 0, numEconRowsPlaced, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        
      }
      
      else if (businessPercent >= 0.4 && businessPercent <= 0.6) {
        
        int numBuisRowsPlaced = int(((this.planeLength - numExits*exitSize)*(1.0/3.0))/(this.buisSeatSize+this.buisSpacing));
        int numEconRowsPlaced = int(((this.planeLength - numExits*exitSize)*(1.0/3.0))/(this.econSeatSize+this.econSpacing));
        
        block = new Seat_Block(x, height/2, 0, numBuisRowsPlaced, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*numBuisRowsPlaced - this.econSpacing;                
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        numBuisRows -= numBuisRowsPlaced;
        numEconRows -= numEconRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, numBuisRows, numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRows + (this.buisSeatSize+this.buisSpacing)*numBuisRows - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        block = new Seat_Block(x, height/2, 0, 0, numEconRowsPlaced, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        
      }
      
      else if (businessPercent >= 0.6 && businessPercent <= 0.7) {
       
        int numBuisRowsPlaced = int(((this.planeLength - numExits*exitSize)*(1.0/3.0))/(this.buisSeatSize+this.buisSpacing));
        
        block = new Seat_Block(x, height/2, 0, numBuisRowsPlaced, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*numBuisRowsPlaced - this.econSpacing;                
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        numBuisRows -= numBuisRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, numBuisRows, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*numBuisRows - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        block = new Seat_Block(x, height/2, 0, 0, numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRows - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        
      }
      
      else {
        
        int numBuisRowsPlaced = int(((this.planeLength - numExits*exitSize)*(1.0/3.0))/(this.buisSeatSize+this.buisSpacing));
        
        block = new Seat_Block(x, height/2, 0, numBuisRowsPlaced, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*numBuisRowsPlaced - this.econSpacing;                
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        numBuisRows -= numBuisRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, numBuisRowsPlaced, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*numBuisRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        x += exitSize;
        
        numBuisRows -= numBuisRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, numBuisRows, numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*numEconRows + (this.buisSeatSize+this.buisSpacing)*numBuisRows - this.econSpacing;
        exit = new Exit(x, height/2, exitSize, this);
        parts.add(exit);
        
      }
    }
    
    return parts;
    
  }
  
  void drawPlane() {
    
    ArrayList<Plane_Part> parts = calculatePlane();
    
    fill(240);
    rect(0, height/2 - this.planeWidth/2- (this.buisSeatSize*0.2), width, this.planeWidth + (this.buisSeatSize*0.4));
    
    fill(0);
    textSize(30);
    text("Price Per Seat:", 20, 30);
    textSize(20);
    text("Economy Class:     $" + this.econSeatPrice, 50, 55); 
    text("Business Class:      $" + this.buisSeatPrice, 50, 75); 
    
    textSize(30);
    text("Total Price:", 300, 30);
    textSize(20);
    text("Economy Class:     $" + this.econTotalPrice, 330, 55); 
    text("Business Class:      $" + this.buisTotalPrice, 330, 75);    
    
    textSize(30);
    text("Total:  $" + this.totalPrice, 650, 30);
    
    for (int i = 0; i < parts.size(); i++) {
    
      parts.get(i).drawMe();
    }
  }
  
  void uploadPlane() {
    
    ArrayList<Plane_Part> parts = calculatePlane();
    
    this.econPos = createWriter("econPos.txt");
    this.buisPos = createWriter("buisPos.txt");
    this.planeInfo = createWriter("planeInfo.txt");
    this.exitPos = createWriter("exitPos.txt");
    
    for (int i = 0; i < parts.size(); i++) {
    
      parts.get(i).upload();
    }
    
    this.planeInfo.print(this.planeWidth +","+ this.planeLength +","+ this.numCorridors +","+ this.econSeatSize +","+ this.buisSeatSize +","+ this.econSeatPrice +","+ this.buisSeatPrice);
    
    this.econPos.flush();
    this.buisPos.flush();
    this.planeInfo.flush();
    this.exitPos.flush();
    
    this.econPos.close();
    this.buisPos.close();
    this.planeInfo.close();
    this.exitPos.close();
  }
}
