// TODO: vignette on edges of background

class Line {
  
  float x, y;
  float xAngle;
  float yAngle;
 
  Line(float _x, float _y, float _xAngle, float _yAngle) {
    this.x = _x;
    this.y = _y;
    this.xAngle = _xAngle;
    this.yAngle = _yAngle;
  }
  
  void update(float _xAngle, float _yAngle) {
    this.xAngle = _xAngle;
    this.yAngle = _yAngle;
    this.x = cos( this.xAngle ) * 500;
    this.y = sin( this.yAngle ) * 300;
  }
  
  void render() {
    strokeWeight(4);
    stroke(255);
    line(x, y-150, x, y+150);
  }
  
}

ArrayList<Line> lines;

float oscillationVal;

void setup() {
  
  size(1400, 1000);
  
  lines = new ArrayList<Line>();
  
  float xAngle, yAngle, x, y;
  
  for (float i=0; i<15; i++) {
    
    xAngle = lerp(0, 2*PI, i / 15.0);
    yAngle = lerp(0, 4*PI, i / 15.0);
    x = cos(xAngle) * 500;
    y = sin(yAngle) * 300;
    
    lines.add(new Line(x, y, xAngle, yAngle));
    
  }
  
  oscillationVal = 0.0;
  
}


void draw() {
  
  background(183, 48, 29);
  
  pushMatrix();
  translate(width/2, height/2);
  
  float xAngle, yAngle;
  
  for (int i=0; i<lines.size(); i++) {
    
    xAngle = lines.get(i).xAngle;
    yAngle = lines.get(i).yAngle;
    
    if (i % 3 == 1) {
      xAngle += .02;
      yAngle += .04;
    }
    
    if (i % 3 == 0) {
      xAngle += .02 - cos(lerp(-PI/10.0, PI/10.0, oscillationVal)) * .005;
      yAngle += .04 - cos(lerp(-PI/10.0, PI/10.0, oscillationVal)) * .01;
    }
    
    if (i % 3 == 2) {
      xAngle += .02 + cos(lerp(-PI/10.0, PI/10.0, oscillationVal)) * .005;
      yAngle += .04 + cos(lerp(-PI/10.0, PI/10.0, oscillationVal)) * .01;
    }
    
    lines.get(i).update(xAngle, yAngle);
    lines.get(i).render();
    
  }

  popMatrix();
  
  oscillationVal += 0.001;
  
  if (oscillationVal >= 1.0) {
    oscillationVal = 0;    
  }
  
}
