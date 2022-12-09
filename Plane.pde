
// bathroom: 

//input will be percentage for each class of sear, automatically makes blocks based on length. 
//input is plane length and % of each class

class Plane {
  //how long/ wide the plane is in pixels
  float planeWidth;
  float planeLength;

  //how wide each block is depending on class
  int buisSideWidth;
  int buisMidWidth;
  int econSideWidth;
  int econMidWidth;
  
  float buisSpacing;
  float econSpacing;
  float firstSpacing;

  float buisSeatSize;
  float econSeatSize;
  float firstSeatSize;
  int numCorridors;
  int distance;
  
  float buisSeatPrice;
  float econSeatPrice;
  
  float buisTotalPrice;
  float econTotalPrice;
  
  float totalPrice;
  
  PrintWriter econPos;
  PrintWriter buisPos;
  PrintWriter planeInfo;
  PrintWriter exitInfo;
  PrintWriter seatBought;

  int numExits;
  int numBlocks;
  float exitSize;
  int numBuisRows;
  int numEconRows;
  int numEconSeats;
  int numBuisSeats;
  float profit;

  Plane(){

    //uses plane length and % of each class to get the the number of blocks of each class and width to get the side and mid width of each class   

    this.updateValues();

  }
  
  
  void updateValues () {
    
    this.buisSideWidth = businessSidesWidth;
    this.buisMidWidth = businessMiddleWidth;
    this.econSideWidth = economySidesWidth;
    this.econMidWidth = economyMiddleWidth;
    
    this.buisSeatPrice = businessPrice();
    this.econSeatPrice = economyPrice();
    
    this.planeLength = width*0.98;
    
    this.econSeatSize = (this.planeLength/planeSize)*0.6;
    this.buisSeatSize = this.econSeatSize*1.15;
    this.firstSeatSize = this.econSeatSize*4;
    
    this.buisSpacing = this.buisSeatSize/2.5;
    this.econSpacing = this.econSeatSize/3;
    this.firstSpacing = this.firstSeatSize/3;
    
    this.distance = planeDistance;
    
    if ((this.econMidWidth > 0 && economyPercent > 0) || (this.buisMidWidth > 0 && businessPercent > 0)) this.numCorridors = 2;
    else this.numCorridors = 1;
    
    if (economyPercent != 0) {
      
      this.planeWidth = this.econSeatSize*this.econSideWidth*2 + this.econSeatSize*this.econMidWidth + numCorridors*this.econSeatSize*1.5;

      if (this.planeWidth < this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5 && businessPercent != 0) {
        this.planeWidth = this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5;
      }   
    }
    else {

      this.planeWidth = this.buisSeatSize*this.buisSideWidth*2 + this.buisSeatSize*this.buisMidWidth + numCorridors*this.econSeatSize*1.5;
    }

    this.exitSize = this.buisSeatSize*2;
    if (planeSize >= 45) this.numExits = 4;
    else if (planeSize >= 33) this.numExits = 3;
    else this.numExits = 2;
    
    this.numBlocks = this.numExits - 1;
    
    this.numBuisRows = int(((this.planeLength - this.numExits*this.exitSize)*businessPercent)/(this.buisSeatSize+this.buisSpacing));
    if (economyPercent != 0) {
      this.numEconRows = int((this.planeLength - this.numExits*this.exitSize - (this.buisSeatSize+this.buisSpacing)*this.numBuisRows)/(this.econSeatSize+this.econSpacing));
    }
    else this.numEconRows = 0;

    this.numBuisSeats = this.buisMidWidth*this.numBuisRows + this.buisSideWidth*2*this.numBuisRows;
    this.numEconSeats = this.econMidWidth*this.numEconRows + this.econSideWidth*2*this.numEconRows;

    this.econTotalPrice = round((this.numEconRows*this.econSeatPrice*this.econSideWidth*2 + this.numEconRows*this.econSeatPrice*this.econMidWidth)*100);
    this.econTotalPrice = this.econTotalPrice/100;
    this.buisTotalPrice = round((this.numBuisRows*this.buisSeatPrice*this.buisSideWidth*2 + this.numBuisRows*this.buisSeatPrice*this.buisMidWidth)*100);
    this.buisTotalPrice = this.buisTotalPrice/100;
    this.totalPrice = round((this.econTotalPrice+this.buisTotalPrice)*100);
    this.totalPrice = this.totalPrice/100;

    this.profit = profitCalc();

  }
  
  ArrayList<Plane_Part> calculatePlane () {
    
    float x = width/2 - this.planeLength/2.0;
    Exit exit;
    Seat_Block block;
    
    ArrayList<Plane_Part> parts = new ArrayList<Plane_Part>();
    
    exit = new Exit(x, height/2, this.exitSize, this);
    parts.add(exit);
    x += this.exitSize;
    
    if (this.numBlocks == 1) {
      
      block = new Seat_Block(x, height/2, 0, this.numBuisRows, this.numEconRows, this);
      parts.add(block);
      x += (this.buisSeatSize+this.buisSpacing)*this.numBuisRows + (this.econSeatSize+this.econSpacing)*this.numEconRows - this.econSpacing;
      exit = new Exit(x, height/2, this.exitSize, this);
      parts.add(exit);
      
    }
    else if (this.numBlocks == 2) {
      
      if (businessPercent >= 0.3 && businessPercent <= 0.5) {
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRows, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*this.numBuisRows - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        
        block = new Seat_Block(x, height/2, 0, 0, this.numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRows - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        
      }
      
      else if (businessPercent <= 0.3) {
        
        int this.numEconRowsPlaced = int((this.planeLength/2 - 1.5*this.exitSize - (this.buisSeatSize+this.buisSpacing)*this.numBuisRows)/(this.econSeatSize+this.econSpacing));
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRows, this.numEconRowsPlaced, this);
        parts.add(block);
        x += ((this.buisSeatSize+this.buisSpacing)*this.numBuisRows + (this.econSeatSize+this.econSpacing)*this.numEconRowsPlaced) - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        
        this.numEconRows -= this.numEconRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, 0, this.numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRows - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        
      }
      else {
        
        int this.numBuisRowsPlaced = int((this.planeLength/2 - 1.5*this.exitSize)/(this.buisSeatSize+this.buisSpacing));
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRowsPlaced, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*this.numBuisRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        this.numBuisRows -= this.numBuisRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRows, this.numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRows + (this.buisSeatSize+this.buisSpacing)*this.numBuisRows - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        
      }
      
    }
    else {
       
      if (businessPercent >= 0.2 && businessPercent <= 0.4) {
      
        int this.numEconRowsPlaced = int(((this.planeLength - this.numExits*this.exitSize)*(1.0/3.0))/(this.econSeatSize+this.econSpacing));
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRows, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*this.numBuisRows - this.econSpacing;                
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        this.numEconRows -= this.numEconRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, 0, this.numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRows - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        block = new Seat_Block(x, height/2, 0, 0, this.numEconRowsPlaced, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        
      }
      else if (businessPercent <= 0.2) {
        
        int this.numEconRowsPlaced = int(((this.planeLength - this.numExits*this.exitSize)*(1.0/3.0))/(this.econSeatSize+this.econSpacing));
        this.numEconRows -= 2*this.numEconRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRows, this.numEconRows, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*this.numBuisRows + (this.econSeatSize+this.econSpacing)*this.numEconRows - this.econSpacing;                
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        block = new Seat_Block(x, height/2, 0, 0, this.numEconRowsPlaced, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        this.numEconRows -= this.numEconRowsPlaced;        
        block = new Seat_Block(x, height/2, 0, 0, this.numEconRowsPlaced, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        
      }
      
      else if (businessPercent >= 0.4 && businessPercent <= 0.6) {
        
        int this.numBuisRowsPlaced = int(((this.planeLength - this.numExits*this.exitSize)*(1.0/3.0))/(this.buisSeatSize+this.buisSpacing));
        int this.numEconRowsPlaced = int(((this.planeLength - this.numExits*this.exitSize)*(1.0/3.0))/(this.econSeatSize+this.econSpacing));
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRowsPlaced, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*this.numBuisRowsPlaced - this.econSpacing;                
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        this.numBuisRows -= this.numBuisRowsPlaced;
        this.numEconRows -= this.numEconRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRows, this.numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRows + (this.buisSeatSize+this.buisSpacing)*this.numBuisRows - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        block = new Seat_Block(x, height/2, 0, 0, this.numEconRowsPlaced, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        
      }
      
      else if (businessPercent >= 0.6 && businessPercent <= 0.7) {
       
        int this.numBuisRowsPlaced = int(((this.planeLength - this.numExits*this.exitSize)*(1.0/3.0))/(this.buisSeatSize+this.buisSpacing));
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRowsPlaced, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*this.numBuisRowsPlaced - this.econSpacing;                
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        this.numBuisRows -= this.numBuisRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRows, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*this.numBuisRows - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        block = new Seat_Block(x, height/2, 0, 0, this.numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRows - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        
      }
      
      else {
        
        int this.numBuisRowsPlaced = int(((this.planeLength - this.numExits*this.exitSize)*(1.0/3.0))/(this.buisSeatSize+this.buisSpacing));
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRowsPlaced, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*this.numBuisRowsPlaced - this.econSpacing;                
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        this.numBuisRows -= this.numBuisRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRowsPlaced, 0, this);
        parts.add(block);
        x += (this.buisSeatSize+this.buisSpacing)*this.numBuisRowsPlaced - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        x += this.exitSize;
        
        this.numBuisRows -= this.numBuisRowsPlaced;
        
        block = new Seat_Block(x, height/2, 0, this.numBuisRows, this.numEconRows, this);
        parts.add(block);
        x += (this.econSeatSize+this.econSpacing)*this.numEconRows + (this.buisSeatSize+this.buisSpacing)*this.numBuisRows - this.econSpacing;
        exit = new Exit(x, height/2, this.exitSize, this);
        parts.add(exit);
        
      }
    }
    
    return parts;
    
  }
  
  void drawPlane() {
    
    ArrayList<Plane_Part> parts = calculatePlane();
    
    fill(240);
    rect(0, height/2 - this.planeWidth/2- (this.buisSeatSize*0.2), width, this.planeWidth + (this.buisSeatSize*0.4));
    
    fill(0);
    textSize(30);
    text("Price Per Seat:", 20, 30);
    textSize(20);
    text("Economy Class:     $" + this.econSeatPrice, 50, 55); 
    text("Business Class:      $" + this.buisSeatPrice, 50, 75); 
    
    textSize(30);
    text("Total Price:", 300, 30);
    textSize(20);
    text("Economy Class:     $" + this.econTotalPrice, 330, 55); 
    text("Business Class:      $" + this.buisTotalPrice, 330, 75);    
    
    textSize(30);
    text("Total:        $" + this.totalPrice, 650, 30);
    text("Total Profit: $" + profitCalc(), 650, 70);
    float percentProfit  = round((profitCalc()/this.totalPrice)*10000);
    percentProfit = percentProfit/100;
    text("% Profit: " + percentProfit + "%", 1000, 50);
    
    
    for (int i = 0; i < parts.size(); i++) {
    
      parts.get(i).drawMe();
    }
  }
  
  void uploadPlane() {
    
    ArrayList<Plane_Part> parts = calculatePlane();
    
    this.econPos = createWriter("TicketBuy/econPos.txt");
    this.buisPos = createWriter("TicketBuy/buisPos.txt");
    this.planeInfo = createWriter("TicketBuy/planeInfo.txt");
    this.exitInfo = createWriter("TicketBuy/exitInfo.txt");
    this.seatBought = createWriter("TicketBuy/seatBought.txt");
    
    for (int i = 0; i < parts.size(); i++) { 
      parts.get(i).upload();
    }
    
    this.planeInfo.print(this.planeWidth +","+ this.numCorridors +","+ this.econSeatSize +","+ this.buisSeatSize +","+ this.econSeatPrice +","+ this.buisSeatPrice);
    
    this.econPos.flush();
    this.buisPos.flush();
    this.planeInfo.flush();
    this.exitInfo.flush();
    this.seatBought.flush();
    
    this.econPos.close();
    this.buisPos.close();
    this.planeInfo.close();
    this.exitInfo.close();
    this.seatBought.close();
  }
  
  
  
  
  float profitCalc(){

    int planeSizeFeePercent = 50-planeSize; //check planeSize variable
    
    //float economyPrice = 159.41 + (0.09364*this.distance);
    //economyPrice += planeSizeFeePercent/100.0*economyPrice;
    
    //float businessPrice = (0.336*this.distance) + 82.2;
    //businessPrice += planeSizeFeePercent/100.0*businessPrice;
    
    float time = this.distance/850.0; //assume plane goes at a constant 850 km/h 
    int numSeats = this.numEconSeats+this.numBuisSeats;                               
    
    float totalExpense = time*numSeats*85;
    
    float income = this.totalPrice;
    
    profit = income-totalExpense;
    
    profit = round(profit*100);
    profit = profit/100;
    
    return profit;
  }

  float economyPrice(){

    int planeSizeFeePercent = 50-planeSize; //check planeSize variable
    
    float economyPrice = 159.41 + (0.09364*this.distance);
    economyPrice += planeSizeFeePercent/100.0*economyPrice;
    
    economyPrice = round(economyPrice*100);
    economyPrice = economyPrice/100;
    
    return economyPrice;
  }
  
  float businessPrice(){

    int planeSizeFeePercent = 50-planeSize; //check planeSize variable
    
    float businessPrice = (0.336*this.distance) + 82.2;
    businessPrice += planeSizeFeePercent/100.0*businessPrice;
    
    businessPrice = round(businessPrice*100);
    businessPrice = businessPrice/100;
    
    return businessPrice;
  }
  
  
}
