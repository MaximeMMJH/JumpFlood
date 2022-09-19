ArrayList<Point> seeds = new ArrayList();
int stepSize;

int gapSize = 1;
int rectSize = 10;


color black = color(0);
color white = color(255);

void setup() {
  size(500, 500);
  
  noStroke();
  
  fill(white);
  
  for (int i = 0; i < 50; i++) {
    rect(0, i * (rectSize + gapSize) - gapSize, 500, gapSize);
  }
  
  for (int i = 0; i < 50; i++) {
    rect(i * (rectSize + gapSize) - gapSize, 0, gapSize, 500);
  }
  
  fill(black);
  
  //define starting point
  definePoint(20, 20);
  stepSize = 20 / 2;
}

void draw() {
  if (stepSize >= 1) {
    
    //delay to visualize
    delay(1000);

    //iterate through seeds
    int nrOfSeeds = seeds.size();
    
    for (int i = 0; i < nrOfSeeds; i++) {
      Point point = seeds.get(i); 
      
      //define 8 surrounding points
      definePoint(point.x + stepSize, point.y + stepSize);
      definePoint(point.x + stepSize, point.y - stepSize);
      definePoint(point.x + stepSize, point.y);
      definePoint(point.x - stepSize, point.y + stepSize);
      definePoint(point.x - stepSize, point.y - stepSize);
      definePoint(point.x - stepSize, point.y);
      definePoint(point.x, point.y + stepSize);
      definePoint(point.x, point.y - stepSize);
    }
    
    stepSize = stepSize / 2;
  }
}

void definePoint(int x, int y) {
  Point point = new Point(x, y);
  seeds.add(point);
  
  rect(x * (rectSize + gapSize), y * (rectSize + gapSize), rectSize, rectSize);
}

class Point {
  Point (int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  int x;
  int y;
}
