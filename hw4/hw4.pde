float patternSize;  
float elementSize;

void setup() {

  size(1210, 1210);
  
  patternSize = width / 4.0;
  elementSize = patternSize / 8.0;
  
  smooth(8);

}

void createTriangle(String orientation, color col) {
  
  fill(col);
  stroke(col);
  
  if (orientation == "LL") {
    beginShape();
    vertex(0, 0);
    vertex(0, elementSize);
    vertex(elementSize, elementSize);
    endShape(CLOSE);
  }
  
  if (orientation == "LR") {
    beginShape();
    vertex(0, elementSize);
    vertex(elementSize, elementSize);
    vertex(elementSize, 0);
    endShape(CLOSE);
  }
  
  if (orientation == "UR") {
    beginShape();
    vertex(0, 0);
    vertex(elementSize, 0);
    vertex(elementSize, elementSize);
    endShape(CLOSE);
  }
  
  if (orientation == "UL") {
    beginShape();
    vertex(0, 0);
    vertex(elementSize, 0);
    vertex(0, elementSize);
    endShape(CLOSE);
  }
  
}

void createPattern(color col) { // 4 unique rows that repeat
  // ROW 1 & 5
  for(int r=0; r<2; r++) {
    pushMatrix();
    
    if (r==1) {
      translate(0, elementSize*4);
    }
    
    for(int i=0; i<8; i++) {
      if (i % 4 < 2) {
        createTriangle("LL", col);
      } else {
        createTriangle("UR", col);
      }
      translate(elementSize, 0);
    }
    popMatrix();
  }
 
  // ROW 2 & 6
  for(int r=0; r<2; r++) {
    pushMatrix();
    translate(0, elementSize);
    
    if (r==1) {
      translate(0, elementSize*4);
    }
    
    for(int i=0; i<8; i++) {
      if ((i+1) % 4 < 2) {
        createTriangle("LL", col);
      } else {
        createTriangle("UR", col);
      }
      translate(elementSize, 0);
    }
    popMatrix();
  }
  
  // ROW 3 & 7
  for(int r=0; r<2; r++) {
    pushMatrix();
    translate(0, elementSize*2);
    
    if (r==1) {
      translate(0, elementSize*4);
    }
    
    for(int i=0; i<8; i++) {
      if ((i) % 4 < 2) {
        createTriangle("UR", col);
      } else {
        createTriangle("LL", col);
      }
      translate(elementSize, 0);
    }
    popMatrix();
  }
  
  // ROW 4 & 8
  for(int r=0; r<2; r++) {
    pushMatrix();
    translate(0, elementSize*3);
    
    if (r==1) {
      translate(0, elementSize*4);
    }
    
    for(int i=0; i<8; i++) {
      if ((i+1) % 4 < 2) {
        createTriangle("UR", col);
      } else {
        createTriangle("LL", col);
      }
      translate(elementSize, 0);
    }
    popMatrix();
  }
}

color redColor = color(255, 62, 46);

void draw() {
  
  background(255, 252, 250);
  smooth(8);
  
  pushMatrix();
  translate(5,5);
  
  // FIRST ROW 
  
  pushMatrix();
  createPattern(color(71, 62, 46));
  popMatrix();
  
  pushMatrix();
  rotate(PI/2);
  translate(0, -patternSize*2);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  pushMatrix();
  translate(patternSize*2, 0);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  pushMatrix();
  rotate(PI/2);
  translate(0, -patternSize*4);
  createPattern(color(71, 62, 46));
  popMatrix();  
  
  // SECOND ROW
  
  pushMatrix();
  rotate(-PI/2);
  translate(-patternSize*2, 0);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  pushMatrix();
  rotate(PI);
  translate(-patternSize*2, -patternSize*2);
  createPattern(color(255, 188, 67));
  popMatrix();
  
  pushMatrix();
  rotate(-PI/2);
  translate(-patternSize*2, patternSize*2);
  createPattern(color(255, 188, 67));
  popMatrix();
  
  pushMatrix();
  rotate(PI);
  translate(-patternSize*4, -patternSize*2);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  // THIRD ROW
  
  pushMatrix();
  translate(0, patternSize*2);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  pushMatrix();
  rotate(PI/2);
  translate(patternSize*2, -patternSize*2);
  createPattern(color(255, 188, 67));
  popMatrix();
  
  pushMatrix();
  translate(patternSize*2, patternSize*2);
  createPattern(color(255, 188, 67));
  popMatrix();
    
  pushMatrix();
  rotate(PI/2);
  translate(patternSize*2, -patternSize*4);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  // FOURTH ROW
  
  pushMatrix();
  rotate(-PI/2);
  translate(-patternSize*4, 0);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  pushMatrix();
  translate(patternSize, patternSize*3);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  pushMatrix();
  translate(patternSize*3, patternSize*3);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  pushMatrix();
  rotate(-PI/2);
  translate(-patternSize*4, patternSize*2);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  pushMatrix();
  translate(patternSize*3, patternSize*3);
  createPattern(color(71, 62, 46));
  popMatrix();
  
  
  popMatrix();
  
  saveFrame("result.jpg");
  
}
