// Junyi Xia
// Class for creating and displaying the states for the 3d map and the heatmap
class StateShape {
  PShape shape;
  float x, y;
  String name;
  float z = 0;
  float targetZ = 0;
  boolean showText = false;
  StateShape(String name, PShape shape, float x, float y) {
    this.name = name;
    this.shape = shape;
    this.x = x;
    this.y = y;
  }
  void updateTargetZ(boolean isMouseOver) {
    this.targetZ = isMouseOver ? 0.5 : 0.0;
  }

  void updateZ() {
    float increment = 0.05;

    if (z < targetZ) {
      z = min(z + increment, targetZ);
    } else if (z > targetZ) {
      z = max(z - increment, targetZ);
    }
  }
  void display() {
    pushMatrix();
    translate(x, y, z);
    shape(shape);
    popMatrix();
  }
}
