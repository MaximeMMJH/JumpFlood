ArrayList<Point> seeds = new ArrayList();
int stepSize;
color black = color(0);

void setup() {
  size(500,500);
  
  //define starting point
  definePoint(250, 250);
  stepSize = 200 / 2;
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
  
  set(x, y, black);
}

class Point {
  Point (int x, int y) {
    this.x = x;
    this.y = y;
  }
  
  int x;
  int y;
}
