

class Seat_Block {

  int numRows, numFirstClassRows, numBusinessRows, numEconomyRows;
  PVector position;

  Seat_Block (int x, int y, int nFCR, int nBR, int nER) {

    this.position = new PVector();
    this.position.x = x;
    this.position.y = y;

    this.numFirstClassRows = nFCR;
    this.numBusinessRows = nBR;
    this.numEconomyRows = nER;

    this.numRows = nFCR + nBR + nER;

  }
  
  ArrayList<Row> makeRows() {
    
    float xRow = this.position.x - ((firstClassSize+firstClassSpacing)*this.numFirstClassRows + (businessSize+businessSpacing)*this.numBusinessRows + (economySize+economySpacing)*this.numEconomyRows)/2;
    ArrayList<Row> rows = new ArrayList<Row>();
    for (int i = 0; i < this.numFirstClassRows; i++) {
    
      Row row = new FirstClass(xRow, this.position.y);
      rows.add(row);
      xRow += firstClassSpacing + firstClassSize;
    }

    if (this.numFirstClassRows != 0) {
      xRow = xRow - (firstClassSpacing + firstClassSize)/2;
    }
    
    for (int i = 0; i < this.numBusinessRows; i++) {

      Row row = new Business(xRow, this.position.y);
      rows.add(row);
      xRow += businessSpacing+businessSize;
    }

    if (this.numBusinessRows != 0) {
      xRow = xRow - (businessSpacing + businessSize)/2;
    }

    for (int i = 0; i < this.numEconomyRows; i++){

      Row row = new Economy(xRow, this.position.y);
      rows.add(row);
      xRow += economySpacing + economySize;
    }
    
    return rows;
  }

  void drawBlock() {
    
    ArrayList<Row> rows = makeRows();
    for (int i = 0; i < rows.size(); i++) {

      rows.get(i).drawRow();
    }
  }
}
