
class Seat {

  float price, seatSize;
  PVector position;
  boolean mouseOver, selected, bought;
  
  Seat (float x, float y, float p, float s, boolean b) {
    
    this.position = new PVector();
    
    this.position.x = x;
    this.position.y = y;
    
    this.price = p;
    this.seatSize = s;
    
    this.bought = b;
    this.selected = false;
    this.mouseOver = false;
    
  }
  
  void checkMouseOver () {
    if (mouseX > this.position.x && mouseX < this.position.x+this.seatSize && mouseY > this.position.y && mouseY < this.position.y+this.seatSize && this.bought == false) this.mouseOver = true;
    else this.mouseOver = false;
  }
  
  void checkClicked () {
    if (this.mouseOver && this.selected == false && this.bought == false) this.selected = true;
    else if (this.mouseOver && this.selected && this.bought == false) this.selected = false;
  }
  
  void drawSeat () {
    
    if (this.bought) fill(30, 33, 230);
    else if(this.selected) fill(198, 74, 212);
    else if (this.mouseOver) fill(227, 162, 232);
    else fill(180);
  
    square(this.position.x, this.position.y, this.seatSize);
    rect(this.position.x, this.position.y-this.seatSize/10, this.seatSize-this.seatSize/6, this.seatSize/5.0);
    rect(this.position.x, this.position.y+(this.seatSize*0.9), this.seatSize-this.seatSize/6, this.seatSize/5.0);
    rect(this.position.x+this.seatSize-this.seatSize/6, this.position.y, this.seatSize/6, this.seatSize);
  } 
}
