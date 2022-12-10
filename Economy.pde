
//defines economy as a kind of row
class Economy extends Row {

  Economy (float x, float y, Plane p) {

    this.position = new PVector();
    this.planeIn = p;
    this.position.x = x;
    this.position.y = y;
    this.seatSize = this.planeIn.econSeatSize;
    this.numSeats = (2*this.planeIn.econSideWidth + this.planeIn.econMidWidth);
    this.corridorWidth = (this.planeIn.planeWidth - this.seatSize*this.numSeats)/2;

    this.price = this.numSeats*this.planeIn.econSeatPrice;
  }

//draws the row
  void drawRow() {

//gets how far apart the columns of seats are
    float y = this.position.y - (this.seatSize*(this.planeIn.econMidWidth/2.0)) - this.corridorWidth - (this.seatSize * (this.planeIn.econSideWidth));
    
    //goes through the number of buisness seats are on the side of the plane and draws them
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {
      
      //draws the seats in their position then adjusts down for the next column
      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }
    
    //moves y down to account for the corridor between the top and middle
    y += this.corridorWidth;

    for (int i = 0; i < this.planeIn.econMidWidth; i++) {
      //draws the seats and adjusts down
      this.drawSeat(this.position.x, y);
      y += this.seatSize;  
    }
    
    //moves y down to account for the corridor betweenthe middle and bottom
    y += this.corridorWidth;
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {
      //draws the seats and adjusts down
      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }

  }
  
  //uses the same logic as drawing, but instead of drawing it, forwards it to the function that prints it in the txt file
  void uploadRow() {
  
    float y = this.position.y - (this.seatSize*(this.planeIn.econMidWidth/2.0)) - this.corridorWidth - (this.seatSize * (this.planeIn.econSideWidth));
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {
      this.planeIn.seatBought.println("false");
      this.planeIn.econPos.println(this.position.x + "," + y);
      y += this.seatSize;
    }
    
    y += this.corridorWidth;

    for (int i = 0; i < this.planeIn.econMidWidth; i++) {
      this.planeIn.seatBought.println("false");
      this.planeIn.econPos.println(this.position.x + "," + y);
      y += this.seatSize;  
    }
    
    y += this.corridorWidth;
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {
      this.planeIn.seatBought.println("false");
      this.planeIn.econPos.println(this.position.x + "," + y);
      y += this.seatSize;
    }
  }
}
