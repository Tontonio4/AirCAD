
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

  void drawRow() {

    float y = this.position.y - (this.seatSize*(this.planeIn.buisMidWidth/2.0)) - this.corridorWidth - (this.seatSize * (this.planeIn.buisSideWidth));
    
    for (int i = 0; i < this.planeIn.buisSideWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }

    y += this.corridorWidth;

    for (int i = 0; i < this.planeIn.buisMidWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;  
    }
    
    y += this.corridorWidth;
    
    for (int i = 0; i < this.planeIn.buisSideWidth; i++) {

      this.drawSeat(this.position.x, y);
      y += this.seatSize;
    }
  }
  
  void uploadRow() {

    float y = this.position.y - (this.seatSize*(this.planeIn.buisMidWidth/2.0)) - this.corridorWidth - (this.seatSize * (this.planeIn.buisSideWidth));
    
    for (int i = 0; i < this.planeIn.buisSideWidth; i++) {

      this.planeIn.buisPos.println(this.position.x + "," + y);
      y += this.seatSize;
    }

    y += this.corridorWidth;

    for (int i = 0; i < this.planeIn.buisMidWidth; i++) {

      this.planeIn.buisPos.println(this.position.x + "," + y);
      y += this.seatSize;  
    }
    
    y += this.corridorWidth;
    
    for (int i = 0; i < this.planeIn.buisSideWidth; i++) {

      this.planeIn.buisPos.println(this.position.x + "," + y);
      y += this.seatSize;
    }
  }
}
