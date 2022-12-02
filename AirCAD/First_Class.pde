

class FirstClass extends Row{

  FirstClass (float x, float y) {

    this.position = new PVector();

    this.position.x = x;
    this.position.y = y;
    this.seatSize = firstClassSize;
    this.numSeats = firstClassWidth;

    this.price = this.numSeats*firstClassPrice;
  }

  void drawSeat(float x, float y) {
    fill(0);
    square(x, y+this.seatSize/2, this.seatSize);
  }

  void drawRow() {

    float y = this.position.y - 200/2;
    
    for (int i = 0; i < this.numSeats; i++) {

      this.drawSeat(this.position.x, y);
      y += 200/(firstClassWidth-1) ;
    }
  }
}
