
//defines a row, which both the economy and buisness classes fall under
class Row {
  
  PVector position;
  int numSeats;
  float price, corridorWidth, seatSize;
  Plane planeIn;
  
  Row(){}

//potential later upgrade moving the process that draws the rows here
  void drawRow() {}

//draws the seats based on an x and y value given (the size is determined by the class, which both the function (in buisness or economy) and this class have

  void drawSeat(float x, float y) {
  //sets fill color
    fill(180);
    //draws the main square being the seat cussion
    square(x, y, this.seatSize);
    
    //draws the armrests and head rest, leading to the seat looking more intuative and 
    rect(x, y-this.seatSize/10, this.seatSize-this.seatSize/6, this.seatSize/5.0);
    rect(x, y+(this.seatSize*0.9), this.seatSize-this.seatSize/6, this.seatSize/5.0);
    rect(x+this.seatSize-this.seatSize/6, y, this.seatSize/6, this.seatSize);
    
  }
  
  //another possible future upgrade, moving the row upload object to this class rather than in buisness or economy 
  void uploadRow () {}


}
