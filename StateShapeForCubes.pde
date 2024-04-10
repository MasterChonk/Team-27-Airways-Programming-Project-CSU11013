// Junyi Xia
// Class for creating the cubes for the 3d map
class StateShapeForCubes {
  PShape shape;
  float x, y;
  String name;

  StateShapeForCubes(String name, PShape shape, float x, float y) {
    this.name = name;
    this.shape = shape;
    this.x = x;
    this.y = y;
  }
  void display() {
    shape(shape, x, y);
  }
}
