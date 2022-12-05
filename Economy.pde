

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

  void drawRow() {

    float y = this.position.y - (this.seatSize*(this.planeIn.econMidWidth/2.0)) - this.corridorWidth - (this.seatSize * (this.planeIn.econSideWidth));
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {
      
      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }
    
    y += this.corridorWidth;

    for (int i = 0; i < this.planeIn.econMidWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;  
    }
    
    y += this.corridorWidth;
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }

  }
  
  void uploadRow() {
  
    float y = this.position.y - (this.seatSize*(this.planeIn.econMidWidth/2.0)) - this.corridorWidth - (this.seatSize * (this.planeIn.econSideWidth));
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {
      
      this.planeIn.econPos.println(this.position.x + "," + y);
      y += this.seatSize;
    }
    
    y += this.corridorWidth;

    for (int i = 0; i < this.planeIn.econMidWidth; i++) {

      this.planeIn.econPos.println(this.position.x + "," + y);
      y += this.seatSize;  
    }
    
    y += this.corridorWidth;
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {

      this.planeIn.econPos.println(this.position.x + "," + y);
      y += this.seatSize;
    }
  }
}
