
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
  
  

  Plane(){

    //uses plane length and % of each class to get the the number of blocks of each class and width to get the side and mid width of each class   

    this.firstWidth = firstClassWidth;
    this.buisSideWidth = businessSidesWidth;
    this.buisMidWidth = businessMiddleWidth;
    this.econSideWidth = economySidesWidth;
    this.econMidWidth = economyMiddleWidth;
    
    this.planeLength = width;
    
    this.econSeatSize = (this.planeLength/planeSize)*0.6;
    this.buisSeatSize = this.econSeatSize*1.25;
    this.firstSeatSize = this.econSeatSize*4;
    
    this.buisSpacing = this.buisSeatSize/3;
    this.econSpacing = this.econSeatSize/4;
    this.firstSpacing = this.firstSeatSize/3;
    
    int numCorridors;
    
    if (economyPercent != 0) {
      
      if (this.econMidWidth > 0) numCorridors = 2;
      else numCorridors = 1;
      
      this.planeWidth = this.econSeatSize*this.econSideWidth*2 + this.econSeatSize*this.econMidWidth + numCorridors*this.econSeatSize*1.5;
      
      if (this.buisMidWidth > 0) numCorridors = 2;
      else numCorridors = 1;
      
      if (this.planeWidth < this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5 && businessPercent != 0) {
        this.planeWidth = this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5;
      }   
    }
    else {
      
      if (this.buisMidWidth > 0) numCorridors = 2;
      else numCorridors = 1;
      
      this.planeWidth = this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5;
    }

  }
  
  void updateValues () {
    
    this.firstWidth = firstClassWidth;
    this.buisSideWidth = businessSidesWidth;
    this.buisMidWidth = businessMiddleWidth;
    this.econSideWidth = economySidesWidth;
    this.econMidWidth = economyMiddleWidth;
    
    this.planeLength = width*0.98;
    
    this.econSeatSize = (this.planeLength/planeSize)*0.6;
    this.buisSeatSize = this.econSeatSize*1.25;
    this.firstSeatSize = this.econSeatSize*4;
    
    this.buisSpacing = this.buisSeatSize/3;
    this.econSpacing = this.econSeatSize/3;
    this.firstSpacing = this.firstSeatSize/3;
    
    int numCorridors;
    
    if (economyPercent != 0) {
      
      if (this.econMidWidth > 0) numCorridors = 2;
      else numCorridors = 1;
      
      this.planeWidth = this.econSeatSize*this.econSideWidth*2 + this.econSeatSize*this.econMidWidth + numCorridors*this.econSeatSize*1.5;
      
      if (this.buisMidWidth > 0) numCorridors = 2;
      else numCorridors = 1;
      
      if (this.planeWidth < this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5 && businessPercent != 0) {
        this.planeWidth = this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5;
      }   
    }
    else {
      
      if (this.buisMidWidth > 0) numCorridors = 2;
      else numCorridors = 1;
      
      this.planeWidth = this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5;
    }
  }
  
  ArrayList<Seat_Block> calculatePlane() {
   
    ArrayList<Seat_Block> blocks = new ArrayList<Seat_Block> ();
    
    float buisSize = this.planeLength * (businessPercent/100.0);
    int buisNumRows = int(buisSize/(this.buisSeatSize + this.buisSpacing));
    int econNumRows;
    
    if (economyPercent != 0) {
      float econSize = (this.planeLength * (economyPercent/100.0)) + (buisSize-(buisNumRows*(this.buisSeatSize + this.buisSpacing)));
      econNumRows = int(econSize/(this.econSeatSize + this.econSpacing));
    }
    else {
      econNumRows = 0;
    }
    
    Seat_Block block = new Seat_Block(width/2 - this.planeLength/2, height/2, 0, buisNumRows, econNumRows, this);
    
    blocks.add(block);
    
    return blocks;
  }
  
  void drawPlane() {
    
    fill(240);
    rect(0, height/2 - this.planeWidth/2- (this.buisSeatSize*0.2), width, this.planeWidth + (this.buisSeatSize*0.4));
    
    ArrayList<Seat_Block> blocks = this.calculatePlane();
    
    for (int i = 0; i < blocks.size(); i++) {
    
      blocks.get(i).drawBlock();
    }
    
    
  }
}
