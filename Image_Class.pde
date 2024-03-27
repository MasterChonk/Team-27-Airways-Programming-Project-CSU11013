class Image {
  int x, y;
  PImage image;
  
  Image(int x, int y, PImage image) {
    this.x = x; this.y = y;
    this.image = image;
  }
  void draw() {
    image(image, x, y);
  }
}
