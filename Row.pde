

class Row {
  
  PVector position;
  int numSeats;
  float price, corridorWidth, seatSize;
  Plane planeIn;
  
  Row(){}

  void drawRow() {}

  void drawSeat(float x, float y) {
    fill(180);
    square(x, y, this.seatSize);
    rect(x, y-this.seatSize/10, this.seatSize-this.seatSize/6, this.seatSize/5.0);
    rect(x, y+(this.seatSize*0.9), this.seatSize-this.seatSize/6, this.seatSize/5.0);
    rect(x+this.seatSize-this.seatSize/6, y, this.seatSize/6, this.seatSize);
    
  }
  
  void uploadRow () {}


}
