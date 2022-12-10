
//is a class that contains rows of seats, and inbetween different blocks, there are bathrooms and exits
class Seat_Block extends Plane_Part {

//has the total number of rows, number of buisness rows and number of economy rows
  int numRows, numBusinessRows, numEconomyRows;
  
  
  Seat_Block (float x, float y, int nBR, int nER, Plane p) {

//gets the x and y reference point as well as the plane reference and number of buisness and economy rows. 
    this.position = new PVector();
    this.position.x = x;
    this.position.y = y;
    this.planeIn = p;
    this.numBusinessRows = nBR;
    this.numEconomyRows = nER;

    this.numRows = nFCR + nBR + nER;

  }
  
  //makes an array list of all the rows in the block
  ArrayList<Row> makeRows() {
    
    //float xRow = this.position.x - ((this.planeIn.firstSeatSize+this.planeIn.firstSpacing)*this.numFirstClassRows + (this.planeIn.buisSeatSize+this.planeIn.buisSpacing)*this.numBusinessRows + (this.planeIn.econSeatSize+this.planeIn.econSpacing)*this.numEconomyRows)/2;
    float xRow = this.position.x;
    ArrayList<Row> rows = new ArrayList<Row>();
    
    //makes the buisness rows and adds them to the array list
    for (int i = 0; i < this.numBusinessRows; i++) {

      Row row = new Business(xRow, this.position.y, this.planeIn);
      rows.add(row);
      xRow += this.planeIn.buisSpacing+this.planeIn.buisSeatSize;
    }

    //makes the economy rows and adds them to the array list
    for (int i = 0; i < this.numEconomyRows; i++){

      Row row = new Economy(xRow, this.position.y, this.planeIn);
      rows.add(row);
      xRow += this.planeIn.econSpacing + this.planeIn.econSeatSize;
    }
    
    //returns the array list of rows to the drawMe function below
    return rows;
  }

//makes the rows, and then draws them
  void drawMe() {
    
    ArrayList<Row> rows = this.makeRows();
    for (int i = 0; i < rows.size(); i++) {

      rows.get(i).drawRow();
    }
  }
  
  //same logic as draw, but forwards it to a function that prints it to the text file
  void upload () {
    
    ArrayList<Row> rows = this.makeRows();
    for (int i = 0; i < rows.size(); i++) {

      rows.get(i).uploadRow();
    }
    
  }
}
