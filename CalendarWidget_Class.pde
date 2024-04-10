// Jakub Kieblesz
// Class for creating all the Calendar Widgets 
class CalendarWidget {
  int x, y, width, height, dateNumber;
  String label; 
  color widgetColor, hoverColor, selectedColor, labelColor, baseLabelColor, selectedLabelColor;
  PFont widgetFont, baseFont, selectedFont;
  boolean startDate, endDate, transparent;

  // Constructor for Calendar Widgets
  CalendarWidget(int x, int y, int width, int dateNumber, String label, color hoverColor, color selectedColor, color baseLabelColor, color selectedLabelColor,
        PFont baseFont, PFont selectedFont, boolean startDate, boolean endDate, boolean transparent) {
    this.x = x; this.y = y; this.width = width; this.dateNumber = dateNumber;
    this.label = label; 
    this.hoverColor = hoverColor; this.selectedColor = selectedColor; this.baseLabelColor = baseLabelColor; this.selectedLabelColor = selectedLabelColor;
    this.baseFont = baseFont; this.selectedFont = selectedFont;
    this.startDate = startDate; this.endDate = endDate; this.transparent = transparent;
  }
  // Method for detecting mouse hover
  void mouseMoved() {
    if (dist(mouseX, mouseY, x, y) <= width/2) {
      typeCursor = HAND;
    }
    if (startDate == true || endDate == true) {
      widgetColor = selectedColor;
      labelColor = selectedLabelColor;
      widgetFont = selectedFont;
      transparent = false;
    }
    else {
      if (dist(mouseX, mouseY, x, y) <= width/2) {        
        widgetColor = hoverColor;
        transparent = false;
      }
      else {
        labelColor = baseLabelColor;
        widgetFont = baseFont;
        transparent = true;
      }
    }
  }
  // Drawing the Calendar Widgets
  void draw() {
    if (transparent == true) {
      noFill();
    }
    else {
      fill(widgetColor);
    }
    noStroke();
    circle(x, y, width);
    
    fill(labelColor);
    textFont(widgetFont);
    text(label, x, y);
  }
  // Method for detecting Mouse Pressed on specific Calendar Widget
  boolean getEvent(int mX, int mY) {
    if (dist(mX, mY, x, y) <= width/2) {
      return BUTTON_PRESSED;
    }
    return BUTTON_NOT_PRESSED;
  }
}
