// Jakub Kieblesz
// Class for displaying each image such as the 2 stock photos and the various icons/flags/logo
class Image {
  int x, y;
  PImage image;
  boolean tint;
  
  // Constructor initialises the image for home and data screens
  Image(int x, int y, PImage image, boolean tint) {
    this.x = x; this.y = y;
    this.image = image;
    this.tint = tint;
  }
  
  // Image is drawn
  void draw() {
    // The tint boolean is checked so that the second stock photo on the data screen can be tinted to make the facts stand out more
    if (tint == true) {
      tint(GREY, 220);
    }
    else {
      noTint();
    }
    image(image, x, y);
  }
}
