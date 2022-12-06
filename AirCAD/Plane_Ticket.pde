
class Plane_Ticket {
  
  float planeWidth, econSeatSize, buisSeatSize, econSeatPrice, buisSeatPrice, exitMidSize, exitSideSize, exitWidth;
  int numCorridors;
  Seat[] seats;
  float[] exitX;
  float[] exitY;
  
  Plane_Ticket () {
    
    String[] econPos = loadStrings("econPos.txt");
    String[] buisPos = loadStrings("buisPos.txt");
    String[] planeInfo = loadStrings("planeInfo.txt");
    String[] exitInfo = loadStrings("exitPos.txt");
    
    String partsPlaneInfo = planeInfo[0];
    planeInfo = partsPlaneInfo.split(",");
    
    this.planeWidth = float(planeInfo[0]);
    this.numCorridors = int(planeInfo[1]);
    this.econSeatSize = float(planeInfo[2]);
    this.buisSeatSize = float(planeInfo[3]);
    this.econSeatPrice = float(planeInfo[4]);
    this.buisSeatPrice = float(planeInfo[5]);
    
    this.seats = new Seat[econPos.length + buisPos.length];
    
    for (int i = 0; i < buisPos.length; i++) {
    
      String currLine = buisPos[i];
      String parts[] = currLine.split(",");
      Seat seat = new Seat(float(parts[0]), float(parts[1]), this.buisSeatSize, this.buisSeatPrice, false);
      seats[i] = seat;
      
    }
    
    for (int i = buisPos.length; i < econPos.length+buisPos.length; i++) {
    
      String currLine = econPos[i-buisPos.length];
      String parts[] = currLine.split(",");
      Seat seat = new Seat(float(parts[0]), float(parts[1]), this.econSeatSize, this.econSeatPrice, false);
      seats[i] = seat;
      
    }
    
    this.exitY = new float[exitInfo.length];
    this.exitX = new float[exitInfo.length];
    
    for (int i = 0; i < exitInfo.length; i++) {
       
      String currLine = exitInfo[i];
      String parts[] = currLine.split(",");
      
      exitX[i] = float(parts[0]);
      exitY[i] = float(parts[1]);
      
    }
    
    String currLine = exitInfo[0];
    String parts[] = currLine.split(",");
    this.exitSideSize = float(parts[2]);
    this.exitMidSize = float(parts[3]);
    this.exitWidth = float(parts[4]);
  }
  
  void drawPlane() {
  
    fill(240);
    rect(0, height/2 - this.planeWidth/2- (this.buisSeatSize*0.2), width, this.planeWidth + (this.buisSeatSize*0.4));
    
    for (int i = 0; i < this.seats.length; i++) {
      seats[i].checkMouseOver();
      seats[i].drawSeat();
    }
    fill(140);
    for (int i = 0; i < exitX.length; i++) {
      
      if (this.numCorridors == 2) {
     
        rect(exitX[i], exitY[i]-this.planeWidth/2, this.exitWidth/2, this.exitSideSize);
        rect(exitX[i], exitY[i]-this.planeWidth/2+this.exitSideSize+this.econSeatSize*1.5, this.exitWidth*0.7, this.exitMidSize);
        rect(exitX[i], exitY[i]+this.planeWidth/2-this.exitSideSize, this.exitWidth/2, this.exitSideSize);
      
      }
      else {
      
        rect(exitX[i], exitY[i]-this.planeWidth/2, this.exitWidth/2, this.exitSideSize);
        rect(exitX[i], exitY[i]+this.planeWidth/2-this.exitSideSize, this.exitWidth/2, this.exitSideSize);
      
      }
    }
  }
}
