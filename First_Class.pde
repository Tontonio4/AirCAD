
//same logic as buisness and economy, but with different variables, is here to be a potential future upgrade for the program
class FirstClass extends Row{

  FirstClass (float x, float y, Plane p) {

    this.position = new PVector();
    this.planeIn = p;
    this.position.x = x;
    this.position.y = y;
    this.seatSize = this.planeIn.firstSeatSize;
    this.numSeats = this.planeIn.firstWidth;

    this.price = this.numSeats*firstClassPrice;
  }

  void drawSeat(float x, float y) {
    fill(180);
    square(x, y, this.seatSize);
  }

  void drawRow() {

    float y = this.position.y - this.planeIn.planeWidth/2;

    for (int i = 0; i < this.numSeats; i++) {

      this.drawSeat(this.position.x, y);
      y += (this.planeIn.planeWidth-this.seatSize)/(this.planeIn.firstWidth-1);
      
    }
    
  }
}
