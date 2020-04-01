PShape quad;

void setup(){
  size(800, 800, P3D);
  
  quad = quadBall(200, 51);
}

void draw(){
  background(0);
  
  translate(width/2, height/2, (width+height)/8);
  //rotateX(millis()/17000.0);
  //rotateY(millis()/13000.0);
  
  rotateY(millis()/10000.0);
  shape(quad);
}

PShape quadBall(float r, int facets){
  if(facets < 1) facets = 1;
  PShape ball = createShape();
  ball.beginShape(QUADS);
  ball.stroke(255,0,0);
  ball.strokeWeight(1);
  
  PVector v = new PVector();
  for(int i = -1; i <= 1; i +=2){
    for(int y = 0; y < facets; y ++){
      for(int x = 0; x < facets; x ++){
        v.x = tan(map(x  , 0,facets, PI/-4, PI/4))*r;
        v.y = tan(map(y  , 0,facets, PI/-4, PI/4))*r;
        v.z = r*i;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
        
        v.x = tan(map(x+1, 0,facets, PI/-4, PI/4))*r;
        v.y = tan(map(y  , 0,facets, PI/-4, PI/4))*r;
        v.z = r*i;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
        
        v.x = tan(map(x+1, 0,facets, PI/-4, PI/4))*r;
        v.y = tan(map(y+1, 0,facets, PI/-4, PI/4))*r;
        v.z = r*i;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
        
        v.x = tan(map(x  , 0,facets, PI/-4, PI/4))*r;
        v.y = tan(map(y+1, 0,facets, PI/-4, PI/4))*r;
        v.z = r*i;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
      }
    }
    
    for(int y = 0; y < facets; y ++){
      for(int x = 0; x < facets; x ++){
        v.x = tan(map(x  , 0,facets, PI/-4, PI/4))*r;
        v.y = r*i;
        v.z = tan(map(y  , 0,facets, PI/-4, PI/4))*r;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
        
        v.x = tan(map(x+1, 0,facets, PI/-4, PI/4))*r;
        v.y = r*i;
        v.z = tan(map(y  , 0,facets, PI/-4, PI/4))*r;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
        
        v.x = tan(map(x+1, 0,facets, PI/-4, PI/4))*r;
        v.y = r*i;
        v.z = tan(map(y+1, 0,facets, PI/-4, PI/4))*r;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
        
        v.x = tan(map(x  , 0,facets, PI/-4, PI/4))*r;
        v.y = r*i;
        v.z = tan(map(y+1, 0,facets, PI/-4, PI/4))*r;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
      }
    }
    
    for(int y = 0; y < facets; y ++){
      for(int x = 0; x < facets; x ++){
        v.x = r*i;
        v.y = tan(map(x  , 0,facets, PI/-4, PI/4))*r;
        v.z = tan(map(y  , 0,facets, PI/-4, PI/4))*r;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
        
        v.x = r*i;
        v.y = tan(map(x+1, 0,facets, PI/-4, PI/4))*r;
        v.z = tan(map(y  , 0,facets, PI/-4, PI/4))*r;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
        
        v.x = r*i;
        v.y = tan(map(x+1, 0,facets, PI/-4, PI/4))*r;
        v.z = tan(map(y+1, 0,facets, PI/-4, PI/4))*r;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
        
        v.x = r*i;
        v.y = tan(map(x  , 0,facets, PI/-4, PI/4))*r;
        v.z = tan(map(y+1, 0,facets, PI/-4, PI/4))*r;
        v.setMag(r);
        ball.vertex(v.x, v.y, v.z);
      }
    }
  }
  
  ball.endShape();
  
  return ball;
}
