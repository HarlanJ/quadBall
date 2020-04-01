PShape quadBall;

// ====================== Inputs ====================== 
// diameter of the quadBall
float diam = 200;
//subdivision level. Essentially an index of the set of odd numbers. 0->1(cube), 1->3, 2->5, 3->7, ... 
int n = 2;

void setup(){
  size(800, 800, P3D);
  
  quadBall = createShape();
  
  int divs = 1+2*n;
  println(divs);
  
  float divSize = diam / divs;
  float rad = diam / 2;
  quadBall.beginShape(QUADS);
  PVector corner = new PVector();
  PVector v = new PVector();
  // XY
  for(int j = -1; j <= 1; j += 2){
    corner.set(-rad, -rad, rad*j);
    for(int i = 0; i < divs*divs; i ++){
      v.set(corner.x, corner.y, corner.z);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      v.set(corner.x+divSize, corner.y, corner.z);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      v.set(corner.x+divSize, corner.y+divSize, corner.z);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      v.set(corner.x, corner.y+divSize, corner.z);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      corner.add(divSize, 0, 0);
      if(corner.x > rad-divSize/2){
        corner.x = -rad;
        corner.y += divSize;
      }
    }
    
    //XZ
    corner.set(-rad, rad*j, -rad);
    for(int i = 0; i < divs*divs; i ++){
      v.set(corner.x, corner.y, corner.z);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      v.set(corner.x+divSize, corner.y, corner.z);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      v.set(corner.x+divSize, corner.y, corner.z+divSize);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      v.set(corner.x, corner.y, corner.z+divSize);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      corner.add(divSize, 0, 0);
      if(corner.x > rad-divSize/2){
        corner.x = -rad;
        corner.z += divSize;
      }
    }
    
    // YZ
    corner.set(rad*j, -rad, -rad);
    for(int i = 0; i < divs*divs; i ++){
      v.set(corner.x, corner.y, corner.z);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      v.set(corner.x, corner.y+divSize, corner.z);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      v.set(corner.x, corner.y+divSize, corner.z+divSize);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      v.set(corner.x, corner.y, corner.z+divSize);
      v.setMag(rad);
      quadBall.vertex(v.x, v.y, v.z);
      
      corner.add(0, divSize, 0);
      if(corner.y > rad-divSize/2){
        corner.y = -rad;
        corner.z += divSize;
      }
    }
  }
  quadBall.endShape();
}

void draw(){
  background(0);
  
  translate(width/2, height/2, (width+height)/6);
  rotateY(millis()/11000.0 * TWO_PI);
  rotateX(millis()/7000.0 * TWO_PI);
  shape(quadBall);
}
