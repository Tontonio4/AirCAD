

class Economy extends Row {

  Economy (float x, float y, Plane p) {

    this.position = new PVector();
    this.planeIn = p;
    this.position.x = x;
    this.position.y = y;
    this.seatSize = this.planeIn.econSeatSize;
    this.numSeats = (2*this.planeIn.econSideWidth + economyMiddleWidth);
    this.corridorWidth = (this.planeIn.planeWidth - this.seatSize*this.numSeats)/2;

    this.price = this.numSeats*economyPrice;
  }

  void drawRow() {

    float y = this.position.y - (this.seatSize*(economyMiddleWidth/2.0)) - this.corridorWidth - (this.seatSize * (this.planeIn.econSideWidth));
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {
      
      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }
    
    y += this.corridorWidth;

    for (int i = 0; i < economyMiddleWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;  
    }
    
    y += this.corridorWidth;
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }
    
    this.drawBackrests();
  }
  
  void drawBackrests () {

    float y = this.position.y - (this.seatSize*(economyMiddleWidth/2.0)) - this.corridorWidth - (this.seatSize * (this.planeIn.econSideWidth));
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {
      
      this.drawBackrest(this.position.x, y);
      y += this.seatSize;
    }
    
    y += this.corridorWidth;

    for (int i = 0; i < economyMiddleWidth; i++) {

      this.drawBackrest(this.position.x, y);
      y += this.seatSize;  
    }
    
    y += this.corridorWidth;
    
    for (int i = 0; i < this.planeIn.econSideWidth; i++) {

      this.drawBackrest(this.position.x, y);
      y += this.seatSize;
    }
  }
}
