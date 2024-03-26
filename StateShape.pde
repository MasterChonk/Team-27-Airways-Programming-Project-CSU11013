class StateShape {
  PShape shape;
  float x, y;
  String name;

  StateShape(String name, PShape shape, float x, float y) {
    this.name = name;
    this.shape = shape;
    this.x = x;
    this.y = y;
  }

  void display() {
    shape(shape, x, y);
  }
}
