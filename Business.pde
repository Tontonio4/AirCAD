//defines buisness as a kind of row
class Business extends Row {

  Business (float x, float y, Plane p) {

    this.position = new PVector();
    this.planeIn = p;
    this.position.x = x;
    this.position.y = y;
    this.seatSize = this.planeIn.buisSeatSize;
    this.numSeats = (2*this.planeIn.buisSideWidth + this.planeIn.buisMidWidth);
    this.corridorWidth = (this.planeIn.planeWidth - this.seatSize*this.numSeats)/2.0;
    this.price = this.numSeats*this.planeIn.buisSeatPrice;
      
  }

//draws the row
  void drawRow() {

//gets how far apart the columns of seats are
    float y = this.position.y - (this.seatSize*(this.planeIn.buisMidWidth/2.0)) - this.corridorWidth - (this.seatSize * (this.planeIn.buisSideWidth));
    
    //goes through the number of buisness seats are on the side of the plane and draws them
    for (int i = 0; i < this.planeIn.buisSideWidth; i++) {

//draws the seats in their position then adjusts down for the next column
      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }

//moves y down to account for the corridor between the top and middle
    y += this.corridorWidth;

    for (int i = 0; i < this.planeIn.buisMidWidth; i++) {
      \\draws the seats and adjusts down
      this.drawSeat(this.position.x, y);
      y += this.seatSize;  
    }
    
    //moves y down to account for the corridor betweenthe middle and bottom
    y += this.corridorWidth;
    
    for (int i = 0; i < this.planeIn.buisSideWidth; i++) {
      \\draws the seats and adjusts down
      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }
  }
  
  //uses the same logic as drawing, but instead of drawing it, forwards it to the function that prints it in the txt file
  void uploadRow() {

    float y = this.position.y - (this.seatSize*(this.planeIn.buisMidWidth/2.0)) - this.corridorWidth - (this.seatSize * (this.planeIn.buisSideWidth));
    
    for (int i = 0; i < this.planeIn.buisSideWidth; i++) {
      this.planeIn.seatBought.println("false");
      this.planeIn.buisPos.println(this.position.x + "," + y);
      y += this.seatSize;
    }

    y += this.corridorWidth;

    for (int i = 0; i < this.planeIn.buisMidWidth; i++) {
      this.planeIn.seatBought.println("false");
      this.planeIn.buisPos.println(this.position.x + "," + y);
      y += this.seatSize;  
    }
    
    y += this.corridorWidth;
    
    for (int i = 0; i < this.planeIn.buisSideWidth; i++) {
      this.planeIn.seatBought.println("false");
      this.planeIn.buisPos.println(this.position.x + "," + y);
      y += this.seatSize;
    }
  }
}
