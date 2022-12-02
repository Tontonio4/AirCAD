
class Business extends Row {

  Business (float x, float y) {

    this.position = new PVector();

    this.position.x = x;
    this.position.y = y;
    this.seatSize = businessSize;
    this.numSeats = (2*businessSidesWidth + businessMiddleWidth);
    this.corridorWidth = (200.0 - this.seatSize*this.numSeats)/2.0;
    this.price = this.numSeats*businessPrice;
      
  }

  void drawSeat(float x, float y) {
    fill(200);
    square(x, y+this.seatSize/2, this.seatSize);
  }

  void drawRow() {

    float y = this.position.y - (this.seatSize*(businessMiddleWidth/2.0)) - this.corridorWidth - (this.seatSize * (businessSidesWidth/2.0));
    
    for (int i = 0; i < businessSidesWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }

    y += this.corridorWidth;

    for (int i = 0; i < businessMiddleWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;  
    }
    
    y += this.corridorWidth;
    
    for (int i = 0; i < businessSidesWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }
  }
}
