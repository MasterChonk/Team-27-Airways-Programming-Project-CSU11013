class EmptyWidget {
  int x, y, width, height, corner, textAligner;
  String label;
  color baseColor, labelColor;
  PFont font;
  boolean transparent;
  
  EmptyWidget(int x, int y, int width, int height, int corner, int textAligner, String label, color baseColor, color labelColor, PFont font, boolean transparent) {
    this.x = x; this.y = y; this.width = width; this.height = height; this.corner = corner; this.textAligner = textAligner;
    this.label = label;
    this.baseColor = baseColor; this.labelColor = labelColor;
    this.font = font;
    this.transparent = transparent;
  }
  void draw() {
    if (transparent == true) {
      noFill();
    }
    else {
      fill(baseColor);
    }
    noStroke();
    rect(x, y, width, height, corner);
    
    if (label != null && font != null) {
      fill(labelColor);
      textFont(font);
      textAlign(textAligner, CENTER);
      int xLabel = x;
      if (textAligner == CENTER) {
        xLabel += (width/2);
      }
      else {
        xLabel += 10;
      }
      text(label, xLabel, y + (height/2));
    }
  }
}
