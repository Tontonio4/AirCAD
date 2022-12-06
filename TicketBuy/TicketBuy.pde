

Plane_Ticket planeTicket;

void setup() {

  size(1300, 700);
  planeTicket = new Plane_Ticket();
}

void draw() {
  background(255);
  planeTicket.drawPlane();
}

void mouseClicked() { 
  planeTicket.selectSeat();
}
