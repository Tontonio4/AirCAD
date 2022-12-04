

class Seat_Block extends Plane_Part {

  int numRows, numFirstClassRows, numBusinessRows, numEconomyRows;
  
  
  Seat_Block (float x, float y, int nFCR, int nBR, int nER, Plane p) {

    this.position = new PVector();
    this.position.x = x;
    this.position.y = y;
    this.planeIn = p;
    this.numFirstClassRows = nFCR;
    this.numBusinessRows = nBR;
    this.numEconomyRows = nER;

    this.numRows = nFCR + nBR + nER;

  }
  
  ArrayList<Row> makeRows() {
    
    //float xRow = this.position.x - ((this.planeIn.firstSeatSize+this.planeIn.firstSpacing)*this.numFirstClassRows + (this.planeIn.buisSeatSize+this.planeIn.buisSpacing)*this.numBusinessRows + (this.planeIn.econSeatSize+this.planeIn.econSpacing)*this.numEconomyRows)/2;
    float xRow = this.position.x;
    ArrayList<Row> rows = new ArrayList<Row>();
    
    for (int i = 0; i < this.numFirstClassRows; i++) {
    
      Row row = new FirstClass(xRow, this.position.y, this.planeIn);
      rows.add(row);
      xRow += this.planeIn.firstSpacing + this.planeIn.firstSeatSize;
    }
    
    for (int i = 0; i < this.numBusinessRows; i++) {

      Row row = new Business(xRow, this.position.y, this.planeIn);
      rows.add(row);
      xRow += this.planeIn.buisSpacing+this.planeIn.buisSeatSize;
    }

    for (int i = 0; i < this.numEconomyRows; i++){

      Row row = new Economy(xRow, this.position.y, this.planeIn);
      rows.add(row);
      xRow += this.planeIn.econSpacing + this.planeIn.econSeatSize;
    }
    
    return rows;
  }

  void drawMe() {
    
    ArrayList<Row> rows = this.makeRows();
    for (int i = 0; i < rows.size(); i++) {

      rows.get(i).drawRow();
    }
  }
}
