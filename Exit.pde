
//sets the class and its variables (x and y pos with how large the scaler  for the plane is) with reference to the plane as well
class Exit extends Plane_Part {
 
  float size;
  
  Exit (float x, float y, float s, Plane p) {
    
     this.position = new PVector();
     this.position.x = x;
     this.position.y = y;
     
     this.planeIn = p;
     
     this.size = s;
     
  }
  
  //draws the bathrooms
  void drawMe() {
    
    float bathroomSideSize;
    float bathroomMidSize;
    
    //sets the fill color
    fill(140);
    
    //if there is 2 coridors in the plane, will draw a bathroom in between the isles as well as on the sides. 
    if (this.planeIn.numCorridors == 2) {
      
      //calcultes which maximum width of the center isle (either the economy or buisness section) and gets how wide the middle bathroom should be using it
      if (this.planeIn.econSeatSize * this.planeIn.econMidWidth > this.planeIn.buisSeatSize * this.planeIn.buisMidWidth) {
        bathroomSideSize = (this.planeIn.planeWidth/2) - (this.planeIn.econSeatSize*this.planeIn.econMidWidth)/2 - this.planeIn.econSeatSize*1.5;
        bathroomMidSize = this.planeIn.econSeatSize*this.planeIn.econMidWidth;
      }
      else {
        bathroomSideSize = (this.planeIn.planeWidth/2) - (this.planeIn.buisSeatSize*this.planeIn.buisMidWidth)/2 - this.planeIn.econSeatSize*1.5;
        bathroomMidSize = this.planeIn.buisSeatSize*this.planeIn.buisMidWidth;
      }
     
     //draws the bathrooms
      rect(this.position.x, this.position.y-this.planeIn.planeWidth/2, this.size/2, bathroomSideSize);
      rect(this.position.x, this.position.y-this.planeIn.planeWidth/2+bathroomSideSize+this.planeIn.econSeatSize*1.5, this.size*0.7, bathroomMidSize);
      rect(this.position.x, this.position.y+this.planeIn.planeWidth/2-bathroomSideSize, this.size/2, bathroomSideSize);
      
    }
    
    //otherwise will just draw bathrooms on the sides
    else {
      
      //calculates the side bathroom size
      bathroomSideSize = (this.planeIn.planeWidth-this.planeIn.econSeatSize*1.5)/2;
      
      //draws the bathrooms
      rect(this.position.x, this.position.y-this.planeIn.planeWidth/2, this.size/2, bathroomSideSize);
      rect(this.position.x, this.position.y+this.planeIn.planeWidth/2-bathroomSideSize, this.size/2, bathroomSideSize);
      
    }
  }
  
  //gets the locations of each of the exits (using the same logic as above) and forwards it to the plane's 
  void upload () {
    
    float bathroomSideSize;
    float bathroomMidSize;
    
    if (this.planeIn.numCorridors == 2) {
      
      if (this.planeIn.econSeatSize * this.planeIn.econMidWidth > this.planeIn.buisSeatSize * this.planeIn.buisMidWidth) {
        bathroomSideSize = (this.planeIn.planeWidth/2) - (this.planeIn.econSeatSize*this.planeIn.econMidWidth)/2 - this.planeIn.econSeatSize*1.5;
        bathroomMidSize = this.planeIn.econSeatSize*this.planeIn.econMidWidth;
      }
      else {
        bathroomSideSize = (this.planeIn.planeWidth/2) - (this.planeIn.buisSeatSize*this.planeIn.buisMidWidth)/2 - this.planeIn.econSeatSize*1.5;
        bathroomMidSize = this.planeIn.buisSeatSize*this.planeIn.buisMidWidth;
      }
    }
    else {
      
      bathroomSideSize = (this.planeIn.planeWidth-this.planeIn.econSeatSize*1.5)/2;
      bathroomMidSize = 0;
    }
      
    //forwards the information to the plane function to print entrance and exit locations
    this.planeIn.exitPos.print(this.position.x +","+ this.position.y +","+ bathroomSideSize +","+ bathroomMidSize);
    
  }
}
