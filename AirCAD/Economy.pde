

class Economy extends Row {

  Economy (float x, float y) {

    this.position = new PVector();

    this.position.x = x;
    this.position.y = y;
    this.seatSize = economySize;
    this.numSeats = (2*economySidesWidth + economyMiddleWidth);
    this.corridorWidth = (200 - this.seatSize*this.numSeats)/2;

    this.price = this.numSeats*economyPrice;
      
  }

  void drawSeat(float x, float y) {
    fill(200);
    square(x, y+this.seatSize/2, this.seatSize);
  }

  void drawRow() {

    float y = this.position.y - (this.seatSize*(economyMiddleWidth/2.0)) - this.corridorWidth - (this.seatSize * (economySidesWidth/2.0));
    
    for (int i = 0; i < economySidesWidth; i++) {
      
      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }
    
    y += this.corridorWidth;

    for (int i = 0; i < economyMiddleWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;  
    }
    
    y += this.corridorWidth;
    
    for (int i = 0; i < economySidesWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }
  }
}
