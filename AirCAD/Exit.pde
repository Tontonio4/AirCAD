

class Exit extends Plane_Part {
 
  float size;
  
  Exit (float x, float y, float s, Plane p) {
    
     this.position = new PVector();
     this.position.x = x;
     this.position.y = y;
     
     this.planeIn = p;
     
     this.size = s;
     
  }
  
  void drawMe() {
    
    float bathroomSideSize;
    float bathroomMidSize;
    
    fill(140);
    
    if (this.planeIn.numCorridors == 2) {
      
      if (this.planeIn.econSeatSize * this.planeIn.econMidWidth > this.planeIn.buisSeatSize * this.planeIn.buisMidWidth) {
        bathroomSideSize = (this.planeIn.planeWidth/2) - (this.planeIn.econSeatSize*this.planeIn.econMidWidth)/2 - this.planeIn.econSeatSize*1.5;
        bathroomMidSize = this.planeIn.econSeatSize*this.planeIn.econMidWidth;
      }
      else {
        bathroomSideSize = (this.planeIn.planeWidth/2) - (this.planeIn.buisSeatSize*this.planeIn.buisMidWidth)/2 - this.planeIn.econSeatSize*1.5;
        bathroomMidSize = this.planeIn.buisSeatSize*this.planeIn.buisMidWidth;
      }
     
      rect(this.position.x, this.position.y-this.planeIn.planeWidth/2, this.size/2, bathroomSideSize);
      rect(this.position.x, this.position.y-this.planeIn.planeWidth/2+bathroomSideSize+this.planeIn.econSeatSize*1.5, this.size*0.7, bathroomMidSize);
      rect(this.position.x, this.position.y+this.planeIn.planeWidth/2-bathroomSideSize, this.size/2, bathroomSideSize);
      
    }
    
    else {
      
      bathroomSideSize = (this.planeIn.planeWidth-this.planeIn.econSeatSize*1.5)/2;
      
      rect(this.position.x, this.position.y-this.planeIn.planeWidth/2, this.size/2, bathroomSideSize);
      rect(this.position.x, this.position.y+this.planeIn.planeWidth/2-bathroomSideSize, this.size/2, bathroomSideSize);
      
    }
  }
  
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
      
    
    this.planeIn.exitPos.print(this.position.x +","+ this.position.y +","+ bathroomSideSize +","+ bathroomMidSize +","+ this.size);
    
  }
}
