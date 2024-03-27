class Widget {
  int x, y, width, height, corner, textAligner, moveScreen;
  String label; 
  color widgetColor, baseColor, hoverColor, labelColor;
  PFont widgetFont;

  Widget(int x, int y, int width, int height, int corner, int textAligner, int moveScreen, String label, color baseColor, color hoverColor, color labelColor, PFont widgetFont) {
    this.x = x; this.y = y; this.width = width; this.height = height; this.corner = corner; this.textAligner = textAligner; this.moveScreen = moveScreen;
    this.label = label; 
    this.baseColor = baseColor; this.hoverColor = hoverColor; this.labelColor = labelColor;
    this.widgetFont = widgetFont; 
  }
  void mouseMoved() {
    if (moveScreen == DATA_SCREEN && (startDate == 0 || endDate == 0 || airportCode == null)) {
      widgetColor = GREY;      
    }
    else if (mouseX >= x && mouseX <= x+width && mouseY >= y && mouseY <= y+height) {
      widgetColor = hoverColor;
      typeCursor = HAND;
    }
    else {
      widgetColor = baseColor;
    }
  }
  void draw() { 
    fill(widgetColor);   
    noStroke();       
    rect(x, y, width, height, corner);
    
    fill(labelColor);
    textFont(widgetFont);
    textAlign(textAligner, CENTER);
    int xLabel = x;
    if (textAligner == CENTER) {
      xLabel += (width/2);
    }
    else {
      xLabel += 20;
    }
    if (label != null) {
      text(label, xLabel, y + (height/2));
    }
  }
  boolean getEvent(int mX, int mY) {
    if (mX > x && mX < x+width && mY > y && mY < y+height) {  // && widgetColor != GREY
      return BUTTON_PRESSED;
    }
    return BUTTON_NOT_PRESSED;
  }
}
